-module(rna_transcription).

-export([to_rna/1]).

dna_to_rna($G) ->
  $C;
dna_to_rna($C) ->
  $G;
dna_to_rna($T) ->
  $A;
dna_to_rna($A) ->
  $U.

to_rna(Strand) ->
  lists:reverse(inner_to_rna(Strand, "")).

inner_to_rna([], Translated) ->
  Translated;
inner_to_rna([H | Strand], Translated) ->
  inner_to_rna(Strand, [dna_to_rna(H) | Translated]).
