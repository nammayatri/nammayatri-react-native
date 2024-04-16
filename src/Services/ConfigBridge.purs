module ConfigBridge where

import Presto.Core.Flow (Flow)
import Prelude (Unit, (<<<), show, class Show, bind, discard, pure, unit)
import Data.Show.Generic (genericShow)
import Data.Generic.Rep (class Generic)
import Debug (spy)
import Prelude (($))
import Presto.Core.Types.Language.Flow (Flow, doAff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)

-- foreign import setKeyValue :: String -> String -> EffectFnAff Unit
-- foreign import getValueByKey :: String -> EffectFnAff String

-- setKeyInSharedPrefKeys :: forall st. String -> String -> Flow st Unit
-- setKeyInSharedPrefKeys key value = do
--   _ <- doAff do (fromEffectFnAff (setKeyValue key value))
--   pure unit

-- getKeyInSharedPrefKeys :: forall st. String -> Flow st String
-- getKeyInSharedPrefKeys key = do
--   res <- doAff do (fromEffectFnAff <<< getValueByKey $ key)
--   pure res

foreign import setKeyValue :: String -> String -> EffectFnAff Unit
foreign import getValueByKey :: String -> EffectFnAff String

setKeyInSharedPrefKeys :: forall st. String -> String -> Flow st Unit
setKeyInSharedPrefKeys key value = do
  _ <- doAff do (fromEffectFnAff (setKeyValue key value))
  pure unit

getKeyInSharedPrefKeys :: forall st. String -> Flow st String
getKeyInSharedPrefKeys key = do
  res <- doAff do (fromEffectFnAff <<< getValueByKey $ key)
  pure res

-- just for now | move to Storage /src/Helpers

data KeyStore = WELCOME
              | BYE

derive instance genericKeyStore :: Generic KeyStore _
instance showKeyStore :: Show KeyStore where
  show = genericShow