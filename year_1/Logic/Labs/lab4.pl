remove_duplicates([], []).
remove_duplicates([H|T], U):- remove_duplicates(T, U), member(H, U).
remove_duplicates([H|T], [H|U]) :- remove_duplicates(T, U), not(member(H, U)).