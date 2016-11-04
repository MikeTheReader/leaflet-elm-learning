port module Subscriptions exposing (..)

import Models exposing (Model, Marker)
import Messages exposing (Msg(..))


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ setBounds SetBounds
        , addMarker AddMarker
        ]


port setBounds : (String -> msg) -> Sub msg


port zoomMap : Int -> Cmd msg


port addMarker : (Marker -> msg) -> Sub msg


port removeMarker : Int -> Cmd msg
