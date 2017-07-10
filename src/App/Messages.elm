
module App.Messages exposing (..)


import Board.Messages
import Form.Messages


type Msg
    = NoOp
    | BoardMsg Board.Messages.Msg
    | FormMsg Form.Messages.Msg