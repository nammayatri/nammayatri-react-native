{-
 
  Copyright 2022-23, Juspay India Pvt Ltd
 
  This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License
 
  as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program
 
  is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 
  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of
 
  the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}

module Screens.EnterMobileNumberScreen.Controller where
import Prelude (class Show, not, pure, unit, (&&), (<=), (==), (||), discard, bind, ($), (>))
import PrestoDOM (Eval, continue, continueWithCmd, exit)
import Screens.Types (EnterMobileNumberScreenState)
import Data.String (length)
import Data.String.CodeUnits (charAt)
import Data.Maybe (Maybe(..))
import Effect.Class (liftEffect)
import Effect.Unsafe (unsafePerformEffect)
import PrestoDOM.Types.Core (class Loggable)

instance showAction :: Show Action where
  show _ = ""

instance loggableAction :: Loggable Action where
  performLog action appId = pure unit

data ScreenOutput = GoBack | GoToNextScreen EnterMobileNumberScreenState

data Action = BackPressed 
            | NoAction
            | CheckBoxClicked
            | CheckClickability
            | AfterRender
            | NonDisclosureAgreementAction

eval :: Action -> EnterMobileNumberScreenState -> Eval Action ScreenOutput EnterMobileNumberScreenState
eval AfterRender state = continue state
eval BackPressed state = do
        exit GoBack

eval _ state = continue state