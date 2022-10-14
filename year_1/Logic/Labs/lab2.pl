distance((X1, Y1), (X2, Y2), C) :- (C is sqrt((X1 - X2)**2 + (Y1-Y2)**2)).
add(X, Y, Z) :- Z is X+Y.

parent(bob, lisa).
parent(bob, paul).
parent(bob, mary).
parent(juliet, lisa).
parent(juliet, paul).
parent(juliet, mary).
parent(peter, harry).
parent(lisa, harry).
parent(mary, dony).
parent(mary, sandra).

fib(0, 1, 1).
fib(N, X, Y) :- N > 0, N1 is N-1, fib(N1, A, B), X is B, Y is A+B.

lg([], 0).
lg([_|T], X) :- lg(T, Y), X is Y+1.


line(0, _) :- nl.
line(X, C) :- X >= 1, write(C), X1 is X - 1, line(X1, C).
square(X, Y1, C) :- Y1 >=1, line(Y, C), A is Y1-1, square(Y, A, C).

element of(X,[X|_]).
element of(X,[_|Tail]) :- element of(X,Tail).