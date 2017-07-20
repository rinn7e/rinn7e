module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main =
    Html.beginnerProgram
        { model = model
        , update = update
        , view = view
        }


type alias Model =
    { workList : List WorkModel
    , lang : LangModel
    , nav : List NavModel
    , bio : BioModel
    , page : PageModel
    , sidebarStatus : Bool
    }


type alias NavModel =
    { labelKh : String
    , labelEn : String
    , page : PageModel
    }


type alias BioModel =
    { nameKh : String
    , nameEn : String
    , jobKh : String
    , jobEn : String
    , descKh : String
    , descEn : String
    , locationKh : String
    , locationEn : String
    }


type alias WorkModel =
    { nameEn : String
    , nameKh : String
    , descEn : String
    , descKh : String
    , github : String
    , website : String
    , tagList : List String
    , image : String
    }


type LangModel
    = Kh
    | En


type PageModel
    = Home
    | About
    | Blog


model : Model
model =
    { workList = workListInit
    , lang = Kh
    , nav =
        [ { labelKh = "កម្មវិធីដែលធ្លាប់ធ្វើ", labelEn = "Work", page = Home }
        , { labelKh = "អំពី", labelEn = "About", page = About }
        , { labelKh = "អត្ថបទ", labelEn = "Blog", page = Blog }
        ]
    , bio =
        { nameKh = "វណ្ណៈ ម៉ូរ៉េមី"
        , nameEn =
            "Moremi Vannak"
            -- , jobKh = "អ្នកសរសេរគេហទំព័រ"
        , jobKh = "Web Developer"
        , jobEn = "Web Developer"
        , descKh = "កំពុងសិក្សារនៅសកលវិទ្យាល័យ ហ្សាម៉ាន ឆ្នាំទី៣ ផ្នែកវិទ្យាសាស្ត្រកំព្យូទ័រ"
        , descEn = "Currently, 3rd Year Computer Science in Zaman University"
        , locationKh = "ភ្នំពេញ, កម្ពុជា"
        , locationEn = "Phnom Penh, Cambodia"
        }
    , page = Home
    , sidebarStatus = False
    }


workListInit : List WorkModel
workListInit =
    [ { nameEn = "Elmfdasfa Khmer Dictionary"
      , nameKh = "Elm Khmer Dictionary"
      , descEn = "Khmer to Khmer Dictionary written in Elm using Globse API"
      , descKh = "វេចនានុក្រមខ្មែរ សរសេរដោយភាសារកូដ Elm ដោយប្រើ Globse API"
      , tagList = [ "Tachyons CSS", "Elm" ]
      , website = "https://chmar77.github.io/elm-khmer-dictionary/"
      , github = "https://github.com/chmar77/elm-khmer-dictionary"
      , image = "assets/images/elm-khmer-dictionary.png"
      }
    , { nameEn = "Khmer Unicode Enhance"
      , nameKh = "Khmer Unicode Enhance"
      , descEn = "Eliminate using shift and write double letter instead"
      , descKh = "សរសេរភាសារខ្មែរដោយមិនចាំបាច់ចុច shift"
      , tagList = [ "Elm" ]
      , website = "https://chmar77.github.io/khmer-unicode-enhance/"
      , github = "https://github.com/chmar77/khmer-unicode-enhance"
      , image = "assets/images/KhmerUnicodeEnhance.png"
      }
    , { nameEn = "Hangul-Khmer"
      , nameKh = "Hangul-Khmer"
      , descEn = "Create khmer pronunciation for Korean hangul"
      , descKh = "បង្ហាញរបៀបអានសំលេងភាសារកូរ៉េតាមអក្សរខ្មែរ"
      , tagList = [ "Elm" ]
      , website = "https://chmar77.github.io/hangul-khmer-pronunciation/"
      , github = "https://github.com/chmar77/hangul-khmer-pronunciation"
      , image = "assets/images/HangulPronunciation.png"
      }
    , { nameEn = "Ey Sey Story Time"
      , nameKh = "រឿងនិទានតាឥសី"
      , descEn = "Website"
      , descKh = "Website"
      , tagList = [ "HTML", "CSS", "Javascript" ]
      , website = "http://eyseystorytime.com/"
      , github = ""
      , image = "assets/images/EySeyStoryTime.png"
      }
    , { nameEn = "Tumnukrap"
      , nameKh = "ទំនុករ៉េប"
      , descEn = "Lyric for Khmer Rap Song"
      , descKh = "ទំនុកចម្រៀងសម្រាប់បទរ៉េបខ្មែរ"
      , tagList = [ "Node.js", "Express.js", "MongoDB" ]
      , website = "https://tumnukrap.herokuapp.com/"
      , github = ""
      , image = "assets/images/Tumnukrap.png"
      }
    , { nameEn = "Somngat"
      , nameKh = "សំងាត់"
      , descEn = "Anonymous Real-Time Discussion"
      , descKh = "សរសេរសារជាមួយអ្នកដ៏ទៃដោយមិនចុះឈ្មោះ"
      , tagList = [ "Node.js", "Socket.io", "Angular.js" ]
      , website = "http://preah-chan.herokuapp.com/"
      , github = ""
      , image = "assets/images/Somngat.png"
      }
    , { nameEn = "Chet"
      , nameKh = "ចិត្ត"
      , descEn = "Real-time Discussion Forum"
      , descKh = "កន្លែងពិភាក្សារបែប Real-Time Forum"
      , tagList = [ "Firebase", "Angular.js" ]
      , website = "https://fireslack-wtmtest.firebaseapp.com"
      , github = ""
      , image = "assets/images/Chet.png"
      }
    , { nameEn = "Meetongyum"
      , nameKh = "Meetongyum"
      , descEn = "Write word overlay on picture"
      , descKh = "Web app សម្រាប់ដាក់អក្សរនៅពីលើរូបភាព"
      , tagList = [ "Angular.js" ]
      , website = "https://meetongyum.firebaseapp.com"
      , github = ""
      , image = "assets/images/Meetongyum.png"
      }
    ]


