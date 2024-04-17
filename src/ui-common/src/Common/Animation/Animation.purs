module Animation where

import PrestoDOM.Animation (Interpolator, toRotation)
import PrestoDOM.Animation as PrestoAnim
import PrestoDOM.Animation (Interpolator, toRotation)
import Prelude (Unit, negate, unit, ($), (/))


fadeIn :: Boolean -> PrestoAnim.Animation
fadeIn ifAnim =
  PrestoAnim.Animation
    [ PrestoAnim.duration 250
    , PrestoAnim.toAlpha 1.0
    , PrestoAnim.fromAlpha 0.0
    , PrestoAnim.interpolator $ PrestoAnim.EaseIn
    -- , PrestoAnim.interpolator $ PrestoAnim.Bezier  0.7 0.0 0.7 1.0
    , PrestoAnim.repeatCount PrestoAnim.NoRepeat
    ] ifAnim