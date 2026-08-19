-module(square_root).

-export([square_root/1]).


square_root(Radicand) -> 
    find_root(Radicand, 1).

find_root(Radicand, Guess) when Guess * Guess == Radicand -> 
    Guess;

find_root(Radicand, Guess) ->
    find_root(Radicand, Guess + 1).
                           
