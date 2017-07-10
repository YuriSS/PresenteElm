
module App.Updates exposing (..)

import App.Messages exposing (Msg (..))
import App.Models exposing (Model)
import Board.Updates
import Form.Updates


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! [ Cmd.none ]
        
        BoardMsg subMsg ->
            let
                ( updatedStudents, cmd ) =
                    Board.Updates.update subMsg model.students
            in
                { model | students = updatedStudents } ! [ Cmd.map BoardMsg cmd ]
        
        FormMsg subMsg ->
            let
                ( updateUser, cmd ) =
                    Form.Updates.update subMsg model.user
            in
                { model | user = updateUser } ! [ Cmd.map FormMsg cmd ]