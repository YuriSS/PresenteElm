module Form.Login.Models exposing (Box, inicio)

import Usuario.Models as Usuario exposing (Input, inicio)


type alias Box =
  { valores : Input
  }


inicio : Box
inicio =
  Box ("", "")