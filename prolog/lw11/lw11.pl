% Task 3.1
trim(L1,L2) :- append([_|T1], [_], L1), append(T1, [], L2).

% Task 3.2
first_last(L1,L2) :- append([F|M], [L], L1), append([L|M], [F], L2).

% Task 3.3
total([],1).
total([H|T],N) :- total(T, N1), N is H * N1.

%  Task 3.4
place(X,L,[X|L]).
place(X, [H|T1], [H|T2]) :- place(X, T1, T2).

% Task 3.5
double([],[]).
double([H|T],[H,H|T1]) :- double(T, T1).

% Task 3.6
split([],[],[]).
split([H|T], L2, L3) :-(0 is H mod 2 -> split(T,[H|L2],L3); split(T,L2,[H|L3])).

% Task 3.7
repeat_back3(L1,L2) :- append([F|M], [L], L1), append([L,L,L|M], [F,F,F], L2).

% Task 3.8
combi([],L2,L2).
combi(L1,[],L1).
combi([H1|T1], [H2|T2], [H1,H2|T3]) :- combi(T1,T2,T3).