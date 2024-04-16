{-
 
  Copyright 2022-23, Juspay India Pvt Ltd
 
  This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License
 
  as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program
 
  is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 
  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of
 
  the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}

module Types.ModifyScreenState where

import Data.Lens ((^.))
import Data.Maybe (Maybe(..))
import Engineering.Helpers.BackTrack (modifyState, getState)
import Prelude (Unit, bind, ($))
import Types.App (FlowBT, GlobalState(..), ScreenType(..))

modifyScreenState :: ScreenType -> FlowBT String Unit
modifyScreenState st =
  case st of
    EnterMobileNumberScreenType a -> modifyState (\(GlobalState  state) -> GlobalState  $ state { mobileNumberScreen = a state.mobileNumberScreen})

data FlowState = HelpAndSupportScreenFlow 
               | IssueReportChatScreenFlow
               | RideSelectionScreenFlow
               | HomeScreenFlow
               | ActivateSafetyScreenFlow
               | TripDetailsScreenFlow
               | ContactUsScreenFlow
               | MyRidesScreenFlow