type Msg
    = ToggleLang
    | Navigate PageModel
    | ShowSidebar
    | NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleLang ->
            let
                lang_ =
                    case model.lang of
                        Kh ->
                            En

                        En ->
                            Kh
            in
                { model | lang = lang_ }

        Navigate page_ ->
            -- case page_ of
            --     None ->
            --         model
            --     _ ->
            { model | page = page_ }

        ShowSidebar ->
            { model | sidebarStatus = not model.sidebarStatus }

        _ ->
            model


view : Model -> Html Msg
view model =
    div
        [ style
            [ ( "display", "flex" )
            , ( "flex-direction", "row" )
            , ( "background-color", "white" )
            , ( "height", "100%" )
            ]
        ]
        [ div
            [ class
                (if model.sidebarStatus == True then
                    ""
                 else
                    "is-hidden-mobile"
                )
            , style
                [ ( "background-color", "white" )
                , ( "min-width", "300px" )
                , ( "flex", "0 0 0 " )
                , ( "display", "flex" )
                , ( "justify-content", "center" )
                , ( "align-items", "center" )
                ]
            ]
            [ navView model
            ]
        , div
            [ style
                [ ( "background-color", "white" )
                , ( "flex-grow", "1" )
                , ( "display", "flex" )
                , ( "flex-direction", "column" )
                ]
            ]
            [ div
                [ class "is-hidden-tablet"
                , onClick ShowSidebar
                , style [ ( "padding", "10px" ), ( "cursor", "pointer" ) ]
                ]
                [ text
                    (if model.sidebarStatus == True then
                        "Hide Sidebar "
                     else
                        "Show Sidebar"
                    )
                ]
            , div
                [ style
                    [ ( "flex", "1 0 0 " )
                    , ( "background-color", "#eaeaea" )
                    , ( "overflow", "auto" )
                    ]
                ]
                [ pageView model
                ]
            ]
        ]


pageView : Model -> Html Msg
pageView model =
    case model.page of
        Home ->
            div [ class "columns is-multiline ", style [ ( "margin", "10px" ) ] ]
                (List.map (cardView model.lang) model.workList)

        About ->
            aboutView model

        Blog ->
            div [ class "columns ", style [ ( "margin", "20px" ) ] ]
                [ h1 [ class "title is-2" ] [ text "Under Construction" ]
                ]


cardView : LangModel -> WorkModel -> Html Msg
cardView lang work =
    let
        ( name, desc, langClass ) =
            case lang of
                Kh ->
                    ( work.nameKh, work.descKh, "_kh" )

                En ->
                    ( work.nameEn, work.descEn, "_en" )
    in
        div [ class "column is-6-tablet is-4-desktop" ]
            [ div [ class "card" ]
                [ div [ class "card-image" ]
                    [ figure [ class "image is-2by1" ]
                        [ img [ alt "Image", src work.image ]
                            []
                        ]
                    ]
                , div [ class "card-content" ]
                    [ div [ class "content my-content" ]
                        [ h4 [ class langClass ] [ strong [] [ text name ], text (": " ++ desc) ]
                        , div [ class "tag-list" ]
                            (List.map
                                (\tag ->
                                    span [ class "tag is-dark" ] [ text tag ]
                                )
                                work.tagList
                            )
                        ]
                    ]
                , footer [ class "card-footer" ]
                    [ if (work.github /= "") then
                        a [ target "_blank", href work.github, class "card-footer-item" ]
                            [ span [ class "icon" ]
                                [ i [ class "fa fa-github" ] []
                                ]
                            , text "Github"
                            ]
                      else
                        a [] []
                    , if (work.website /= "") then
                        a [ target "_blank", href work.website, class "card-footer-item" ]
                            [ span [ class "icon" ]
                                [ i [ class "fa fa-globe" ] []
                                ]
                            , text "Website"
                            ]
                      else
                        a [] []
                    ]
                ]
            ]


