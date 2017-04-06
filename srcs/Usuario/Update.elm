module Usuario.Update exposing (update, map)

import Usuario.Messages exposing (Msg(..))
import Usuario.Models exposing (Usuario(..), UsuarioMolde, Input)


update : Msg -> List Usuario -> Usuario
update msg xs =
  case msg of
    Conectar x ->
      procuraUsuario x xs
    
    Desconectar ->
      Desconectado


procuraUsuario : Input -> List Usuario -> Usuario
procuraUsuario entrada =
  List.foldl (procurando entrada) Desconectado


procurando : Input -> Usuario -> Usuario -> Usuario
procurando entrada usuario tentativas =
  case tentativas of
    Conectado x ->
      Conectado x
    
    Desconectado ->
      tenta entrada usuario


tenta : Input -> Usuario -> Usuario
tenta (x, y) =
  map (\u ->
        if u.id == x && u.senha == y then
          Conectado u
        else
          Desconectado )


map : (UsuarioMolde -> Usuario) -> Usuario -> Usuario
map f usuario =
  case usuario of
    Conectado x ->
      f x
    
    Desconectado ->
      usuario