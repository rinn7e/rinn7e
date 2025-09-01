module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, stopPropagationOn)
import Json.Decode as Json
import List.Extra as List
import Ports
import Svg exposing (path, svg)
import Svg.Attributes as SvgAttr
import VitePluginHelper


type Msg
    = None
    | ToggleStoic


type alias Model =
    { title : String
    , stoic : Bool
    }


init : Model
init =
    { title = "Moremi\nVannak"
    , stoic = False
    }


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( init, Cmd.none )
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )

        ToggleStoic ->
            ( { model | stoic = not model.stoic }, Cmd.none )


link1 =
    [ a [ href "https://www.instagram.com/rinn7e/", class "hover:underline", target "_blank" ] [ text "insta" ]
    , a [ href "https://kh.linkedin.com/in/moremi-vannak", class "hover:underline", target "_blank" ] [ text "linkedin" ]
    , a [ href "https://github.com/rinn7e", class "hover:underline", target "_blank" ] [ text "github" ]
    ]


link2 =
    [ a [ href "https://dev.to/rinn7e", class "hover:underline", target "_blank" ] [ text "dev.to" ]
    , a [ href "https://rinn7e.github.io/rinn7e/portfolio/index.html", class "hover:underline", target "_blank" ] [ text "(old) portfolio" ]
    ]


stoic1 =
    [ p [] [ text "1. If you are unhappy, it is your fault." ]
    , p [] [ text "2. Everything is temporary" ]
    , p [] [ text "3. We are social beings with a social duty" ]
    , p [] [ text "4. Hedonism is not the path to happiness" ]
    , p [] [ text "5. Fame & Fortune are overrated" ]
    , p [] [ text "6. A philosophy of life must be lived" ]
    , p [] [ text "7. Do not long for an ideal situation" ]
    , p [] [ text "8. Maximize positive emotions and minimize negative emotions" ]
    ]
        |> List.reverse


stoic2 =
    [ p [] [ text "Rephrase goals so that they are entirely within your control .1" ]
    , p [] [ text "Have nothing you are not prepared to lose .2" ]
    , p [] [ text "Live simply .3" ]
    , p [] [ text "Negative visualization .4" ]
    , p [] [ text "Exercise self-denial .5" ]
    , p [] [ text "Resist materialism .6" ]
    , p [] [ text "Accept what cannot be changed .7" ]
    , p [] [ text "Refuse to consider yourself the victim .8" ]
    , p [] [ text "Practice misfortune .9" ]
    , p [] [ text "Live in accordance with human nature .10" ]
    ]


view : Model -> Html Msg
view model =
    div [ class "flex items-center justify-center w-screen h-screen bg-amber-950 flex-col gap-40 py-40 text-white overflow-hidden" ]
        [ div [ class "flex h-full gap-40 shrink-0" ]
            [ div [ class "hidden lg:block lg:w-600" ] []
            , div [ class "shrink-0 w-1 grow bg-white opacity-60" ] []
            , div [ class "w-full lg:w-600 flex flex-col justify-end" ] <|
                if model.stoic then
                    stoic1

                else
                    link1
            ]
        , div [ class "shrink-0 w-300 h-300 bg-amber-700 flex items-center justify-center text-white flex-col gap-20" ]
            [ button [ onClick ToggleStoic, class "transition-all cursor-pointer w-130 h-130 border border-transparent hover:border-white flex items-center justify-center" ]
                [ h1
                    [ class "whitespace-pre-line text-[26px] opacity-60 text-center" ]
                    [ text model.title ]
                ]
            ]
        , div [ class "flex h-full gap-40 shrink-0" ]
            [ div [ class "w-full lg:w-600 flex flex-col text-right" ] <|
                if model.stoic then
                    stoic2

                else
                    link2
            , div [ class "shrink-0 w-1 grow bg-white opacity-60" ] []
            , div [ class "hidden lg:block lg:w-600" ] []
            ]
        ]
