-module(acronym).

-export([abbreviate/1]).


abbreviate(Phrase) ->
    %% Запускаем перебор, собирая коды заглавных букв
    abbreviate_tail(Phrase, true, []).

%% Конец строки: разворачиваем накопленные коды символов в строку
abbreviate_tail([], _NewWord, Acc) ->
    lists:reverse(Acc);

%% Обработка разделителей (слова начинаются после них)
abbreviate_tail([$  | Tail], _, Acc) -> abbreviate_tail(Tail, true, Acc);
abbreviate_tail([$- | Tail], _, Acc) -> abbreviate_tail(Tail, true, Acc);
abbreviate_tail([$_ | Tail], _, Acc) -> abbreviate_tail(Tail, true, Acc);

%% Если это строчная латинская буква и это начало слова
abbreviate_tail([Char | Tail], true, Acc) when Char >= $a, Char =< $z ->
    UpperChar = Char - $a + $A, %% Быстрый перевод в верхний регистр по ASCII
    abbreviate_tail(Tail, false, [UpperChar | Acc]);

%% Если это заглавная латинская буква и это начало слова
abbreviate_tail([Char | Tail], true, Acc) when Char >= $A, Char =< $Z ->
    abbreviate_tail(Tail, false, [Char | Acc]);

%% Если мы внутри слова (пропускаем любые буквы)
abbreviate_tail([Char | Tail], false, Acc) when (Char >= $a andalso Char =< $z) orelse (Char >= $A andalso Char =< $Z) ->
    abbreviate_tail(Tail, false, Acc);

%% Игнорируем любые другие символы (апострофы, знаки препинания), сохраняя флаг начала слова
abbreviate_tail([_Char | Tail], NewWord, Acc) ->
    abbreviate_tail(Tail, NewWord, Acc).
