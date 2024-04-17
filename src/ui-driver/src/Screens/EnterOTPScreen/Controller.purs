module Screens.EnterOTPScreen.Controller where

import Prelude
import PrestoDOM.Types.Core (class Loggable)
import Screens.Types
import PrestoDOM (Eval, continue, continueWithCmd, exit, updateAndExit)
import Data.String (length)
-- import Storage (setValueToLocalNativeStore, KeyStore(..))
-- import Storage (setValueToLocalNativeStore, setValueToLocalStore, KeyStore(..))



instance showAction :: Show Action where
  show _ = ""

instance loggableAction :: Loggable Action where
  performLog action appId = pure unit
  
data ScreenOutput = GoBack  EnterOTPScreenState | GoToHome EnterOTPScreenState | Retry EnterOTPScreenState
data Action = BackPressed 
            | ResendOTP
            -- | PrimaryEditTextAction PrimaryEditText.Action
            -- | PrimaryButtonActionController PrimaryButton.Action
            | NoAction
            | AutoFill String 
            | SetToken String
            | TIMERACTION String
            | AfterRender

eval :: Action -> EnterOTPScreenState -> Eval Action ScreenOutput EnterOTPScreenState
eval AfterRender state = continue state
eval BackPressed state = do 
--   _ <- pure $ toggleBtnLoader "" false -- JBridge function
  exit $ GoBack state{props{isValid = false}} 
-- eval (PrimaryEditTextAction PrimaryEditText.OnClick) state = continue state
-- eval (PrimaryButtonActionController (PrimaryButton.OnClick)) state = do
--   _ <- pure $ hideKeyboardOnNavigation true 
--   exit (GoToHome state)
eval (ResendOTP) state = do
  if state.props.resendEnabled then exit (Retry state)
  else continue state
eval (TIMERACTION time) state = do
    if time == "EXPIRED" then do 
      continue state { data = state.data {timer = "10s"}, props = state.props{resendEnabled = true}}
      else continue $ state {  data = state.data {timer = time }, props = state.props{resendEnabled = false}}
-- eval (PrimaryEditTextAction (PrimaryEditText.TextChanged valId newVal)) state = do
--   let newState = state { props = state.props { btnActive = if length newVal == 4 then true else false, isValid = false}
--                   , data = state.data { otp = if length newVal <= 4 then newVal else state.data.otp }}
--   if length newVal >= 4 then do
--       _ <- pure $ hideKeyboardOnNavigation true
--       exit (GoToHome newState)
--       else continue newState
  

eval (AutoFill otpReceived) state = do 
--   _ <- pure $ firebaseLogEvent "ny_driver_otp_autoread" -- JBridge function
  updateAndExit (state { data {capturedOtp = otpReceived, otp = if (length otpReceived) == 4 then otpReceived else state.data.otp } }) $ GoToHome (state { data {capturedOtp = otpReceived, otp = if (length otpReceived) == 4 then otpReceived else state.data.otp } })
eval (SetToken id )state = do 
--   _ <-  pure $ setValueToLocalNativeStore FCM_TOKEN  id -- can implement this; this is a shared pref setting
--   _ <-  pure $ setValueToLocalStore FCM_TOKEN  id
  continue state

eval _ state = continue state