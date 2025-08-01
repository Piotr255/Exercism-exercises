-module(series).

-export([slices/2, in_slices/3]).

slices(SliceLength, Series) when length(Series) < SliceLength ->
  erlang:error(too_short);
slices(SliceLength, Series) ->
  in_slices(SliceLength, Series, []).

in_slices(Length, Series, Acc) when length(Series) < Length ->
  lists:reverse(Acc);
in_slices(Length, [_H | RestSeries] = Series, Acc) ->
  SlicedList = lists:sublist(Series, Length),
  in_slices(Length, RestSeries, [SlicedList | Acc]).
