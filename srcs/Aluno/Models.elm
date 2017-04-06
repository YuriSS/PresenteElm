module Aluno.Models exposing (Aluno, inicio)


type alias Aluno =
  { nome : String
  , sobrenome : String
  }


inicio : Aluno
inicio =
  Aluno "" ""