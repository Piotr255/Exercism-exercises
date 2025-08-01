-module(raindrops).

-export([convert/1]).

map_number_to_string(Number) ->
  if Number =:= 3 ->
       "Pling";
     Number =:= 5 ->
       "Plang";
     Number =:= 7 ->
       "Plong";
     true ->
       integer_to_list(Number)
  end.

convert(Number) ->
  convert(Number, "", [3, 5, 7]).

convert(Number, Result, []) ->
  case string:is_empty(Result) of
    true ->
      integer_to_list(Number);
    false ->
      Result
  end;
convert(Number, Result, [H | DivNums]) ->
  case Number rem H =:= 0 of
    true ->
      convert(Number, Result ++ map_number_to_string(H), DivNums);
    false ->
      convert(Number, Result, DivNums)
  end.
