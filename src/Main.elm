module Main exposing (..)

import Browser
import Html exposing (Html, text, div, h1, img,span)
import Html.Attributes exposing (src,class)


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
        div [class "app"] 
            [  h1 [class "glitch"] [ text "f e m i Z h i y i n " ] 
            , span [class "sub"][ text "you are not alone"]
            ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
