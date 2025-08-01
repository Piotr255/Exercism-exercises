-module(hamming).

-export([distance/2]).

distance(Strand1, Strand2) when length(Strand1) =/= length(Strand2) ->
  {error, badarg};
distance(Strand1, Strand2) ->
  ConnectedStrands = lists:zip(Strand1, Strand2),
  lists:foldl(fun({Letter1, Letter2}, InAcc) ->
                 case Letter1 =:= Letter2 of
                   true -> InAcc;
                   false -> InAcc + 1
                 end
              end,
              0,
              ConnectedStrands).
