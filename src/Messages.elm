module Messages exposing (..)

import Models exposing (..)


type Msg
    = SetBounds String
    | ZoomMap Int
    | AddMarker Marker
    | RemoveMarker Int
