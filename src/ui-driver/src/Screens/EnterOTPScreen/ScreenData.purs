module Screens.EnterOTPScreen.ScreenData where

import Screens.Types (EnterOTPScreenState)


initData :: EnterOTPScreenState
initData =  {
  data:  {
    otp : "",
    tokenId : "",
    attemptCount : 3,
    mobileNo : "",
    timer: "10s",
    capturedOtp : "",
    focusedIndex : 1,
    editTextId : "EnterOTPNumberEditText"
    -- config : getAppConfig appConfig
    },
  props: {
    btnActive :false,
    isValid : false,
    resendEnabled : false,
    otpTmp :false
    }
}