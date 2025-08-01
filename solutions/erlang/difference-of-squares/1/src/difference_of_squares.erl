-module(difference_of_squares).

-export([difference_of_squares/1, square_of_sum/1, sum_of_squares/1]).


difference_of_squares(Number) ->  square_of_sum(Number) - sum_of_squares(Number).

square_of_sum(Number) -> round(math:pow(Number * (Number + 1) / 2, 2)).

sum_of_squares(Number) -> round(((Number * (Number + 1) * (2 * Number + 1)) / 6)).