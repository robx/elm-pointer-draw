module Main exposing (..)

import Collage
import Color
import Element
import Html
import Html.Attributes as Html
import Platform.Cmd
import Pointer


main : Program Never Model Msg
main =
    Html.program
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


view : Model -> Html.Html Msg
view model =
    let
        drawing =
            case model.draw of
                Just ps ->
                    toForm ps :: model.drawing

                Nothing ->
                    model.drawing
    in
    Html.div
        [ onPointerDown
        , onPointerMove
        , onPointerUp
        , Html.style [ ( "touch-action", "none" ) ]
        ]
        [ Element.toHtml <| Element.layers [ Collage.collage 400 400 (List.reverse drawing) ] ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


onPointerDown : Html.Attribute Msg
onPointerDown =
    Pointer.onWithOptions
        "pointerdown"
        { stopPropagation = False, preventDefault = True, capturePointer = True, releasePointer = False }
        (\e -> DrawStart e.pointer.offsetPos)


onPointerMove : Html.Attribute Msg
onPointerMove =
    Pointer.onMove (\e -> DrawTo e.pointer.offsetPos)


onPointerUp : Html.Attribute Msg
onPointerUp =
    Pointer.onWithOptions
        "pointerup"
        { stopPropagation = False, preventDefault = True, capturePointer = False, releasePointer = True }
        (\e -> DrawEnd)
