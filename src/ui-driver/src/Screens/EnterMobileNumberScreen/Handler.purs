{-
 
  Copyright 2022-23, Juspay India Pvt Ltd
 
  This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License
 
  as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program
 
  is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 
  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of
 
  the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}

module Screens.EnterMobileNumberScreen.Handler where
import Engineering.Helpers.BackTrack (getState, liftFlowBT)
-- import Engineering.Helpers.Commons (markPerformance)
import Prelude (bind, pure, ($), (<$>),discard)
import Screens.EnterMobileNumberScreen.Controller (ScreenOutput(..))
-- import Storage (KeyStore(..), setValueToLocalStore)
import Control.Monad.Except.Trans (lift)
import Control.Transformers.Back.Trans (BackT(..), FailBack(..)) as App
import PrestoDOM.Core.Types.Language.Flow (runScreen)
import Screens.EnterMobileNumberScreen.View as EnterMobileNumberScreen
import Types.App (FlowBT, GlobalState(..),ScreenType(..), ENTER_MOBILE_NUMBER_SCREEN_OUTPUT(..))
import Types.ModifyScreenState (modifyScreenState)
import React.Navigation.Navigate (initScaffold, navigateToScreen)

enterMobileNumberScreen :: FlowBT String ENTER_MOBILE_NUMBER_SCREEN_OUTPUT
enterMobileNumberScreen = do
  (GlobalState state) <- getState
--   liftFlowBT $ markPerformance "ENTER_MOBILE_NUMBER_SCREEN"
  act <- lift $ lift $ navigateToScreen $ EnterMobileNumberScreen.screen state.mobileNumberScreen
  case act of
    GoBack -> do 
    --   modifyScreenState $ EnterMobileNumberScreenType (\enterMobileNumber → enterMobileNumber { data { mobileNumber = ""}, props{btnActive = false}})
      App.BackT $ pure App.GoBack
    GoToNextScreen updatedState -> do
    --   _ <- setValueToLocalStore MOBILE_NUMBER_KEY updatedState.data.mobileNumber
    --   modifyScreenState $ EnterOTPScreenType (\enterOTPScreen → enterOTPScreen { data {mobileNo = updatedState.data.mobileNumber}})
    --   modifyScreenState $ EnterMobileNumberScreenType (\enterMobileNumberScreenScreen → updatedState)
      App.BackT $ App.BackPoint <$> pure (GO_TO_ENTER_OTP updatedState)
