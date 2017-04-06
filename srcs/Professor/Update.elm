module Professor.Update exposing (update)

import Professor.Messages exposing (Msg(..))
import Professor.Models exposing (Professor)


update : Msg -> Professor -> Professor
update msg professor =
  case msg of
    AtualizaNome x ->
      { professor | nome = x }
    
    AtualizaDisciplina x ->
      { professor | disciplina = x }