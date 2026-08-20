-module(hamming).

-export([distance/2]).

-spec distance(string(), string()) -> integer() | {error, badarg}.

distance(Strand1, Strand2) ->
    distance_tail(Strand1, Strand2, 0).

distance_tail([],[],Acc)->Acc;
%%либо первые символы одинаковые
distance_tail([H|T1],[H|T2],Acc)->
    distance_tail(T1,T2,Acc);
%%либо разные
distance_tail([H1|T1],[H2|T2],Acc)->
    distance_tail(T1,T2,Acc+1);
%%либо ошибка - дефолтный случай
distance_tail(_,_,Acc)->{error, badarg}.

%%хвостовая рекурсия проходит не сохранияя начальное значение(не держит стэк)