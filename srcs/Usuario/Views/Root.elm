module Usuario.Views.Root exposing (view)

import Html exposing (Html, div, text)

import Usuario.Models exposing (Usuario(..))
import Usuario.TipoUsuario exposing (TipoUsuario(..))

import Professor.Views.Root as Professor exposing (view)
import Aluno.Views.Root as Aluno exposing (view)


view : Usuario -> Html msg
view x =
  case x of
    Conectado usuario ->
      div []
        [ div [] [ text <| "Usuário " ++ usuario.id ]
        , div [] [ text <| "Senha " ++ usuario.senha ]
        , imprimiUsuario usuario.tipo
        ]
    
    Desconectado ->
      div [] [ text "Usuário não conectado." ]


imprimiUsuario : TipoUsuario -> Html msg
imprimiUsuario tipo =
  case tipo of
    Professor x ->
      Professor.view x
    
    Aluno x ->
      Aluno.view x