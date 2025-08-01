-module(queen_attack).

-export([can_attack/2]).

can_attack(WhiteQueen, BlackQueen) ->
  {X1, Y1} = WhiteQueen,
  {X2, Y2} = BlackQueen,
  case {X1, Y1, X2, Y2} of
    {SameX, _, SameX, _} ->
      true;
    {_, SameY, _, SameY} ->
      true;
    _ when X1 - Y1 =:= X2 - Y2 ->
      true;
    _ when X1 + Y1 =:= X2 + Y2 ->
      true;
    _ ->
      false
  end.
