% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).  % limit term space (8Mb)
:- set_prolog_stack(local,  limit(2 000 000)).  % limit environment space

% Your program goes here

distance((A, B), (C, D), X):- X is sqrt((A-C) ** 2 + (B-D) ** 2).

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

ancestor_of(X, Y) :- parent(X, Y).
ancestor_of(X, Y) :- parent(X, Z), ancestor_of(Z, Y).

fib(0,1). % fib(0, 1) is 1
fib(1,1). % fib(1, 1) is 1
fib(N,X) :- 2 =< N, M is N - 1, fib(M, Y), P is N - 2, fib(P, Z), X is Y + Z.
% fib(N, X) adevarat daca n >= 2 si M este n-1 si fib(M, Y) si P este n-2, fib(P, Z) si X este Y+Z
% adaugam fib(n-1) cu fib(n-2)

fibo(0,0,1). % fibo(0,0,1) este 1
fibo(1,1,1). % fibo(1,1,1) este 1
fibo(N,Z,X) :- 2 =< N, M is N-1, fibo(M,Y,Z), X is Y + Z.
% N>=2 si M este N-1 si fibo(M, Y, Z) si X = Y+Z

fibg(N,X) :- fibo(N,_,X).


lg([], 0).
lg([_|T], X) :- lg(T, Y), X is Y+1.


line(0, _) :- nl.
line(X, C) :- X >= 1, write(C), X1 is X - 1, line(X1, C).
square(X, Y1, C) :- Y1 >=1, line(Y, C), A is Y1-1, square(Y, A, C).

element of(X,[X|_]).
element of(X,[_|Tail]) :- element of(X,Tail).

/** <examples> Your example queries go here, e.g.
?- member(X, [cat, mouse]).
*/

