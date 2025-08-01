-module(bob).

-export([response/1]).

response([]) ->
  "Fine. Be that way!";
response(String) ->
  YellingFirst =
    lists:all(fun(Letter) -> string:equal([Letter], [string:to_upper([Letter])]) end, String),
  NoLetters = re:replace(String, "[^a-zA-Z]", "", [global, {return, list}]) =:= [],
  YellingSecond = YellingFirst and not NoLetters,
  TrimmedString = string:trim(String),
  case TrimmedString =/= [] of
    true ->
      Question = lists:last(TrimmedString) =:= $?;
    false ->
      Question = false
  end,
  case {YellingSecond, TrimmedString, Question} of
    {true, _, true} ->
      "Calm down, I know what I'm doing!";
    {_, _, true} ->
      "Sure.";
    {true, _, false} ->
      "Whoa, chill out!";
    {_, [], _} ->
      "Fine. Be that way!";
    {_, _, _} ->
      "Whatever."
  end.
