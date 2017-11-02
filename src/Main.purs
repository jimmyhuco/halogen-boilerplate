module Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import Layouts.Main (component, matchRoutes)

main :: forall eff . Eff (HA.HalogenEffects eff) Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  app <- runUI component unit body
  liftEff $ matchRoutes app