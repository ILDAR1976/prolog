go:-primes(10,L),!.

primes(N,L) :- integers(2,N,IL),filter(IL,2,L),write(L),nl.

filter([],_,[]).
filter([H|T],K,R) :- 0 is (H mod K), !, filter(T,K,R).
filter([H|T],K,[H|R]) :- filter(T,K,R).

integers(First, 0, []):-!.
integers(First, Size, [Head|Tail]):-
  OutFirst is First + 1,
  Head is First,
  NextSize is Size - 1,
  !,
  integers(OutFirst, NextSize, Tail). 

