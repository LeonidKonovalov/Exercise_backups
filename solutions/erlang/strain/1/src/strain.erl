-module(strain).

-export([keep/2, discard/2]).

%%keep(Fn, List) ->
%%  [X || X <- List, Fn(X)].

%%discard(Fn, List) ->
%%  [X || X <- List, not Fn(X)].

keep(Fn, []) -> 
    [];

keep(Fn, [H | T]) ->
    case Fn(H) of
        true -> [H | keep(Fn, T)];
        false -> keep(Fn, T)
    end.

discard(Fn, []) -> 
    [];
discard(Fn, [H | T]) ->
    case Fn(H) of
        true -> discard(Fn, T);
        false -> [H | discard(Fn, T)]
    end.

%%keep(Fn, List) ->
%%    lists:filter(Fn, List).
%%discard() not Fn