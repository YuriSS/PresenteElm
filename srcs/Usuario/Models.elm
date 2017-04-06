module Usuario.Models exposing (Usuario(..), UsuarioMolde, Input, inicio, listaInicial)

import Usuario.TipoUsuario exposing (TipoUsuario(..))


type alias UsuarioMolde =
  { id : String
  , senha : String
  , tipo : TipoUsuario
  }


type alias Input =
  (String, String)


type Usuario
  = Conectado UsuarioMolde
  | Desconectado


inicio : Usuario
inicio =
  Desconectado


listaInicial : List Usuario
listaInicial =
  [ Conectado
      <| UsuarioMolde "suzel" "123"
      <| Aluno { nome = "Suzel"
                    , sobrenome = "Korff"
                    }
  , Conectado
      <| UsuarioMolde "joaquina" "123"
      <| Professor { nome = "Joaquina"
                    , disciplina = "Educação Infântil"
                    }
  ]