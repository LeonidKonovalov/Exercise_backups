-module(bob).

-export([response/1]).


response(_String) -> 
    case string:trim(_String) of 
        "" -> 
            "Fine. Be that way!";
        Clean ->
            IsQuestion = (lists:last(Clean) == $?),
            IsYelling = is_yelling(Clean),
            
            case {IsQuestion, IsYelling} of
                {true, true}   -> "Calm down, I know what I'm doing!";
                {true, false}  -> "Sure.";
                {false, true}  -> "Whoa, chill out!";
                {false, false} -> "Whatever."
            end
    end.

is_yelling(Str) -> 
    HasLetters = lists:any(fun(C) -> (C >= $A andalso C =< $Z) orelse (C >= $a andalso C =< $z) end, Str),
    HasLetters andalso (Str == string:uppercase(Str)).