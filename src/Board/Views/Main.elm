
module Board.Views.Main exposing (view)

import Html exposing (Html, div, text, ul, li, input, table, thead, tr, th, tbody, td)
import Html.Attributes exposing (type_, checked, class)
import Html.Events exposing (onClick)

import Board.Messages exposing (Msg (..), Presence (..))
import Board.Models exposing (Student, User, Date, initDate)



view : List Student -> Html Msg
view xs =
    div [ class "pa4" ]
        [ div [ class "overflow-auto" ]
            [ table [ class "f6 w-100 mw8 center" ]
                <| List.append [ renderHeader xs ] [ renderBody xs ]
            ]
        ]

renderHeader : List Student -> Html msg
renderHeader xs =
    thead []
        [ tr [] <| renderHeaderCols xs
        ]

renderHeaderCols : List Student -> List (Html msg)
renderHeaderCols xs =
    List.foldl
        (\ date acc ->
            List.append acc [ th [ class "fw6 bb b--black-20 tl pb3 pr3 bg-white" ] [ text date.day ] ] )
        [ th [ class "fw6 bb b--black-20 tl pb3 pr3 bg-white" ] [ text "Name" ] ]
        ( Maybe.withDefault [] <| ( Maybe.map (\x -> x.dates) <| List.head xs )  )

renderBody : List Student -> Html Msg
renderBody =
    tbody [] << List.map renderStudent

renderStudent : Student -> Html Msg
renderStudent x =
    tr [ onClick <| Clicked x.user.name ]
        <| List.foldl
                (\ date acc ->
                    List.append acc [ td [ class "pv3 pr3 bb b--black-2" ] [ renderPresence x.user date ] ] )
                [ (td [ class "pv3 pr3 bb b--black-2" ] [ text x.user.name ]) ]
                x.dates

renderPresence : User -> Date -> Html Msg
renderPresence x y =
    case y.presence of
        Present ->
            div [ onClick <| ChangeStatus x.name y.day ] [ input [ type_ "checkbox", checked True ] [] ]
        Absent ->
            div [ onClick <| ChangeStatus x.name y.day ] [ input [ type_ "checkbox", checked False ] [] ]