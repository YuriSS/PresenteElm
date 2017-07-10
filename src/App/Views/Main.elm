
module App.Views.Main exposing (..)

import Html exposing (Html, div, text)
import App.Messages exposing (Msg (..))
import App.Models exposing (Model)
import Board.Views.Main
import Form.Views.Main


view : Model -> Html Msg
view model =
    div []
        [ Html.map BoardMsg (Board.Views.Main.view model.students)
        , Html.map FormMsg (Form.Views.Main.view model.user)
        ]