module Engineering.Helpers.Commons where

import Prelude
import Effect (Effect)
import Presto.Core.Types.Language.Flow (Flow, doAff)
import Effect.Class (liftEffect)

liftFlow :: forall val st. (Effect val)  -> Flow st val
liftFlow effVal = doAff do liftEffect (effVal)