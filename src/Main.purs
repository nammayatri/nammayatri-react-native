module Main where

import Data.Maybe
import Prelude

import Control.Monad.Except (runExcept, throwError)
import Control.Monad.Except.Trans (ExceptT)
import Control.Monad.Except.Trans (lift)
import Control.Monad.Except.Trans (runExceptT)
import Control.Monad.Free (Free)
import Control.Monad.State as S
import Control.Transformers.Back.Trans (BackT)
import Control.Transformers.Back.Trans (runBackT)
import Data.Array (singleton, zip)
import Data.Either (Either(..))
import Data.Function.Uncurried (runFn2)
import Effect (Effect)
import Effect.Aff (makeAff, launchAff, try, Aff, nonCanceler, attempt, Canceler)
import Effect.Class (liftEffect)
import Effect.Exception (Error, error)
import Effect.Ref (new)
import Foreign.Generic (decodeJSON)
import Presto.Core.Language.Runtime.API (APIRunner)
import Presto.Core.Language.Runtime.Interpreter (PermissionCheckRunner, PermissionRunner(..), PermissionTakeRunner, Runtime(..), UIRunner(..))
import Presto.Core.Language.Runtime.Interpreter (run) as Run
import Presto.Core.Types.API (Header(..), Headers(..), Request(..), RestAPIOptions(..)) as API
import Presto.Core.Types.Language.Flow (Flow, defaultState, doAff, getState, modifyState)
import Presto.Core.Types.Language.Flow (FlowWrapper)
import Presto.Core.Types.Permission (Permission(..), PermissionResponse, PermissionStatus(..))
import PrestoDOM
import React.Basic (JSX)
import React.Navigation.Navigate (initScaffold, navigateToScreen)
import React.Navigation.Types (ScopedScreen)
import Debug
import PrestoDOM.Properties (onClickProp) as ONClick
import React.Hooks.UseBackPressed (backPressUtility)
import Tools.Events as TE
import ConfigBridge as ConfigBridge
import Screens.Handlers as UI
import Types.App (FlowBT, GlobalState(..), ScreenType(..), defaultGlobalState)

-- import React.Basic.Event (onClick2, onClick, afterRender) as ONClick

foreign import registerBackPress :: Effect Boolean -> Effect Unit

main :: Effect Unit 
main = do 
  _ <- registerBackPress onBackPress
  _ <- launchAff $ flowRunner defaultGlobalState $ do
    resp ← runExceptT $ runBackT $ baseAppFlow ""
    case resp of
      Right x → pure unit
      Left err → pure unit
  pure unit

flowRunner :: forall a st. st -> Flow st a -> Aff (Either Error a)
flowRunner initialState flow = do
  let runtime = Runtime pure permissionRunner apiRunner
      freeFlow = S.evalStateT (Run.run runtime flow)
  attempt $ do
    let avar = liftEffect $ new (defaultState initialState)
    avar2 <- avar
    let result = S.evalStateT (Run.run runtime flow) avar2
    result

-- flowRunner :: ∀ return st. st -> Flow st return -> Aff (Either Error return)
-- flowRunner state flow = do
--   let
--     freeFlow = S.evalStateT $ Run.run standardRunTime flow
--   attempt $ new (defaultState state) >>= freeFlow


permissionCheckRunner :: PermissionCheckRunner
permissionCheckRunner = checkIfPermissionsGranted


permissionRunner :: PermissionRunner
permissionRunner = PermissionRunner permissionCheckRunner permissionTakeRunner

-- apiRunner :: APIRunner
-- apiRunner request = makeAff (\cb -> do
--     pure $ nonCanceler)

-- flowRunner1 :: ∀ return st. st -> Flow st return -> Aff (Either Error return)
-- flowRunner1 state flow = do
--   attempt $ new (defaultState state)

standardRunTime :: Runtime
standardRunTime =
  Runtime
    pure
    permissionRunner
    apiRunner

-- _requestPermissions :: (Either Error String -> Effect Unit) -> String -> Effect Canceler
_requestPermissions cb str = 
  pure $ nonCanceler

