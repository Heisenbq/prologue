grand_pa(X, Y) :-
    man(X),
    parent(X, Z),
    parent(Z, Y).

grand_pas(X) :-
    parent(Z, X),
    parent(Y, Z),
    man(Y),
    write(Y), nl,
    fail.
grand_pas(_).


grand_pa_and_da(X, Y) :-
    (grand_pa(X, Y), woman(Y));
    (grand_pa(Y, X), woman(X)).


aunt(X, Y) :-
    woman(X),
    parent(P, X),
    parent(P, Z),
    parent(Z, Y),
    X \= Z.


aunts(X) :-
    parent(Z, X),
    parent(P, Z),
    parent(P, Y),
    woman(Y),
    Y \= Z,
    write(Y), nl,
    fail.
aunts(_).
