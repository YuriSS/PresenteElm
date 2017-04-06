module Professor.Models exposing (Professor, inicio)


type alias Professor =
  { nome : String
  , disciplina : String
  }


inicio : Professor
inicio =
  Professor "" ""