
module Board.Updates exposing (..)

import Board.Messages exposing (Msg (..), Presence (..), UserName, Day)
import Board.Models exposing (Student, User, Date, initStudent)

update : Msg -> List Student -> Maybe Student -> ( (List Student, Maybe Student), Cmd Msg )
update msg xs ma =
    case msg of        
        ChangeStatus x y ->
            (updateStudents x y xs, ma) ! [ Cmd.none ]
        
        Clicked name ->
            (xs, findUser name xs) ! [ Cmd.none ]
        
        _ ->
            (xs, ma) ! [ Cmd.none ]

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
                    date ) student.dates

foldPresence : Presence -> Presence
foldPresence p =
    case p of
        Present -> Absent
        Absent -> Present


findUser : UserName -> List Student -> Maybe Student
findUser x =
    List.foldl
        (\ y ma ->
            case ma of
                Nothing ->
                    if x == y.user.name then Just y else Nothing
                Just a ->
                    Just a ) Nothing