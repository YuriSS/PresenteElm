
module App.Models exposing (..)

import App.Messages exposing (Msg (..))
import Board.Models exposing (initListStudent, alunos, Student)


type alias Model =
    { students : List Student
    , user : Maybe Student
    }


init : (Model, Cmd Msg)
init =
    ( Model (initListStudent alunos) Nothing, Cmd.none )