
module Board.Models exposing (..)

import Board.Messages exposing (Msg (..), Presence (..), UserName, Day)

type alias User =
    { name : UserName
    , class : String
    }

initUser : UserName -> User
initUser x =
    User x "Classe 1"

type alias Date =
    { day : Day
    , presence: Presence
    }

initDate : Day -> Date
initDate x =
    Date x Absent

type alias Student =
    { user : User
    , dates : List Date
    }

initStudent : String -> Student
initStudent x =
    Student (initUser x)
        <| List.map initDate days

initListStudent : List String -> List Student
initListStudent =
    List.map initStudent

days : List String
days =
    [ "Segunda", "Terça", "Quarta", "Quinta", "Sexta" ]

alunos : List String
alunos =
    [ "Yasmin", "Samuel", "Leonardo", "Monica", "Sara" ]