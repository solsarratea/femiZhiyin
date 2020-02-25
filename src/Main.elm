module Main exposing (..)

import Browser exposing (Document, UrlRequest(..), application)
import Browser.Navigation exposing (Key, load, pushUrl)
import Html exposing (Html, a, b, button, div, h1, h2, h3, i, img, p, span, text)
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
    [ div [ class "initial" ]
        [ h1 [ class "glitch" ] [ text "femiZhiyin " ]
        , div [ class "marquee" ] [ span [ class "sub" ] [ text "we are not alone" ] ]
        ]
    , div [ class "ref-container" ]
        [ a [ class "access", href "/description" ] [ text "access" ] ]
    ]


poem0 : Html msg
poem0 =
    div [ class "poem" ]
        [ i [] [ text "\" existencial synecdoche" ]
        , i [] [ text "to syncronize existence" ]
        , i [] [ text "and create reCIStence \"" ]
        ]


descriptionView : List (Html msg)
descriptionView =
    [ div [ class "app" ]
        [ h1 [ class "glitch" ] [ text "femiZhiyin" ]
        , h2 [] [ text "Expressing gender oppression on actual society" ]
        , h3 [ class "left" ] [ text "-> Collaborative artistic project for indivual art w o r k <-" ]
        , h3 [ class "left" ] [ text "-> Individual art work for collaborative artistic project <-" ]
        , poem0
        , p [ class "poem-end" ] [ text "- p0em zer0" ]
        , h3 [] [ text "What?" ]
        , p [] [ text "About the name:" ]
        , p [] [ text "The term Zhiyin (知音，literally \"to know the tone\") has come to describe a close and sympathetic friend; also described as soul-minded companion. This is how I perceive Feminism." ]
        , p [] [ text "Knowing the tone, hearing same music. " ]
        , p [] [ text "About the whole:" ]
        , p [] [ text "Create global web platform to expose gender wisdom. Sharing pieces of work such as poems, music, visuals, arts ( or whatever you would like to )." ]
        , h3 [] [ text "Why?" ]
        , p [] [ text "Destructuring context is hard when you do not have enough support around you." ]
        , p [] [ text "Its main aim is to be a supportive meshwork for people feeling gender through their bodies." ]
        , h2 [] [ text "WANT TO SHARE your WORK? drop at ", a [ href "mailto:mssarratea@gmail.com", class "access" ] [ text "here" ] ]
        ]
    ]



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
