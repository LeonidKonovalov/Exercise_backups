-module(raindrops).

-export([convert/1]).


convert(_Number) -> 
    S = [
         if _Number rem 3 == 0 -> "Pling"; true -> "" end,
         if _Number rem 5 == 0 -> "Plang"; true -> "" end,
         if _Number rem 7 == 0 -> "Plong"; true -> "" end
    ],
    Res = lists:flatten(S),
    case Res of 
        "" -> integer_to_list(_Number);
        _ -> Res
    end.