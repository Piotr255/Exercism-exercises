-module(diamond).

-export([rows/1, build_row/3]).

-define(START_LETTER, $A).

rows(Letter) ->
  LetterNumber = hd(Letter),
  in_rows(LetterNumber).

in_rows($A) ->
  ["A"];
in_rows(EndLetter) ->
  DistanceBtw = EndLetter - ?START_LETTER,
  Letters = lists:seq(?START_LETTER, EndLetter - 1),
  AllLettersForDiamond = lists:flatten([Letters, EndLetter, lists:reverse(Letters)]),
  SSList = lists:seq(1, DistanceBtw),
  AllSSList = lists:flatten([lists:reverse(SSList), 0, SSList]),
  MSList = lists:seq(1, 2 * DistanceBtw - 2, 2),
  AllMSList = lists:flatten([0, MSList, 2 * DistanceBtw - 1, lists:reverse(MSList), 0]),
  FinalList = lists:zip3(AllLettersForDiamond, AllSSList, AllMSList),
  lists:map(fun({Letter, SS, MS}) -> build_row(Letter, SS, MS) end, FinalList).

build_row(CurrentLetter, SideSpacesNumber, MiddleSpacesNumber) ->
  SideSpaces = lists:duplicate(SideSpacesNumber, $ ),
  case MiddleSpacesNumber =:= 0 of
    true ->
      lists:flatten([SideSpaces, CurrentLetter, SideSpaces]);
    false ->
      lists:flatten([SideSpaces,
                     CurrentLetter,
                     lists:duplicate(MiddleSpacesNumber, $ ),
                     CurrentLetter,
                     SideSpaces])
  end.
