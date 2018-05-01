module Main exposing (..)

import Html exposing (Html, text, div, h1, h2, img, ul, li, input, button)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick, onInput)


---- MODEL ----


type alias Model =
    { forelesere : List String }


init : Model
init =
    { forelesere = [ "Johanne", "Aksel" ] }



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    model



---- VIEW ----


listeElement : String -> Html Msg
listeElement streng =
    li [] [ text streng ]


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , h1 [] [ text "Forelesning INF2810" ]
        , h2 [] [ text "Forelesere" ]
        , ul []
            (List.map
                listeElement
                model.forelesere
            )
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = ( init, Cmd.none )
        , update = updateWithCommand
        , subscriptions = always Sub.none
        }


updateWithCommand : Msg -> Model -> ( Model, Cmd Msg )
updateWithCommand msg model =
    ( update msg model, Cmd.none )
