module Main.Views.Root exposing (view)

import Html exposing (Html, div, text)
import Main.Messages exposing (Msg(..))
import Main.Models as Model exposing (App)
import Usuario.Models exposing (Usuario(..))
import Usuario.Views.Root as Usuario exposing (view)
import Form.Login.Views.Root as Login exposing (view)


view : App -> Html Msg
view app =
  case app.usuario of
    Conectado _ ->
      Html.map MsgParaUsuario <| Usuario.view app.usuario
    
    Desconectado ->
      Html.map MsgParaLogin <| Login.view app.login