module Professor.Views.Root exposing (view)

import Html exposing (Html, b, div, text)
import Professor.Models exposing (Professor)


view : Professor -> Html msg
view x =
  div []
    [ b [] [ text <| "Professor(a) " ++ x.nome ]
    , text ", "
    , text x.disciplina
    ]