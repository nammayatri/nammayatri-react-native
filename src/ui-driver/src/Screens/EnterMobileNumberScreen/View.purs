{-

  Copyright 2022-23, Juspay India Pvt Ltd

  This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License

  as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program

  is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY

  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of

  the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}

module Screens.EnterMobileNumberScreen.View where

import Styles.Colors as Color
import Prelude
import Data.Maybe (Maybe(..))
import Debug (spy)
import Screens.EnterMobileNumberScreen.Controller (Action(..), eval, ScreenOutput)
import Effect (Effect)
import Screens.Types as ST
import PrestoDOM (relativeLayout, Gravity(..), Length(..), LetterSpacing(..), Margin(..), Orientation(..), Padding(..), PrestoDOM, Screen, Visibility(..), alpha, background, clickable, color, cornerRadius, frameLayout, gravity, height, imageUrl, imageView, linearLayout, margin, onBackPressed, onClick, orientation, padding, stroke, text, textView, visibility, weight, width, afterRender, imageWithFallback, singleLine, textFromHtml)
import React.Navigation.Types (ScopedScreen)

screen :: ST.EnterMobileNumberScreenState -> ScopedScreen Action ST.EnterMobileNumberScreenState ScreenOutput
screen initialState =
  { initialState
  , view 
  , name : "EnterMobileNumberScreen"
  , globalEvents : []
  , eval: (\action state -> do
      let _ = spy "EnterMobileNUmber state -----" state
      let _ = spy "EnterMobileNUmber--------action" action
      eval action state)
  , parent : Nothing
  , backpressAction : Just (\s -> pure BackPressed) 
  }


view :: forall w . (Action -> Effect Unit) -> ST.EnterMobileNumberScreenState -> PrestoDOM (Effect Unit) w
view push state =
  -- relativeLayout
  -- [ width MATCH_PARENT
  -- , height MATCH_PARENT
  -- , background Color.white900
  -- ][    textView
  --       [ height WRAP_CONTENT
  --       , width WRAP_CONTENT
  --       , text  "HELLO WORLD"
  --       ]
  -- ]
  relativeLayout
  [ width WRAP_CONTENT
  , height WRAP_CONTENT
  , background Color.green900
  , orientation HORIZONTAL
  , gravity CENTER_HORIZONTAL
  ][imageView
    [ imageWithFallback $ "ny_ic_chevron_left_white,https://assets.juspay.in/beckn/nammayatri/user/images/ny_ic_chevron_left_white.png"
    , height $ V 30
    , width $ V 30
    ]
  , enterMobileNumberTextView state
  ]

enterMobileNumberTextView :: ST.EnterMobileNumberScreenState ->  forall w . PrestoDOM (Effect Unit) w
enterMobileNumberTextView state =
 textView (
  [ height WRAP_CONTENT
  , width WRAP_CONTENT
  , text "Enter Your mobile Number"
  , color "#000000"
  , margin (MarginHorizontal 10 10)
  ]
  )







  --  linearLayout
  --  [  height MATCH_PARENT
  --   , width MATCH_PARENT
  --   , background Color.white900
  --  ][  linearLayout
  --   [ height MATCH_PARENT
  --   , width MATCH_PARENT
  --   , orientation VERTICAL
  --   , afterRender push (const AfterRender)
  --   , margin $ MarginBottom 24
  --   , padding (Padding 0 EHC.safeMarginTop 0 EHC.safeMarginBottom)
  --   , background Color.white900
  --   , onBackPressed push (const BackPressed)
  --   ][  headerView state push
  --     , frameLayout
  --       [ width MATCH_PARENT
  --       , height MATCH_PARENT
  --       , padding (Padding 16 0 16 0)
  --       ][enterMobileNumberView  state push]
  --     ]