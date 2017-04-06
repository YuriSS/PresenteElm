module Main.Messages exposing (Msg(..))

import Usuario.Messages as Usuario exposing (Msg(..))
import Form.Login.Messages as Login exposing (Msg(..))


type Msg
  = MsgParaUsuario Usuario.Msg
  | MsgParaLogin Login.Msg