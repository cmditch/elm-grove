module Env
    exposing
        ( env
        , homedir
        , tmpdir
        )

import Dict exposing (Dict)
import Json.Decode as JD
import Utils.Ops exposing (..)
import Native.Env


env : Dict String String
env =
    JD.decodeString (JD.dict JD.string) Native.Env.env
        ??= (\_ -> Debug.crash "BUG: Cannot decode env")


homedir : String
homedir =
    Native.Env.homedir


tmpdir : String
tmpdir =
    Native.Env.tmpdir
