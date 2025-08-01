-module(accumulate).

-export([accumulate/2]).

%%
%% given a fun and a list, apply fun to each list item replacing list item with fun's return value.
%%
-spec accumulate(fun((A) -> B), [A]) -> [B].
accumulate(Fn, List) ->
  reverse(accumulate(Fn, List, [])).

accumulate(_Fn, [], Acc) ->
  Acc;
accumulate(Fn, [H | T], Acc) ->
  accumulate(Fn, T, [Fn(H) | Acc]).

reverse(List) ->
  inner_reverse(List, []).

inner_reverse([], Acc) ->
  Acc;
inner_reverse([H | T], Acc) ->
  inner_reverse(T, [H | Acc]).
