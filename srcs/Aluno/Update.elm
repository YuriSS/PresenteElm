module Aluno.Update exposing (update)

import Aluno.Messages exposing (Msg(..))
import Aluno.Models exposing (Aluno)


update : Msg -> Aluno -> Aluno
update msg aluno =
  case msg of
    AtualizaNome x ->
      { aluno | nome = x }
    
    AtualizaSobrenome x ->
      { aluno | sobrenome = x }