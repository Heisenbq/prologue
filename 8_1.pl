man(ivan).
 man(petr).
 man(alexey).
 man(sergey).
 man(dmitriy).
 
 woman(maria).
 woman(olga).
 woman(anna).
 woman(ekaterina).
 woman(natalia).
 
 parent(ivan, petr).
 parent(ivan, olga).
 parent(maria, petr).
 parent(maria, olga).
 parent(petr, alexey).
 parent(petr, anna).
 parent(ekaterina, alexey).
 parent(ekaterina, anna).
 parent(sergey, dmitriy).
 parent(sergey, natalia).
 parent(olga, dmitriy).
 parent(olga, natalia).
 
 men :- man(X), write(X), nl, fail.
 men.
 
 women :- woman(X), write(X), nl, fail.
 women.
 
 children(X) :- parent(X, Y), write(Y), nl, fail.
 children(X).
 
 mother(X, Y) :- woman(X), parent(X, Y).
 
 mother(X) :- parent(Y, X), woman(Y), write(Y), nl.
 
 brother(X, Y) :- man(X), X \= Y, parent(P, X), parent(P, Y), !.   
 
 brothers(X) :-
     setof(B, brother(B, X), Brothers),
     write(Brothers), nl.
 
 b_s(X, Y) :- parent(Z, X), parent(Z, Y).
 
 b_s(X) :- 
     setof(Y, (b_s(Y, X), Y\=X), BS),
     write(BS), nl.

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
