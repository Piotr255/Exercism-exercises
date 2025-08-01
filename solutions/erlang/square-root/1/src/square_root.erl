-module(square_root).

-export([square_root/1]).

square_root(Radicand) ->
  in_square_root(0, Radicand, Radicand).

in_square_root(_, _, 1) ->
  1;
in_square_root(L, R, Number) ->
  Mid = (R - L) div 2 + L,
  PotentialResult = Mid * Mid,
  if PotentialResult =:= Number ->
       Mid;
     PotentialResult > Number ->
       in_square_root(L, Mid, Number);
     PotentialResult < Number ->
       in_square_root(Mid, R, Number)
  end.
