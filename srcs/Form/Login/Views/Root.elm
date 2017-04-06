module Form.Login.Views.Root exposing (view)

import Html exposing (Html, div, text, input, button)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Form.Login.Messages as Login exposing (Msg(..))
import Usuario.Messages as Usuario exposing (Msg(..))
import Form.Login.Models exposing (Box)


view : Box -> Html Login.Msg
view x =
  div []
    [ input [ onInput AtualizaId, placeholder "Usuário" ] []
    , input [ onInput AtualizaSenha, placeholder "Senha" ] []
    , button [ onClick <| Logar <| Conectar x.valores ] [ text "Logar" ]
    ]