module Main.Models exposing (App, inicio)

import Aluno.Models exposing (Aluno)
import Usuario.Models as Usuario exposing (Usuario, inicio, listaInicial)
import Form.Login.Models as Login exposing (Box, inicio)


type alias App =
  { alunos : List Aluno
  , usuario : Usuario
  , usuarios : List Usuario
  , login : Box
  }


inicio : App
inicio =
  App
    []
    -- ( Maybe.withDefault Usuario.inicio <| List.head Usuario.listaInicial )
    Usuario.inicio
    Usuario.listaInicial
    Login.inicio
