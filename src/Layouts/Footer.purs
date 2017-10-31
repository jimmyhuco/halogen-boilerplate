module Layouts.Footer where

import Prelude

import Data.Maybe (Maybe(..))

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

import Bootstrap.Layout as L
import Bootstrap.Utilities.Position as UP

data Slot = Slot
derive instance eqSlot :: Eq Slot
derive instance ordSlot :: Ord Slot

type State = Unit

data Query a = Unit a

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
    render state = 
      HH.footer [ HP.classes [L.container, UP.fixedBottom] ] [ HH.text "Footer Footer Footer Footer Footer Footer Footer" ]
    

    eval :: Query ~> H.ComponentDSL State Query Void m
    eval (Unit a) = pure a