module Layouts.Main where

import Prelude

import Bootstrap.Layout as L
import Components.About as CAbout
import Components.Home as CHome
import Control.Monad.Aff (Aff, launchAff_)
import Control.Monad.Eff (Eff)
import Data.Either.Nested (Either4)
import Data.Functor.Coproduct.Nested (Coproduct4)
import Data.Maybe (Maybe(..))
import Halogen as H
import Halogen.Aff as HA
import Halogen.Component.ChildPath (cp1, cp2, cp3, cp4)
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Layouts.Footer as LFooter
import Layouts.Header as LHeader
import Routers as RT
import Routing (matches)

data Query a = GOTO RT.Routes a

type ChildQuery = Coproduct4 LHeader.Query CHome.Query CAbout.Query LFooter.Query
type ChildSlot = Either4 LHeader.Slot CHome.Slot CAbout.Slot LFooter.Slot

type Input = Unit

type Output = Void

type State = RT.Routes

initialState :: State
initialState = RT.Home


component :: forall m. H.Component HH.HTML Query Input Output m
component = H.parentComponent
  { initialState: const initialState
  , render: render
  , eval: eval
  , receiver: const Nothing
  }
  where
    render :: State -> H.ParentHTML Query ChildQuery ChildSlot m
    render state = HH.div
      [ HP.class_ L.container ]
      [
        HH.slot' cp1 LHeader.Slot LHeader.component state absurd, --header
        renderPage state, --main
        HH.slot' cp4 LFooter.Slot LFooter.component unit absurd --footer
      ]

    renderPage :: RT.Routes -> H.ParentHTML Query ChildQuery ChildSlot m
    renderPage RT.Home =
      HH.slot' cp2 CHome.Slot CHome.component unit absurd
    renderPage RT.About =
      HH.slot' cp3 CAbout.Slot CAbout.component unit absurd

    eval :: Query ~> H.ParentDSL State Query ChildQuery ChildSlot Output m
    eval (GOTO route next) = do
      H.put route
      pure next


matchRoutes :: forall eff. H.HalogenIO Query Void (Aff (HA.HalogenEffects eff))
          -> Eff (HA.HalogenEffects eff) Unit
matchRoutes app = matches RT.routing (redirects app)
  where
    redirects driver _ = launchAff_ <<< driver.query <<< H.action <<< GOTO
