module Layouts.Header where


import Prelude (class Eq, class Ord, type (~>), Void, const, discard, pure)

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE

import Routers (Routes(..))

import Bootstrap.Components.Navs as N


data Slot = Slot
derive instance eqSlot :: Eq Slot
derive instance ordSlot :: Ord Slot

type State = Array N.Link

type Input = Routes

data Query a = HandleInput Input a

homeActive :: State
homeActive = [
  {
    text: "Home",
    active: true,
    url: "#/"
  }, {
    text: "About",
    active: false,
    url: "#/about"
  }
]

aboutActive :: State
aboutActive = [
  {
    text: "Home",
    active: false,
    url: "#/"
  }, {
    text: "About",
    active: true,
    url: "#/about"
  }
]


component :: forall m. H.Component HH.HTML Query Input Void m
component =
  H.component
    { initialState: const homeActive
    , render
    , eval
    , receiver: HE.input HandleInput
    }
  where

    render :: State -> H.ComponentHTML Query
    render = N.navHTML 


    eval :: Query ~> H.ComponentDSL State Query Void m
    eval = case _ of
      HandleInput s next -> do
        case s of
          About-> H.put aboutActive
          _ -> H.put homeActive
        pure next