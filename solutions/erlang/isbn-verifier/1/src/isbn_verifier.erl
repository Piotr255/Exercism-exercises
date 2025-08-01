-module(isbn_verifier).

-export([is_valid/1]).

is_valid(Isbn) ->
  check_format(Isbn) andalso check_correct_sum(Isbn).

check_format([]) ->
  false;
check_format(Isbn) ->
  ModifiedList = re:replace(Isbn, "([0-9]-?){9}[0-9X]", "", [global, {return, list}]),
  case ModifiedList of
    [] ->
      true;
    _ ->
      false
  end.

check_correct_sum(Isbn) ->
  ModifiedList = re:replace(Isbn, "[^0-9X]+", "", [global, {return, list}]),
  NumberList = lists:map(fun(Sign) -> convert_to_number(Sign) end, ModifiedList),
  calculate_formula(NumberList) rem 11 == 0.

calculate_formula(FilteredIsbnCode) ->
  Seq =
    lists:reverse(
      lists:seq(1, 10)),
  Product = [X * Y || {X, Y} <- lists:zip(FilteredIsbnCode, Seq)],
  lists:sum(Product).

convert_to_number($X) ->
  10;
convert_to_number(Number) ->
  list_to_integer([Number]).
