module Main exposing (..)

import Html exposing (program)

import App.Models exposing (Model, init)
import App.Messages exposing (Msg (..))
import App.Views.Main exposing (view)
import App.Updates exposing (update)


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }