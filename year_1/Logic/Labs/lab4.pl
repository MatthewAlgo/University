% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).  % limit term space (8Mb)
:- set_prolog_stack(local,  limit(2 000 000)).  % limit environment space

% Your program goes here

listaNelem(_, 0, []).
listaNelem(L, N, [HM|TM]) :- N > 0, M is N-1, member(HM, L), listaNelem(L, M, TM).

listeNelem(L,N,LL) :- bagof(M, listaNelem(L,N,M), LL).

connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).

connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

path(X, X, [X]).
path(X, Y, [X|L]) :- connected(X, Z), path(Z, Y, L).

/** <examples> Your example queries go here, e.g.
?- member(X, [cat, mouse]).
*/
