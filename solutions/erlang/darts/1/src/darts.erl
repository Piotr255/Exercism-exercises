-module(darts).

-export([score/2]).

score(X, Y) ->
  Distance = calculate_distance_from_middle(X, Y),
  transform_distance_to_points(Distance).

transform_distance_to_points(X) when X > 10 ->
  0;
transform_distance_to_points(X) when X > 5 ->
  1;
transform_distance_to_points(X) when X > 1 ->
  5;
transform_distance_to_points(_X) ->
  10.

calculate_distance_from_middle(X, Y) ->
  math:sqrt(math:pow(X, 2) + math:pow(Y, 2)).
