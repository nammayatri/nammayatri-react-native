module Common.Types.App where

import Prelude (class Eq, class Show, ($))
import Presto.Core.Utils.Encoding (defaultDecode, defaultEncode, defaultEnumDecode, defaultEnumEncode)

import Data.Generic.Rep (class Generic)
import Data.Show.Generic (genericShow)
import Data.Newtype (class Newtype)
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)
import Data.Eq.Generic (genericEq)
import Foreign (Foreign)
import Presto.Core.Types.API (standardEncode,class StandardEncode)
import Foreign.Generic (class Decode, class Encode)
import Control.Monad.Free (Free)
import Control.Monad.Except.Trans (ExceptT)
import Presto.Core.Types.Language.Flow (FlowWrapper)
import Control.Transformers.Back.Trans (BackT)
import Control.Transformers.Back.Trans (runBackT)
import Data.Maybe (Maybe(..))

type FlowBT e st a = BackT (ExceptT e (Free (FlowWrapper st))) a
