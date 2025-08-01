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
  if Question ->
       case YellingSecond of
         true ->
           "Calm down, I know what I'm doing!";
         false ->
           "Sure."
       end;
     YellingSecond ->
       "Whoa, chill out!";
     TrimmedString =:= [] ->
       "Fine. Be that way!";
     true ->
       "Whatever."
  end.
