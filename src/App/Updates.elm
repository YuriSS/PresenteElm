
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
                ( (updatedStudents, freshStudent), cmd ) =
                    Board.Updates.update subMsg model.students model.user
            in
                { model | students = updatedStudents, user = freshStudent } ! [ Cmd.map BoardMsg cmd ]
        
        FormMsg subMsg ->
            let
                ( updateUser, cmd ) =
                    Form.Updates.update subMsg model.user
            in
                { model | user = updateUser } ! [ Cmd.map FormMsg cmd ]