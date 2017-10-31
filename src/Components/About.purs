module Components.About where

import Prelude

import Data.Maybe (Maybe(..))

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

import Bootstrap.Utilities.Sizing as US


data Slot = Slot
derive instance eqSlot :: Eq Slot
derive instance ordSlot :: Ord Slot

type State = Unit

data Query a = Unit a

demoImg :: String
demoImg = "https://images.unsplash.com/photo-1489403290543-f9908e831043?auto=format&fit=crop&w=1050&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D"

component :: forall m. H.Component HH.HTML Query Unit Void m
component =
  H.component
    { initialState: const unit
    , render
    , eval
    , receiver: const Nothing
    }
  where

    render :: State -> H.ComponentHTML Query
    render state = HH.div_
      [ 
        HH.h1_ [ HH.text "This is About Page"],
        HH.p_ [ HH.img [ HP.src demoImg, HP.class_ US.w50 ] ]
      ]

    eval :: Query ~> H.ComponentDSL State Query Void m
    eval (Unit a) = pure a