{-

  Copyright 2022-23, Juspay India Pvt Ltd

  This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License

  as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program

  is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY

  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of

  the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}

module Types.App where

import Control.Monad.Except.Trans (ExceptT)
import Control.Monad.Free (Free)
import Control.Transformers.Back.Trans (BackT)
import Foreign (Foreign)
import Foreign.Object (Object(..), empty)
import Presto.Core.Types.Language.Flow (FlowWrapper)
import Screens.EnterMobileNumberScreen.ScreenData as EnterMobileNumberScreenData
import Screens.Types (EnterMobileNumberScreenState)
import Foreign.Object ( Object(..), empty)
import Foreign (Foreign)
import Data.Maybe (Maybe(..))

type FlowBT e a = BackT (ExceptT e (Free (FlowWrapper GlobalState))) a

newtype GlobalState = GlobalState {
    mobileNumberScreen :: EnterMobileNumberScreenState
  }

defaultGlobalState :: GlobalState
defaultGlobalState = GlobalState {
    mobileNumberScreen : EnterMobileNumberScreenData.initData
  }

data ENTER_MOBILE_NUMBER_SCREEN_OUTPUT = GO_TO_ENTER_OTP EnterMobileNumberScreenState

data ScreenType =
    EnterMobileNumberScreenType (EnterMobileNumberScreenState -> EnterMobileNumberScreenState)
