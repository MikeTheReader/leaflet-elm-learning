module Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Messages exposing (..)
import Models exposing (Model, Marker)
import Regex exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ div [ class "col-md-4" ]
            [ div [ class "panel panel-info" ]
                [ div [ class "panel-heading" ] [ text "Map Controls (Elm)" ]
                , div [ class "panel-body" ]
                    [ h4 [] [ text "Bounds" ]
                    , div [] (List.map boundEntry model.bounds)
                    , button [ onClick (ZoomMap 1), class "btn btn-primary" ] [ text "Zoom In" ]
                    , div [ style [ ( "margin", "10px" ) ] ] []
                    , button [ onClick (ZoomMap -1), class "btn btn-primary" ] [ text "Zoom Out" ]
                    , markerList model.markers
                    ]
                ]
            ]
        , div [ class "col-md-4" ]
            [ div [ class "panel panel-info" ]
                [ div [ class "panel-heading" ] [ text "Application state (Elm)" ]
                , div [ class "panel-body" ]
                    [ pre [] [ text (jsonPsuedoPretty (toString model)) ] ]
                ]
            ]
        ]


boundEntry : Float -> Html Msg
boundEntry bound =
    div [] [ text (toString bound) ]


markerList : List Marker -> Html Msg
markerList markers =
    markers
        |> List.map markerEntry
        |> ul [ style [ ( "margin-top", "10px" ) ] ]


markerEntry : Marker -> Html Msg
markerEntry marker =
    li [ style [ ( "margin-bottom", "20px" ) ] ]
        [ button
            [ class "btn btn-warning"
            , style [ ( "display", "inline-block" ) ]
            , onClick (RemoveMarker marker.id)
            ]
            [ text "Remove" ]
        , span [] [ text (" Marker: " ++ (toString marker.lat) ++ "," ++ (toString marker.lng)) ]
        ]


jsonPsuedoPretty : String -> String
jsonPsuedoPretty text =
    text
        |> replace All (regex "[,]") (\_ -> ",\n")
        |> replace All (regex "[\\[]") (\_ -> "[\n")
        |> replace All (regex "[\\]]") (\_ -> "]\n")
