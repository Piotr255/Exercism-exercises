-module(yacht).

-export([score/2]).

score(List, little_straight) ->
  case lists:sort(List) of
    [1, 2, 3, 4, 5] ->
      30;
    _ ->
      0
  end;
score(List, big_straight) ->
  case lists:sort(List) of
    [2, 3, 4, 5, 6] ->
      30;
    _ ->
      0
  end;
score(Dice, yacht) ->
  case Dice of
    [X, X, X, X, X] ->
      50;
    _ ->
      0
  end;
score(Dice, choice) ->
  lists:sum(Dice);
score(Dice, four_of_a_kind) ->
  CountMap = count_elements(Dice),
  {MaxNumber, MaxCount} = find_number_with_max_occurences(CountMap),
  case MaxCount >= 4 of
    true ->
      4 * MaxNumber;
    false ->
      0
  end;
score(Dice, full_house) ->
  CountMap = count_elements(Dice),
  Vals = maps:values(CountMap),
  Sum = lists:sum(Dice),
  case Vals of
    [2, 3] ->
      Sum;
    [3, 2] ->
      Sum;
    _ ->
      0
  end;
score(Dice, Category) ->
  Number =
    case Category of
      ones ->
        1;
      twos ->
        2;
      threes ->
        3;
      fours ->
        4;
      fives ->
        5;
      sixes ->
        6
    end,
  OccurNumber = count_occurences_of_given_number(Dice, Number),
  OccurNumber * Number.

count_occurences_of_given_number(List, Number) ->
  lists:foldl(fun(X, AccIn) ->
                 case X =:= Number of
                   true -> AccIn + 1;
                   false -> AccIn
                 end
              end,
              0,
              List).

count_elements(List) ->
  inner_ce(List, #{}).

inner_ce([], MapAcc) ->
  MapAcc;
inner_ce([H | T], MapAcc) ->
  inner_ce(T, maps:update_with(H, fun(X) -> X + 1 end, 1, MapAcc)).

find_number_with_max_occurences(Map) ->
  maps:fold(fun(K, V, AccIn) ->
               {_CurrKey, CurrVal} = AccIn,
               case V > CurrVal of
                 true -> {K, V};
                 false -> AccIn
               end
            end,
            {0, 0},
            Map).
