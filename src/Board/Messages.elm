
module Board.Messages exposing (..)

type alias UserName =
    String

type alias Day =
    String


type Msg
    = NoOp
    | ChangeStatus UserName Day


type Presence
    = Present
    | Absent