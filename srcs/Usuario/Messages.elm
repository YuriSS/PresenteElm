module Usuario.Messages exposing (Msg(..))

import Usuario.Models exposing (Input)


type Msg
  = Conectar Input
  | Desconectar