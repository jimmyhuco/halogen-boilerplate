module Main where

import Prelude

import Control.Monad.Aff (forkAff)
import Control.Monad.Eff (Eff)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import Layouts.Main (component, routeSignal)

main :: Eff (HA.HalogenEffects ()) Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  app <- runUI component unit body
  forkAff $ routeSignal app