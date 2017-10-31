module Routers where

import Prelude ((*>))
import Control.Alt ((<$), (<|>))

import Routing.Match (Match)
import Routing.Match.Class (lit)


data Routes = Home | About

routing :: Match Routes
routing = about <|> home
  where
    home = Home <$ lit ""
    about = About <$ route "about"
    route str = lit "" *> lit str