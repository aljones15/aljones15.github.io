import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main =
  App.beginnerProgram { model = head, view = view, update = update }

type alias Head =
  { name : String
  , github : String
  , linkedin : String
  , p_img : String
  }


head : Head
head =
  Head "" "" "" ""

type Msg
  = Name String
  | Password String
  | PasswordAgain String

update : Msg -> Head -> Head
update msg head =
  case msg of
    Name name ->
      { head | name = name }
    Password password ->
      { head | github = password }
    PasswordAgain password ->
      { head | linkedin = password }

view : Head -> Html Msg
view head =
  div []
    [ input [ type' "text", placeholder "Name", onInput Name ] []
    , input [ type' "password", placeholder "Password", onInput Password ] []
    , input [ type' "password", placeholder "Re-enter Password", onInput PasswordAgain
    ] []
      , viewValidation head
      ]

viewValidation : Head -> Html msg
viewValidation head =
  let
    (color, message) =
      if head.github == head.linkedin then
        ("green", "OK")
      else
        ("red", "Passwords do not match!")
  in
    div [ style [("color", color)]] [text message ]
