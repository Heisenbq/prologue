max_digit_up(0, 0).
max_digit_up(N, Max) :-
    N > 0,
    D is N mod 10,
    N1 is N // 10,
    max_digit_up(N1, MaxRest),
    Max is max(D, MaxRest).

max_digit_down(N, Max) :-
    max_digit_acc(N, 0, Max).

max_digit_acc(0, Max, Max).
max_digit_acc(N, CurrentMax, Max) :-
    D is N mod 10,
    NewMax is max(D, CurrentMax),
    N1 is N // 10,
    max_digit_acc(N1, NewMax, Max).


min_odd_digit_up(N, Min) :-
    findall(D, (digit_in_number(N, D), D mod 2 =:= 1), OddDigits),
    min_list(OddDigits, Min).

digit_in_number(0, []) :- !.
digit_in_number(N, D) :-
    N > 0,
    D1 is N mod 10,
    N1 is N // 10,
    (D = D1; digit_in_number(N1, D)).


min_odd_digit_up2(0, 10).  % 10 - заглушка (выше максимальной цифры)
min_odd_digit_up2(N, Min) :-
    N > 0,
    D is N mod 10,
    N1 is N // 10,
    min_odd_digit_up2(N1, MinRest),
    (D mod 2 =:= 1 -> Min is min(D, MinRest); Min = MinRest),
    Min < 10.  % хотя бы одна нечётная цифра


min_odd_digit_down(N, Min) :-
    min_odd_acc(N, 10, Min),
    Min < 10.

min_odd_acc(0, Acc, Acc).
min_odd_acc(N, CurrentMin, Min) :-
    D is N mod 10,
    N1 is N // 10,
    (D mod 2 =:= 1 -> NewMin is min(CurrentMin, D); NewMin = CurrentMin),
    min_odd_acc(N1, NewMin, Min).


gcd(A, 0, A) :- A > 0.
gcd(A, B, GCD) :-
    B > 0,
    R is A mod B,
    gcd(B, R, GCD).


?- gcd(28, 35, G).
G = 7.

?- max_digit_up(5287, Max).
Max = 8.

?- min_odd_digit_down(52074, Min).
Min = 1.
