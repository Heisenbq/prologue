max(X, Y, U, Z) :-
    max_of_two(X, Y, MaxXY),
    max_of_two(MaxXY, Z, U).

max_of_two(A, B, A) :- A >= B.
max_of_two(A, B, B) :- B > A.


fact_up(0, 1).
fact_up(N, X) :-
    N > 0,
    N1 is N - 1,
    fact_up(N1, X1),
    X is N * X1.


fact_down(N, X) :-
    fact_acc(N, 1, X).

fact_acc(0, Acc, Acc).
fact_acc(N, Acc, X) :-
    N > 0,
    NewAcc is Acc * N,
    N1 is N - 1,
    fact_acc(N1, NewAcc, X).


fact_up(0, 1).
fact_up(N, X) :-
    N > 0,
    N1 is N - 1,
    fact_up(N1, X1),
    X is N * X1.


sum_digits_up(0, 0).
sum_digits_up(N, Sum) :-
    N > 0,
    D is N mod 10,
    N1 is N // 10,
    sum_digits_up(N1, S1),
    Sum is S1 + D.



sum_digits_down(N, Sum) :-
    sum_digits_acc(N, 0, Sum).

sum_digits_acc(0, Acc, Acc).
sum_digits_acc(N, Acc, Sum) :-
    N > 0,
    D is N mod 10,
    N1 is N // 10,
    NewAcc is Acc + D,
    sum_digits_acc(N1, NewAcc, Sum).



square_free(N) :-
    N > 0,
    \+ has_square_factor(N, 2).

has_square_factor(N, F) :-
    F * F =< N,
    (0 is N mod (F * F);
     F1 is F + 1,
     has_square_factor(N, F1)).


read_list(List) :-
    write('Введите список (с точкой в конце): '), nl,
    read(List).

write_list([]).
write_list([H|T]) :-
    write(H), write(' '),
    write_list(T).


sum_list_down(List, Sum) :-
    sum_list_acc(List, 0, Sum).

sum_list_acc([], Acc, Acc).
sum_list_acc([H|T], Acc, Sum) :-
    NewAcc is Acc + H,
    sum_list_acc(T, NewAcc, Sum).

sum_list_up([H|T], Sum) :-
    sum_list_up(T, S1),
    Sum is S1 + H.


remove_by_digit_sum([], _, []).
remove_by_digit_sum([H|T], TargetSum, Result) :-
    sum_digits_up(H, S),
    (S =:= TargetSum ->
        remove_by_digit_sum(T, TargetSum, Result)
    ;
        remove_by_digit_sum(T, TargetSum, Rest),
        Result = [H|Rest]
    ).