navView : Model -> Html Msg
navView model =
    let
        ( name, job, desc, navList, langClass ) =
            case model.lang of
                Kh ->
                    ( model.bio.nameKh
                    , model.bio.jobKh
                    , model.bio.descKh
                    , List.map (\nav -> { label = nav.labelKh, page = nav.page }) model.nav
                    , "_kh"
                    )

                En ->
                    ( model.bio.nameEn
                    , model.bio.jobEn
                    , model.bio.descEn
                    , List.map (\nav -> { label = nav.labelEn, page = nav.page }) model.nav
                    , "_en"
                    )
    in
        div
            [ class "my-nav"
            , style [ ( "padding", "10px" ), ( "text-align", "center" ) ]
            ]
            ([ langView model.lang
             , div [ class ("item -name " ++ langClass) ] [ text name ]
             , div [ class ("item -job " ++ langClass) ] [ text job ]
             , div [ class ("item " ++ langClass) ] [ text desc ]
             ]
                ++ (List.map
                        (\nav ->
                            div
                                [ onClick (Navigate nav.page)
                                , class
                                    ("item -link "
                                        ++ langClass
                                        ++ (if model.page == nav.page then
                                                " -active"
                                            else
                                                ""
                                           )
                                    )
                                ]
                                [ text nav.label ]
                        )
                   )
                    navList
            )


langView : LangModel -> Html Msg
langView lang =
    let
        ( label, langClass ) =
            case lang of
                Kh ->
                    ( "English", "_en" )

                En ->
                    ( "ភាសារខ្មែរ", "_kh" )
    in
        div [ class "item -lang" ]
            [ a [ class langClass, onClick ToggleLang ] [ text label ]
            ]


aboutView : Model -> Html Msg
aboutView model =
    let
        ( name, location, nameLabel, locationLabel, emailLabel, aboutLabel, knowledgeLabel, langClass ) =
            case model.lang of
                Kh ->
                    ( model.bio.nameKh
                    , model.bio.locationKh
                    , "ឈ្មោះ: "
                    , "ទីតាំង: "
                    , "អ៊ីមេល៍: "
                    , "អំពី"
                    , "ចំណេះដឹងផ្នែក"
                    , "_kh"
                    )

                En ->
                    ( model.bio.nameEn
                    , model.bio.locationEn
                    , "Name: "
                    , "Location: "
                    , "Email: "
                    , "About"
                    , "Knowledge"
                    , "_en"
                    )
    in
        div
            [ style
                [ ( "margin", "20px" )
                , ( "flex", "1 0 0 " )
                , ( "background-color", "white" )
                , ( "padding", "30px" )
                ]
            ]
            [ h1 [ class ("title " ++ langClass) ] [ text aboutLabel ]
            , div [ class "columns" ]
                [ div [ class "column" ]
                    [ figure [ class "image is-3x4 my-profile" ]
                        [ img [ src "assets/profile.jpg" ] [] ]
                    , p [ class langClass ] [ strong [] [ text nameLabel ], text name ]
                    , p [ class langClass ] [ strong [] [ text locationLabel ], text location ]
                    , p [ class langClass ] [ strong [] [ text emailLabel ], text "moremi.va@gmail.com" ]
                    ]
                , div [ class "column" ]
                    [ h3 [ class ("title is-4 " ++ langClass) ]
                        [ text knowledgeLabel ]
                    , div
                        [ class "my-knowledge" ]
                        [ p [] [ a [ target "_blank", href "http://elm-lang.org/" ] [ text "Elm" ] ]
                        , p [] [ text "HTML, CSS, Javascript" ]
                        , p [] [ text "Angularjs, " ]
                        , p [] [ text "Node.js, Express.js, Laravel" ]
                        , p [] [ text "Elixir, Phoenix" ]
                        ]
                    ]
                ]
            ]
