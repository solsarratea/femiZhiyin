module Description exposing (..)
import Html exposing (Html, a, p, div, h1, h2, h3, i, text)
import Html.Attributes exposing (class, href, src)

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
        , h3 [ class "left" ] [ text "-> Collaborative artistic project for indivual art work <-" ]
        , h3 [ class "left" ] [ text "-> Individual art work for collaborative artistic project <-" ]
        , poem0
        , p [ class "poem-end" ] [ text "- p0em zer0" ]
        , p [] [ text "I really like the concept of synecdoche, for the ones who are unfamiliar with it, is a figure of speech in which a term for a part of something refers to the whole of something or vice versa",
               a [href "https://en.wikipedia.org/wiki/Synecdoche."] [text "[1]"] ]
        , p [] [text "So in terms of this project, each of the contributions is in fact the whole. \n The main idea is to build a global web platform to have a virtual place to visit, access and expose gender wisdom."]
        , p [] [text "Creating and sharing pieces of work such as poems, music, visuals, arts ( or whatever you would like to )."]
        , h3 [] [ text "What?" ]
        , h3 [] [ text "About the name:" ]
        , p [] [ text "The term Zhiyin (知音，literally \"to know the tone\") has come to describe a close and sympathetic friend; also described as soul-minded companion; or \" one who truly appreciates the tune played by another\". This is an allusion to a legend about two friends named Yu Boya and Zhong Ziqi."]
        , p [] [ text "Knowing the tone, hearing same music, sharing context. This is how I perceive Feminism." ]
        , h3 [] [ text "About the whole:" ]
        , p [] [ text "Create global web platform to expose gender wisdom. Sharing pieces of work such as poems, music, visuals, arts ( or whatever you would like to )." ]
        , h3 [] [ text "Why?" ]
        , p [] [ text "Destructuring context is hard when you do not have enough support around you." ]
        , p [] [ text " Its main aim is to be a supportive meshwork for people feeling gender through their bodies and being able to share whatever you would like to as well as to explore how others been through the same." ]
        , h3 [] [text "How can I be part: "]
        , p [] [text "Sharing personal work to be hosted in femiZhiyin"]
        , p [] [text "Sharing referential links to blogs/podcasts/movies I enjoyed."]
        , p [] [text "Contributing to github public source code. It is written in Elm. Re-designing architecture, css, etc.",
                a [href "https://github.com/solsarratea/femiZhiyin" ] [text "see source code"]
        , h2 [] [ text "WANT TO SHARE your WORK? right ", a [ href "https://forms.gle/7amWhsJfXR8RJsQC8", class "access" ] [ text "here" ] ] ]
        ]
    ]
