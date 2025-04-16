% film(Название, Жанр, Страна, До2000, Мультфильм, Оскар)

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
    write("Какой жанр у фильма?"), nl,
    write("1. Драма"), nl,
    write("2. Боевик"), nl,
    write("3. Фантастика"), nl,
    write("4. Комедия"), nl,
    read(X1).

question2(X2):- 
    write("Фильм снят в какой стране?"), nl,
    write("1. США"), nl,
    write("2. Великобритания"), nl,
    write("3. Франция"), nl,
    write("4. Япония"), nl,
    read(X2).

question3(X3):- 
    write("Фильм до 2000 года?"), nl,
    write("1. Да"), nl,
    write("0. Нет"), nl,
    read(X3).

question4(X4):- 
    write("Это мультфильм?"), nl,
    write("1. Да"), nl,
    write("0. Нет"), nl,
    read(X4).

question5(X5):- 
    write("Фильм получал Оскар?"), nl,
    write("1. Да"), nl,
    write("0. Нет"), nl,
    read(X5).



guess_film :-
    question1(X1), 
    question2(X2), 
    question3(X3),
    question4(X4), 
    question5(X5),
    film(Title, X1, X2, X3, X4, X5),
    nl, write("Ваш фильм: "), write(Title), nl, !.

% Если ничего не найдено
guess_film :- 
    write("К сожалению, я не смог угадать фильм."), nl.
