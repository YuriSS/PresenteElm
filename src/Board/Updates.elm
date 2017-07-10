
module Board.Updates exposing (..)

import Board.Messages exposing (Msg (..), Presence (..), UserName, Day)
import Board.Models exposing (  Student, User, Date)

update : Msg -> List Student -> ( List Student, Cmd Msg )
update msg xs =
    case msg of        
        ChangeStatus x y ->
            updateStudents x y xs ! [ Cmd.none ]
        
        NoOp ->
            xs ! [ Cmd.none ]

updateStudents : UserName -> Day -> List Student -> List Student
updateStudents name day =
    List.map
        (\x ->
            if name == x.user.name then
                updateStatus x day
            else
                x
        )

updateStatus : Student -> Day -> Student
updateStatus student day =
    Student student.user
        <| List.map
            ( \date ->
                if day == date.day then
                    Date date.day <| foldPresence date.presence
                else
                    date
            ) student.dates

foldPresence : Presence -> Presence
foldPresence p =
    case p of
        Present -> Absent
        Absent -> Present