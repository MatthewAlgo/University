% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).  % limit term space (8Mb)
:- set_prolog_stack(local,  limit(2 000 000)).  % limit environment space

% Your program goes here

listN([],0).
listN([a|T], N) :- N > 0, M is N - 1, listN(T,M).

rev([],[]).
rev([H|T],L) :- rev(T,N), append(N,[H],L).

reva(L,R) :- revah(L,[],R).
revah([], R, R).
revah([H|T], S, N) :- revah(T,[H|S],N).

revd(L,R) :- revdh(L,(R,[])).
revdh([],(R,R)).
revdh([H|T],(N,S)) :- revdh(T,(N,[H|S])).

flatten([H|T], [H|R]) :- not(is_list(H)), flatten(T, R).
flatten([H|T], R) :- is_list(H), flatten(H,M), flatten(T,N), append(M, N, R).
flatten([], []).

flattend(L, R) :- flattendh(L, (R, [])).
flattendh([], (R, R)).
flattendh([H|T], ([H|R], S)) :- not(is_list(H)), flattendh(T, (R, S)).
flattendh([H|T], (R, S)) :- is_list(H), flattendh(H, (R,X)), flattendh(T, (X,S)).

quicksort([],[]).
quicksort([H|T],L) :- split(H,T,A,B), quicksort(A,M),
quicksort(B,N), append(M,[H|N],L).
split(_,[],[],[]).
split(X,[H|T],[H|A],B) :- H < X, split(X,T,A,B).
split(X,[H|T],A,[H|B]) :- H >= X, split(X,T,A,B).

quicksortd(L, R) :- quicksortdh(L, (R, [])).
quicksortdh([], (R, R)).
quicksortdh([H|T], (R, S)) :- split(H, T, A, B), quicksortdh(A, (R, [H|X])), quicksortdh(B, (X, S)).

sent(R) :- np(A), vp(B), append(A,B,R).
np(R) :- dete(A), n(B), append(A,B,R).
vp(R) :- tv(A), np(B), append(A,B,R).
vp(R) :- v(R).
dete([the]). dete([a]). dete([every]). dete([no]).
n([matei]). n([rusu]). n([ruxi]). n([walker]).
tv([likes]). v([walks]). v([does]). v([worksatnxp]).

sentd(R) :- sentdh((R,[])).
sentdh((R,S)) :- npdh((R,Z)), vpdh((Z,S)).
npdh((R,S)) :- detedh((R,Z)), ndh((Z,S)).
vpdh((R,S)) :- tvdh((R,Z)), npdh((Z,S)).
vpdh((R,S)) :- vdh((R,S)).
detedh(([the|S],S)). detedh(([a|S],S)).
detedh(([every|S],S)).
ndh(([teacher|S],S)). ndh(([doctor|S],S)).
ndh(([park|S],S)).
tvdh(([likes|S],S)). vdh(([walks|S],S)).


sentgh --> np, vp.
np --> dete, n.
vp --> tv, np.
vp --> v.
dete --> [the]. dete --> [a]. dete --> [every].
n --> [teacher]. n --> [doctor]. n --> [park].
tv --> [likes]. v --> [walks].

/** <examples> Your example queries go here, e.g.
?- member(X, [cat, mouse]).
*/
