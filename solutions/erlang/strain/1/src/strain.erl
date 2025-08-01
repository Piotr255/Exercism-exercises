-module(strain).

-export([keep/2, discard/2]).

keep(Fn, List) ->
  reverse(filter(Fn, List, [], true)).

discard(Fn, List) ->
  reverse(filter(Fn, List, [], false)).

filter(_Fn, [], Acc, _Keep) ->
  Acc;
filter(Fn, [H | T], Acc, Keep) ->
  ShouldKeep = not (Fn(H) xor Keep),
  case ShouldKeep of
    true ->
      filter(Fn, T, [H | Acc], Keep);
    false ->
      filter(Fn, T, Acc, Keep)
  end.

reverse(List) ->
  reverse(List, []).

reverse([], Acc) ->
  Acc;
reverse([H | T], Acc) ->
  reverse(T, [H | Acc]).
