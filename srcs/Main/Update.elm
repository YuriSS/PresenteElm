module Main.Update exposing (update)

import Main.Messages as Main exposing (Msg(..))
import Main.Models exposing (App)
import Usuario.Update as Usuario exposing (update)
-- import Usuario.Messages exposing (Msg(..))
import Form.Login.Update as Login exposing (update)


update : Main.Msg -> App -> (App, Cmd Main.Msg)
update msg app =
  case msg of
    MsgParaUsuario subMsg ->
      let
        novoUsuario =
          Usuario.update subMsg app.usuarios
      in
        { app | usuario = novoUsuario } ! []

    MsgParaLogin subMsg ->
      let
        ((novoLogin, novoUsuario), cmd) =
          Login.update subMsg app.usuarios (app.login, app.usuario)

      in
        { app | login = novoLogin, usuario = novoUsuario } ! []