module Main exposing (..)

import Collage
import Color
import Element
import Html as H
import Html.Attributes as H
import Html.Events as H
import Platform.Cmd
import Pointer


main =
    H.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias Model =
    { draw : Maybe (List ( Float, Float ))
    , drawing : List Collage.Form
    }


init : ( Model, Cmd Msg )
init =
    ( { draw = Nothing
      , drawing = []
      }
    , Cmd.none
    )


type Msg
    = DrawStart ( Float, Float )
    | DrawTo ( Float, Float )
    | DrawEnd


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DrawStart p ->
            let
                pos =
                    toCoord p
            in
            ( { model | draw = Just [ pos ] }, Cmd.none )

        DrawTo p ->
            let
                pos =
                    toCoord p

                addDedup p ps =
                    case ps of
                        q :: qs ->
                            if q == p then
                                ps
                            else
                                p :: ps

                        [] ->
                            [ p ]
            in
            case model.draw of
                Just ps ->
                    ( { model | draw = Just (addDedup pos ps) }, Cmd.none )

                Nothing ->
                    ( model, Cmd.none )

        DrawEnd ->
            case model.draw of
                Just ps ->
                    ( { model | draw = Nothing, drawing = toForm ps :: model.drawing }, Cmd.none )

                Nothing ->
                    ( model, Cmd.none )


toCoord : ( Float, Float ) -> ( Float, Float )
toCoord ( a, b ) =
    ( a - 200, 200 - b )


toForm : List ( Float, Float ) -> Collage.Form
toForm ps =
    case ps of
        [ p ] ->
            Collage.circle 2.5 |> Collage.filled Color.red |> Collage.move p

        _ ->
            ps |> Collage.path |> Collage.traced lineStyle


lineStyle : Collage.LineStyle
lineStyle =
    let
        style =
            Collage.defaultLine
    in
    { style | color = Color.red, width = 5, cap = Collage.Round }


view : Model -> H.Html Msg
view model =
    let
        drawing =
            case model.draw of
                Just ps ->
                    toForm ps :: model.drawing

                Nothing ->
                    model.drawing
    in
    H.div
        [ onPointerDown
        , onPointerMove
        , onPointerUp
        , H.style [ ( "touch-action", "none" ) ]
        , H.attribute "elm-pep" "true"
        ]
        [ Element.toHtml <| Element.layers [ Collage.collage 400 400 (List.reverse drawing) ] ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


onPointerDown : H.Attribute Msg
onPointerDown =
    Pointer.onWithOptions
        "pointerdown"
        { stopPropagation = False, preventDefault = True }
        (\e -> DrawStart e.pointer.offsetPos)


onPointerMove : H.Attribute Msg
onPointerMove =
    Pointer.onMove (\e -> DrawTo e.pointer.offsetPos)


onPointerUp : H.Attribute Msg
onPointerUp =
    Pointer.onUp (\e -> DrawEnd)
