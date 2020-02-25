module Main exposing (..)

import Browser exposing (Document, UrlRequest(..), application)
import Browser.Navigation exposing (Key, load, pushUrl)
import Html exposing (Html, a, b, button, div, h1, img, span, text)
import Html.Attributes exposing (class, href, src)
import Html.Events exposing (onClick)
import String exposing (contains)
import Url exposing (Url, toString)



---- MODEL ----


type AppState
    = AppState
        { url : Url
        , navKey : Key
        }


type AppMessage
    = NoUpdate
    | ClickedLink UrlRequest
    | UrlChanged Url


appInit : () -> Url -> Key -> ( AppState, Cmd AppMessage )
appInit _ url key =
    let
        st =
            AppState { url = url, navKey = key }
    in
    ( st, pushUrl key "/" )


appSubscriptions : AppState -> Sub AppMessage
appSubscriptions _ =
    Sub.none



---- UPDATE ----


appUpdate : AppMessage -> AppState -> ( AppState, Cmd AppMessage )
appUpdate msg (AppState s) =
    case msg of
        NoUpdate ->
            ( AppState s, Cmd.none )

        ClickedLink urlRequest ->
            case urlRequest of
                Internal url ->
                    ( AppState s, pushUrl s.navKey (toString url) )

                External href ->
                    ( AppState s, load href )

        UrlChanged url ->
            ( AppState { s | url = url }, Cmd.none )



---- VIEW ----


type Page
    = Home
    | Description
    | Other


parseUrlToPage : Url -> Page
parseUrlToPage url =
    let
        urlString =
            toString url
    in
    if contains "/description" urlString then
        Description

    else
        Home


link : String -> Html AppMessage
link path =
    a [ href path ] [ text path ]


appView : AppState -> Document AppMessage
appView (AppState st) =
    let
        body =
            case parseUrlToPage st.url of
                Home ->
                    homeView

                Description ->
                    descriptionView

                Other ->
                    [ div [] [ text "Oops! inexistent" ] ]
    in
    Document "femiZhiyin" body


homeView : List (Html msg)
homeView =
    [ div [ class "app" ]
        [ h1 [ class "glitch" ] [ text "femiZhiyin " ]
        , div [class "marquee"] [span [ class "sub" ] [ text "you are not alone" ]]
        ]
    , div [ class "ref-container" ]
        [ a [ class "access", href "/description" ] [ text "access" ] ]
    ]


descriptionView : List (Html msg)
descriptionView =
    [ div [] [ text "Collaborative artistic project which aims to express gender oppression on actual society." ] ]



---- PROGRAM ----


main : Program () AppState AppMessage
main =
    Browser.application
        { init = appInit
        , onUrlChange = UrlChanged
        , onUrlRequest = ClickedLink -- Use the message!
        , subscriptions = appSubscriptions
        , update = appUpdate
        , view = appView
        }
