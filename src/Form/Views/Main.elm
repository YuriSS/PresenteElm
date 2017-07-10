
module Form.Views.Main exposing (..)

import Html exposing (Html, div, text)
import Board.Models exposing (Student)


view : Maybe Student -> Html msg
view x =
    case x of
        Nothing ->
            text "Noo"
        
        Just student ->
            text <| student.user.name