module Index exposing (main)

import Html exposing (program)
import Main.Messages exposing (Msg(..))
import Main.Models exposing (App, inicio)
import Main.Views.Root exposing (view)
import Main.Update exposing (update)


main : Program Never App Msg
main =
  program
  { init = inicio ! []
  , view = view
  , update = update
  , subscriptions = (\_ -> Sub.none)
  }