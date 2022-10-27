% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).  % limit term space (8Mb)
:- set_prolog_stack(local,  limit(2 000 000)).  % limit environment space

% Your program goes here
rev([], []).
rev([H|T], M) :- rev(T, U), append(U, [H], M). % Il invartim pe T   
palindrome(L) :- rev(L, L).

remove_duplicates([], []).
remove_duplicates([H|T], U):- remove_duplicates(T, U), member(H, U).
remove_duplicates([H|T], [H|U]) :- remove_duplicates(T, U), not(member(H, U)).

appears_n(_, [], 0).
appears_n(C, [C|T], W) :- appears_n(C, T, Y), W is Y+1.
appears_n(C, [H|T], Y) :- appears_n(C, T, Y), C \== H.

insertsort([],[]).
insertsort([H|T],L) :- insertsort(T,L1), insert(L1,H,L).
insert([], C, [C]). 
insert([H|T], C, [C|[H|T]]) :- C < H.
insert([H|T], C, [H|L]) :- C >= H, insert(T, C, L).


% Qsrt
split(_, [], [], []).
% split(H, [I], [I], B) :- H < I.
% split(H, [I], A, [I]) :- H > I.
split(H, [X|T], [X|A], B) :- split(H, T, A, B), H < X.
split(H, [X|T], A, [X|B]) :- split(H, T, A, B), H >= X.
quicksort([],[]).
quicksort([H|T],L) :- split(H,T,A,B), quicksort(A,M), quicksort(B,N), append(M,[H|N],L).

% Arbori
srd(vid,[]).
srd(arb(R,T,U),L) :- srd(T,L1), srd(U,L2), append(L1,[R|L2],L).

bt_ins(X, vid, arb(X, vid, vid)).
bt_ins(X, arb(R, T, U), arb(R, V, U)) :- X < R, bt_ins(X, T, V).
bt_ins(X, arb(R, T, U), arb(R, T, V)) :- X >= R, bt_ins(X, U, V).

bt_list([], vid).
bt_list([H|T], V) :- bt_list(T, W), bt_ins(H, W, V).

bt_sort(L, X) :- bt_list(L, T), srd(T, X).


/** <examples> Your example queries go here, e.g.
?- member(X, [cat, mouse]).
*/
