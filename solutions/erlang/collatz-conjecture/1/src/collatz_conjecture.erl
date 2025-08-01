-module(collatz_conjecture).

-export([steps/1]).

steps(N) ->
  steps(N, 0).

steps(1, Counter) ->
  Counter;
steps(N, Counter) ->
  case N rem 2 =:= 0 of
    true ->
      steps(N div 2, Counter + 1);
    false ->
      steps(N * 3 + 1, Counter + 1)
  end.
