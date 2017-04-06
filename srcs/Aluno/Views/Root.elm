module Aluno.Views.Root exposing (view)

import Html exposing (Html, b, div, text)
import Aluno.Models exposing (Aluno)


view : Aluno -> Html msg
view x =
  div []
    [ b [] [ text <| "Aluno(a) " ++ x.nome ]
    , text " "
    , text x.sobrenome
    ]