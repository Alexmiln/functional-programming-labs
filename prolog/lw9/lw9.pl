% Task1

% a)
male(bill).
male(paul).
male(joe).
male(jim).
male(bob).

female(sue).
female(mary).
female(ann).
female(tammy).

parent(bill,joe).
parent(sue,joe).
parent(bill,ann).
parent(sue,ann).
parent(paul,jim).
parent(mary,jim).
parent(joe,tammy).
parent(ann,bob).
parent(jim,bob).

% b) ?- grandmother(X,bob).
grandmother(X,Y) :- parent(Z,Y), parent(X,Z), female(X).

% c) ?- grandson(X,paul).
grandson(X,Y) :- parent(Z,X), parent(Y,Z), male(X).

% d) ?- sister(X,jim).
different(X,Y):- X\=Y.

sister(X,Y) :- parent(Z,X), parent(Z,Y), female(X), different(X,Y).

% e)  ?- aunt(ann,tammy).
aunt(X,Y) :- parent(Z,Y), sister(X,Z).

% f) ?- cousin(bob,tammy).
% cousin(X,Y) :- aunt(Z,Y), parent(Z,X). - не работает, когда нет тёти
cousin(X,Y) :- parent(A,B), parent(A,C), B\=C, parent(B,X), parent(C,Y), X\=Y.


% Task2

% a)
likes(ellen,reading).
likes(john,computers).
likes(john,badminton).
likes(john,photo).
likes(john,reading).
likes(leonard,badminton).
likes(eric,swimming).
likes(eric,reading).
likes(eric,chess).
likes(paul,swimming).

% b) 4 hobbies
four_hobbies_dude(Person) :- likes(Person,_), findall(Hobby, likes(Person,Hobby), Hobbies), length(Hobbies, 4).

% c) same hobby dudes
same_hobby_dudes(Person1, Person2) :- likes(Person1,Hobby), likes(Person2,Hobby), Person1 \= Person2.