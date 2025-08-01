-module(custom_set).

-export([add/2, contains/2, difference/2, disjoint/2, empty/1, equal/2, from_list/1,
         intersection/2, subset/2, union/2]).

add(Elem, Set) ->
  Contains = contains(Elem, Set),
  case Contains of
    false ->
      [Elem | Set];
    true ->
      Set
  end.

contains(Elem, Set) ->
  FilteredList = [X || X <- Set, X =:= Elem],
  case FilteredList of
    [] ->
      false;
    _ ->
      true
  end.

difference(Set1, Set2) ->
  [X || X <- Set1, not lists:member(X, Set2)].

disjoint(Set1, Set2) ->
  TestList = intersection(Set1, Set2),
  case TestList of
    [] ->
      true;
    _ ->
      false
  end.

empty([]) ->
  true;
empty(_Set) ->
  false.

equal(Set1, Set2) ->
  inner_equal(lists:sort(Set1), lists:sort(Set2)).

inner_equal([], []) ->
  true;
inner_equal([], _) ->
  false;
inner_equal(_, []) ->
  false;
inner_equal([H1 | S1], [H2 | S2]) ->
  case H1 =:= H2 of
    true ->
      inner_equal(S1, S2);
    false ->
      false
  end.

from_list([]) ->
  [];
from_list(List) ->
  SortedList = lists:sort(List),
  [H | _T] = SortedList,
  inner_from_list(SortedList, [H]).

inner_from_list([_H], NewList) ->
  lists:reverse(NewList);
inner_from_list([H1, H2 | T], NewList) ->
  case H1 =:= H2 of
    true ->
      inner_from_list([H2 | T], NewList);
    false ->
      inner_from_list([H2 | T], [H2 | NewList])
  end.

intersection(Set1, Set2) ->
  [X || X <- Set1, lists:member(X, Set2)].

subset(Set1, Set2) ->
  TestList = [X || X <- Set1, not lists:member(X, Set2)],
  case TestList of
    [] ->
      true;
    _ ->
      false
  end.

union(Set1, Set2) ->
  Set1 ++ [X || X <- Set2, not lists:member(X, Set1)].
