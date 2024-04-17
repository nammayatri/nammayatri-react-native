{-

  Copyright 2022-23, Juspay India Pvt Ltd

  This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License

  as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program

  is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY

  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of

  the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}

module Screens.Types where

-- import Foreign.Object (Object) - it is not importing


--------------------------------------------------------------- EnterMobileNumberScreenState -----------------------------------------------------------------------------
type EnterMobileNumberScreenState = {
  data :: EnterMobileNumberScreenStateData,
  props :: EnterMobileNumberScreenStateProps
}

type EnterMobileNumberScreenStateData = {
    mobileNumber :: String
    -- logField :: Object Foreign
    -- config :: AppConfig
}

type EnterMobileNumberScreenStateProps = {
  btnActive :: Boolean,
  isValid :: Boolean,
  mobileNumberEditFocused :: Boolean
}

type EnterOTPScreenState = {
  data :: EnterOTPScreenStateData,
  props :: EnterOTPScreenStateProps
}

type EnterOTPScreenStateData = {
  otp :: String,
  tokenId :: String,
  attemptCount :: Int,
  mobileNo :: String,
  timer :: String,
  capturedOtp :: String,
  focusedIndex :: Int,
  editTextId :: String
  -- config :: AppConfig
}

type EnterOTPScreenStateProps = {
  btnActive :: Boolean,
  isValid :: Boolean,
  resendEnabled :: Boolean,
  otpTmp :: Boolean
}