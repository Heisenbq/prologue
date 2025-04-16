% film(Title, Genre, Country, Before2000, Animated, Oscar)

film("The Godfather", 1, 1, 1, 0, 1).
film("The Dark Knight", 2, 1, 0, 0, 1).
film("Pulp Fiction", 1, 1, 1, 0, 1).
film("Inception", 3, 1, 0, 0, 1).
film("Fight Club", 1, 1, 1, 0, 0).
film("Forrest Gump", 1, 1, 1, 0, 1).
film("The Matrix", 3, 1, 1, 0, 1).
film("Interstellar", 3, 1, 0, 0, 1).
film("Gladiator", 2, 1, 0, 0, 1).
film("Amélie", 4, 3, 0, 0, 0).
film("Your Name", 1, 4, 0, 1, 0).
film("Spirited Away", 3, 4, 0, 1, 1).
film("The Lion King", 1, 1, 1, 1, 1).
film("Shrek", 4, 1, 0, 1, 1).
film("Titanic", 1, 1, 1, 0, 1).
film("The Grand Budapest Hotel", 4, 2, 0, 0, 0).
film("The Intouchables", 1, 3, 0, 0, 0).
film("Akira", 3, 4, 1, 1, 0).
film("The Pianist", 1, 2, 0, 0, 1).
film("Toy Story", 4, 1, 1, 1, 1).

% Вопросы пользователю

question1(X1):- 
    write("What is the genre of the movie?"), nl,
    write("1. Drama"), nl,
    write("2. Action"), nl,
    write("3. Sci-Fi"), nl,
    write("4. Comedy"), nl,
    read(X1).

question2(X2):- 
    write("Which country was the movie made in?"), nl,
    write("1. USA"), nl,
    write("2. UK"), nl,
    write("3. France"), nl,
    write("4. Japan"), nl,
    read(X2).

question3(X3):- 
    write("Was the movie released before the year 2000?"), nl,
    write("1. Yes"), nl,
    write("0. No"), nl,
    read(X3).

question4(X4):- 
    write("Is it an animated movie?"), nl,
    write("1. Yes"), nl,
    write("0. No"), nl,
    read(X4).

question5(X5):- 
    write("Did the movie win an Oscar?"), nl,
    write("1. Yes"), nl,
    write("0. No"), nl,
    read(X5).


guess_film :-
    question1(X1), 
    question2(X2), 
    question3(X3),
    question4(X4), 
    question5(X5),
    film(Title, X1, X2, X3, X4, X5),
    nl, write("Your movie might be: "), write(Title), nl, !.

guess_film :- 
    write("Sorry, I couldn't guess the movie."), nl.
