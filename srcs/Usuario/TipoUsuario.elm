module Usuario.TipoUsuario exposing (TipoUsuario(..))

import Professor.Models as ProfessorModelo exposing (Professor)
import Aluno.Models as AlunoModelo exposing (Aluno)


type TipoUsuario
  = Professor ProfessorModelo.Professor
  | Aluno AlunoModelo.Aluno