module Form.Login.Messages exposing (Msg(..))

import Usuario.Messages as Usuario exposing (Msg(..))


type Msg
  = AtualizaId String
  | AtualizaSenha String
  | Logar Usuario.Msg