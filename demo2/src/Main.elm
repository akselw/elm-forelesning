module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



--- MODEL ---


type alias Model =
    { inputText : String
    , todos : List Todo
    , nextId : Int
    }


type alias Todo =
    { text : String
    , id : Int
    }


initialModel : Model
initialModel =
    { inputText = ""
    , todos = []
    , nextId = 1
    }



--- UPDATE ---


type Msg
    = TextUpdated String
    | TodoAdded


update : Msg -> Model -> Model
update msg model =
    case msg of
        TextUpdated string ->
            { model | inputText = string }

        TodoAdded ->
            { model
                | inputText = ""
                , todos = createTodo model.inputText model.nextId :: model.todos
                , nextId = model.nextId + 1
            }


createTodo : String -> Int -> Todo
createTodo string id =
    { text = string
    , id = id
    }



--- VIEW ---


view : Model -> Html Msg
view model =
    section [ class "todoapp" ]
        [ header [ class "header" ]
            [ h1 [] [ text "todos" ]
            , div [ class "new-todo-row" ]
                [ input
                    [ class "new-todo"
                    , placeholder "What needs to be done?"
                    , autofocus True
                    , autocomplete False
                    , name "newTodo"
                    , onInput TextUpdated
                    , value model.inputText
                    ]
                    []
                , button
                    [ class "add-todo"
                    , onClick TodoAdded
                    ]
                    [ text "Add" ]
                ]
            ]
        , section [ class "main" ]
            [ ul [ class "todo-list" ]
                (List.map viewTodo model.todos)
            ]
        ]


viewTodo : Todo -> Html Msg
viewTodo todo =
    li [ classList [ ( "completed", False ) ] ]
        [ div [ class "view" ]
            [ input [ class "toggle", type_ "checkbox", checked False ] []
            , label [] [ text todo.text ]
            , button [ class "destroy" ] []
            ]
        ]



--- INIT ---


main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
