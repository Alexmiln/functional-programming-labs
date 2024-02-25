% Task 1

seg(1, point(1,11), point(14,11)).
seg(2, point(2,4), point(13,4)).
seg(3, point(2,2), point(9,2)).
seg(4, point(3,1), point(3,10)).
seg(5, point(7,10), point(13,10)).
seg(6, point(8,0), point(8,13)).
seg(7, point(10,3), point(10,12)).
seg(8, point(11,3), point(11,13)).
seg(9, point(12,2), point(12,12)).

horiz(N) :- seg(N, point(X1,Y), point(X2,Y)), X1 \= X2.

vertical(N) :- seg(N, point(X,Y1), point(X,Y2)), Y1 \= Y2.


% Task 2

seglength(N, L) :- 
    seg(N, point(X1,Y1), point(X2,Y2)), 
    sqrt((X2 - X1) * (X2 - X1) + (Y2 - Y1) * (Y2 - Y1), LL),
    L is round(LL). % Беспощадный костыль 
    % Для данного условия лабораторной достаточно определения длины как:
    % NL is Y2-Y1,ML is X2-X1 вместо использования правила seglength/2,
    % Иначе правило выдаёт число с плавающей точкой === проваленный тест

cross(N,M,point(X,Y),NL,ML) :- 
    seg(N, point(X,Y1), point(X,Y2)),
    seg(M, point(X1,Y), point(X2,Y)),
    Y > Y1, Y < Y2,X > X1,X < X2,
    seglength(N,NL),
    seglength(M,ML).


% Task 3

perimetr(A,B,C,D,P,S) :-
    seg(A, _, _),
    seg(B, _, _),
    seg(C, _, _),
    seg(D, _, _),
    vertical(A), vertical(C), horiz(B), horiz(D),
    cross(A, B, point(XAB, YAB), _, _),
    cross(A, D, point(_, YAD), _, _),
    cross(C, B, point(XCB, _), _, _),
    cross(C, D, point(_, _), _, _),
    abs(YAB - YAD, LABD),
    abs(XCB - XAB, LBAC),
    P is 2*(LABD + LBAC),
    S is LABD * LBAC.

