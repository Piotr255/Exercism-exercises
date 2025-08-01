-module(saddle_points).

-export([saddle_points/1, find_max_indices/1, verify_being_min_val_in_col/5]).

saddle_points([[]]) ->
  [];
saddle_points(Matrix) ->
  in_saddle_points(Matrix, Matrix, 1, []).

in_saddle_points(_Matrix, [], _Counter, Points) ->
  lists:map(fun({X, Y}) -> {X - 1, Y - 1} end, Points);
in_saddle_points(Matrix, [Row | RestMatrix], Counter, Points) ->
  MaxRowVal = lists:max(Row),
  MaxIndicesForRow = find_max_indices(Row),
  FilteredIndices =
    lists:filter(fun(ColIndex) ->
                    verify_being_min_val_in_col(Matrix, MaxRowVal, Counter, ColIndex, 1)
                 end,
                 MaxIndicesForRow),
  NewPoints = lists:map(fun(Index) -> {Counter, Index} end, FilteredIndices),
  in_saddle_points(Matrix, RestMatrix, Counter + 1, NewPoints ++ Points).

verify_being_min_val_in_col([], _Val, _RowIndex, _ColIndex, _Counter) ->
  true;
verify_being_min_val_in_col([Row | RestMatrix], Val, RowIndex, ColIndex, Counter) ->
  ColVal = lists:nth(ColIndex, Row),
  case Val > ColVal of
    true ->
      false;
    false ->
      verify_being_min_val_in_col(RestMatrix, Val, RowIndex, ColIndex, Counter + 1)
  end.

find_max_indices(Row) ->
  in_find_max_indices(Row, lists:max(Row), [], 1).

in_find_max_indices([], _MaxVal, CurrIndices, _Counter) ->
  lists:reverse(CurrIndices);
in_find_max_indices([H | T], MaxVal, CurrIndices, Counter) ->
  case H =:= MaxVal of
    true ->
      in_find_max_indices(T, MaxVal, [Counter | CurrIndices], Counter + 1);
    false ->
      in_find_max_indices(T, MaxVal, CurrIndices, Counter + 1)
  end.
