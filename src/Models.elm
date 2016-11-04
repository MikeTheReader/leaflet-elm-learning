module Models exposing (..)


type alias Model =
    { bounds : List Float
    , markers : List Marker
    }


type alias Marker =
    { lat : Float
    , lng : Float
    , id : Int
    }