toAndroidPermission _ = ""

permissionTakeRunner :: PermissionTakeRunner
permissionTakeRunner = requestPermissions

requestPermissions :: Array Permission -> Aff (Array PermissionResponse)
requestPermissions permissions = do
  response <- makeAff (\cb -> pure $ nonCanceler)
  case runExcept $ decodeJSON response of
    Right (statuses :: Array Boolean) -> pure $ zip permissions []
    Left err -> throwError (error (show err))

checkIfPermissionsGranted :: Array Permission -> Aff PermissionStatus
checkIfPermissionsGranted _permissions = do
  pure $ PermissionGranted

baseAppFlow :: String -> FlowBT String Unit
baseAppFlow _ = do
  _ <- pure $ spy "INside baseAppFLow" "calling homeScreenFLow"
  homeScreenFlow
  pure unit

state = { dummy : ""}

homeScreenFlow :: FlowBT String Unit
homeScreenFlow = do
  _ <- pure $ spy "INside homeScreenFlow" "sdjhjkhjk"
  _ <- lift $ lift $ initScaffold Nothing Nothing defaultNamespaceView

  _ <- lift $ lift $ ConfigBridge.setKeyInSharedPrefKeys (show ConfigBridge.WELCOME) "Hi! This is just the beginning of the new end"
  retrievedValue <- lift $ lift $ ConfigBridge.getKeyInSharedPrefKeys "WELCOME"
  let hello = spy "This is the retrieved value from async storage" retrievedValue
  
  action <- UI.enterMobileNumberScreen
  -- output <- lift $ lift $ navigateToScreen $ screen {dummy : "screen1"}
  -- let hello = spy "This is the screenOutput" (show output)
  -- output <- lift $ lift $ navigateToScreen $ screen {dummy : "screen2"}
  -- let hello = spy "This is the screenOutput 2" (show output)
  pure unit
  

data Action = Dummy | BackPressed

instance showAction :: Show Action where
  show _ = ""

instance showScreenOutput :: Show ScreenOutput where
  show ScreenOutput = "ScreenOutput"

instance loggableAction :: Loggable Action where
  performLog action appId = pure unit

data ScreenOutput = ScreenOutput

eval :: Action -> { dummy :: String} -> Eval Action ScreenOutput { dummy :: String}

eval BackPressed state = do
  let hello = spy "I am in backpress" ""
  continue state

eval _ state = do
  -- continue state 
  exit $ ScreenOutput

screen :: { dummy :: String} -> ScopedScreen Action { dummy :: String}  ScreenOutput
screen initialState =
  { initialState
  , view
  , name: "MyFirstRNScreen"
  , globalEvents: []
  , parent: Nothing
  , eval
  , backpressAction : Just (\s -> pure BackPressed) 
  }
view push state =
  linearLayout
    [ height MATCH_PARENT
    , width MATCH_PARENT
    , orientation VERTICAL
    , background "#909090"
    , clickable true
    , onClick push $ const $ Dummy
    , onBackPressed push $ const BackPressed
    -- , ONClick.onClickProp $ doNothing
    -- , ONClick.afterRender doNothing
    , gravity BOTTOM
    ] [ textView
        [ height WRAP_CONTENT
        , width WRAP_CONTENT
        , text  state.dummy
        ]
    ]

-- doNothing :: String -> Effect Unit
-- doNothing = \str -> do
--   let hello = spy "I am here in doNothing of onClick" str
--   -- _ <- case (eval Dummy {dummy : "Hello"}) of 
--   --        Right _ -> pure unit
--   --        Left _ -> pure unit
--   _ <- eval Dummy {dummy : "Hello"}
--   pure unit

defaultNamespaceView :: JSX -> JSX
defaultNamespaceView = identity

apiRunner :: APIRunner
apiRunner (API.Request request@{headers: API.Headers hs}) =
  makeAff
    ( \cb -> pure $ nonCanceler
    )

onBackPress :: Effect Boolean
onBackPress = do
  showBp <- TE.enableBackpress
  backPressUtility.fireBackPress
  pure true