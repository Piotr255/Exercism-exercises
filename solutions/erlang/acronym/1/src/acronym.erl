-module(acronym).

-export([abbreviate/1]).

abbreviate(Phrase) ->
  lists:map(fun([H | _]) ->
               [UpperLetter] = string:uppercase([H]),
               UpperLetter
            end,
            string:lexemes(Phrase, " -_")).
