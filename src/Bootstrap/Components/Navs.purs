module Bootstrap.Components.Navs where


import Prelude (map, (==), ($), otherwise)

import Halogen.HTML (ClassName(..))
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

type Link = {
  text :: String,
  active :: Boolean,
  url :: String
}

active :: ClassName
active = ClassName "active"

nav :: ClassName
nav = ClassName "nav"

navLink :: ClassName
navLink = ClassName "nav-link"

disabled :: ClassName
disabled = ClassName "disabled"

navHTML :: forall p i. Array Link -> HH.HTML p i
navHTML links = HH.nav [ HP.class_ nav] $ map link links

  where
    link el 
      | el.active == true = HH.a [ HP.classes [navLink, active], HP.href el.url ] [ HH.text el.text ]
      | otherwise = HH.a [ HP.class_ navLink, HP.href el.url ] [ HH.text el.text ]