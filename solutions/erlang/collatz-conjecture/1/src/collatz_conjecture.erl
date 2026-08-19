-module(collatz_conjecture).

-export([steps/1]).

steps(_N) when _N=< 0 ->
    error(badarg);
steps(_N) -> 
    steps_tail(_N,0).
steps_tail(1, Acc) ->
    Acc;

%%steps_tail(_N, Acc) ->
%%    case _N of
%%        _ when _N rem 2 == 0 ->
%%            steps_tail(_N div 2, Acc + 1);
%%        _ ->
%%            steps_tail(_N*3+1, Acc + 1)
%%    end.
%% canonical code:
steps_tail(_N, Acc) when _N rem 2 ==0 ->
    steps_tail(_N div 2, Acc + 1);
steps_tail(_N, Acc) ->
    steps_tail(_N*3+1, Acc + 1).