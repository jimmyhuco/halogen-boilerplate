module Routers where

import Control.Alt ((<$), (<|>))
import Prelude (class Show, (*>))
import Routing.Match (Match, lit)

data Routes = Home | About

instance showRoutes :: Show Routes where
  show Home = "Home"
  show About = "About"

routing :: Match Routes
routing = about <|> home
  where
    home = Home <$ lit ""
    about = About <$ route "about"
    route str = lit "" *> lit str