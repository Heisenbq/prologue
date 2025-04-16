son(X, Y) :-
    man(X),
    parent(Y, X).

son(X) :-
    parent(X, Y),
    man(Y),
    write(Y), nl,
    fail.
son(_).

husband(X, Y) :-
    man(X),
    woman(Y),
    parent(X, C),
    parent(Y, C),
    X \= Y.


husband(X) :-
    man(X),
    parent(X, C),
    parent(Y, C),
    woman(Y),
    write(Y), nl,
    fail.
husband(_)