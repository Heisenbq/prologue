:- dynamic high/2.

read_str(A):- get0(X), r_str(X,A,[]).
r_str(10,A,A):- !.
r_str(X,A,B):- append(B,[X],B1), get0(X1), r_str(X1,A,B1).


high_r(X,Y):- 
    repeat, 
    (high(X,Y) -> 
        (put(32), write(X), nl, write(Y), write("."), nl, retract(high(X,Y))) 
        ; X=nil, Y=nil).
        
pr2:- 
    tell('c:/Prolog/29_1_prolog_F/111.txt'), 
    high_r(X,_), 
    X=nil, 
    told.
    
pr3:- 
    see('c:/Prolog/29_1_prolog_F/111.txt'), 
    get0(Sym), 
    read_high(Sym), 
    seen.

read_high(-1):- !.
read_high(_):- 
    read_str(Lang), 
    name(X,Lang), 
    read(Y), 
    asserta(high(X,Y)), 
    get0(Sym), 
    read_high(Sym).

% high level
high(ruby,1). high(c_sharp,1). high(python,1). high(c_plu_plus,1). high(f_sharp,1).
high(prolog,1). high(c,0). high(asm,0).
high(java,1). high(haskell,1). high(javascript,1).

% declarative
decl(ruby,0). decl(c_sharp,0). decl(python,0). decl(c_plu_plus,0). decl(f_sharp,1).
decl(prolog,1). decl(c,0). decl(asm,0).
decl(java,0). decl(haskell,1). decl(javascript,0).

% interpreted
interpret(ruby,1). interpret(python,1). interpret(f_sharp,1). interpret(prolog,1).
interpret(c_sharp,0). interpret(c_plu_plus,0). interpret(c,0). interpret(asm,0).
interpret(java,0). interpret(haskell,1). interpret(javascript,1).

% OOP level
oop(ruby,3). oop(c_sharp,3). oop(python,2). oop(c_plu_plus,2). oop(f_sharp,1).
oop(prolog,1). oop(c,0). oop(asm,0).
oop(java,3). oop(haskell,1). oop(javascript,2).

% crossplatform
cross(ruby,1). cross(python,1). cross(c_plu_plus,1). cross(prolog,1). cross(c,1).
cross(asm,1). cross(c_sharp,0). cross(f_sharp,0).
cross(java,1). cross(haskell,1). cross(javascript,1).

% visual support
visual(c_sharp,3). visual(ruby,2). visual(python,2). visual(c_plu_plus,2).
visual(f_sharp,2). visual(prolog,1). visual(c,0). visual(asm,0).
visual(java,2). visual(haskell,0). visual(javascript,2).

% mobile support
mobile(c_sharp,0). mobile(ruby,0). mobile(python,0). mobile(c_plu_plus,0).
mobile(f_sharp,0). mobile(prolog,0). mobile(c,0). mobile(asm,0).
mobile(java,0). mobile(haskell,0). mobile(javascript,0).

% web development
web(c_sharp,1). web(ruby,1). web(python,1). web(c_plu_plus,0). web(f_sharp,0).
web(prolog,0). web(c,0). web(asm,0).
web(java,1). web(haskell,0). web(javascript,1).


question1(X1):-	
    write("Is your language high level?"),nl,
    write("1. Yes"),nl, write("0. No"),nl,
    read(X1).

question2(X2):-	
    write("Is your language declarative?"),nl,
    write("1. Yes"),nl, write("0. No"),nl,
    read(X2).

question3(X3):-	
    write("Is your language interpreted?"),nl,
    write("1. Yes"),nl, write("0. No"),nl,
    read(X3).

question4(X4):-	
    write("Does your language support OOP?"),nl,
    write("3. It is OOP itself"),nl,
    write("2. Yes"),nl,
    write("1. Yes, but very hard"),nl,
    write("0. No"),nl,
    read(X4).

question5(X5):-	
    write("Is your language cross-platform?"),nl,
    write("1. Yes"),nl, write("0. No"),nl,
    read(X5).

question6(X6):-	
    write("Does your language support a visual interface?"),nl,
    write("3. It is visual itself"),nl,
    write("2. Yes"),nl,
    write("1. Yes, but very hard"),nl,
    write("0. No"),nl,
    read(X6).

question7(X7):-	
    write("Is your language designed for mobile phones?"),nl,
    write("1. Yes"),nl, write("0. No"),nl,
    read(X7).

question8(X8):-	
    write("Is your language used for web development?"),nl,
    write("1. Yes"),nl, write("0. No"),nl,
    read(X8).


pr:-	
    question1(X1), question2(X2), question3(X3), question4(X4),
    question5(X5), question6(X6), question7(X7), question8(X8),
    high(X,X1), decl(X,X2), interpret(X,X3), oop(X,X4),
    cross(X,X5), visual(X,X6), mobile(X,X7), web(X,X8),
    nl, write("Your language is: "), write(X), nl.

