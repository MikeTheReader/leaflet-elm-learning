port module Update exposing (..)

import Models exposing (Model)
import Messages exposing (Msg, Msg(..))
import String exposing (split)
import Subscriptions exposing (zoomMap, removeMarker)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetBounds bounds ->
            ( { model | bounds = (List.map (Maybe.withDefault 0 << Result.toMaybe << String.toFloat) (split "," bounds)) }, Cmd.none )

        ZoomMap int ->
            ( model, zoomMap int )

        AddMarker marker ->
            ( { model | markers = marker :: model.markers }, Cmd.none )

        RemoveMarker int ->
            ( { model | markers = (List.filter (\i -> i.id /= int) model.markers) }, removeMarker int )


init : ( Model, Cmd Msg )
init =
    ( Model [] [], Cmd.none )
