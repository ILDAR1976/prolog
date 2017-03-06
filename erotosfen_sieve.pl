go:-primes(5,L),!.

primes(N,L) :- integers(2,N,IL),filter(IL,L),write(L),nl.

filter([],[]).
filter([I|L],[I|R]) :- 
	process(I,[I|L],T),filter(T,R).

process(_,[],[]).
process(P,[I|T],R) :- 
	0 is I mod P, !, 	process(P,T,R).
process(P,[I|T],[I|R]) :- process(P,T,R).

integers(First, 1, []):-!.
integers(First, Size, [Head|Tail]):-
  OutFirst is First + 1,
  Head is First,
  NextSize is Size - 1,
  !,
  integers(OutFirst, NextSize, Tail). 
