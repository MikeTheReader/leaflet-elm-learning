module Main exposing (..)

import Html.App as App
import Models exposing (Model)
import Views exposing (view)
import Update exposing (update, init)
import Subscriptions exposing (subscriptions)


main : Program Never
main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
