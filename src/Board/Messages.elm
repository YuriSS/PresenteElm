
module Board.Messages exposing (..)

type alias UserName =
    String

type alias Day =
    String


type Msg
    = NoOp
    | ChangeStatus UserName Day
    | Clicked String


type Presence
    = Present
    | Absent