module ConfigBridge where

import Effect (Effect)
import Presto.Core.Flow (Flow)
import Prelude (Unit, (<<<), show, class Show)
import Engineering.Helpers.Commons (liftFlow)
import Data.Show.Generic (genericShow)
import Data.Generic.Rep (class Generic)
import Debug (spy)
import Prelude (($))

foreign import setKeyInSharedPrefKeysImpl :: String -> String -> Effect Unit

foreign import getKeyInSharedPrefKeysImpl :: String -> String

setKeyInSharedPrefKeys :: forall st. String -> String -> Flow st Unit
setKeyInSharedPrefKeys key val = spy "I am here in setKeyInSharedPrefKeys " $ liftFlow (setKeyInSharedPrefKeysImpl key val)

getKeyInSharedPrefKeys :: forall st. KeyStore -> String
getKeyInSharedPrefKeys = spy "I am here in getKeyInSharedPrefKeys" getKeyInSharedPrefKeysImpl <<< show

-- just for now | move to Storage /src/Helpers

data KeyStore = WELCOME
              | BYE

derive instance genericKeyStore :: Generic KeyStore _
instance showKeyStore :: Show KeyStore where
  show = genericShow