module Form.Login.Update exposing (update)

import Form.Login.Messages as Login exposing (Msg(..))
import Form.Login.Models exposing (Box)
import Usuario.Models exposing (Usuario, Input)
import Usuario.Update as Usuario exposing (update)


update : Login.Msg -> List Usuario -> (Box, Usuario) -> ((Box, Usuario), Cmd Login.Msg)
update msg xs (box, usuario) =
  case msg of
    AtualizaId x ->
      (atualizaId x box, usuario) ! []
    
    AtualizaSenha x ->
      (atualizaSenha x box, usuario) ! []
    
    Logar subMsg ->
      let
        novoUsuario =
          Usuario.update subMsg xs
      in
        (box, novoUsuario) ! []



atualizaId : String -> Box -> Box
atualizaId x =
  atualiza (\(_, y) -> (x, y))
  

atualizaSenha : String -> Box -> Box
atualizaSenha x =
  atualiza (\(y, _) -> (y, x))


atualiza : (Input -> Input) -> Box -> Box
atualiza f x =
  Box <| f x.valores