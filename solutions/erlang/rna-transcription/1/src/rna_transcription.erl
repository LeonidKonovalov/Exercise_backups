-module(rna_transcription).

-export([to_rna/1]).


to_rna(_Strand) -> 
    [convert_rna(N) || N <- _Strand].

convert_rna(Ch) ->
    case Ch of 
        $G -> $C;
        $C -> $G;
        $T -> $A;
        $A -> $U
    end.
