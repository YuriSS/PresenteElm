
module Form.Updates exposing (..)

import Form.Messages exposing (Msg (..))
import Board.Models exposing (Student)


update : Msg -> Maybe Student -> ( Maybe Student, Cmd Msg )
update msg x =
    case msg of
        NoOp ->
            x ! [ Cmd.none ]