go:-solve(L),!.
solve(S):- 
  %The street (S) is ... 
  S = [h(norwegian,_,_,_,_),h(_,_,blue,_,_),h(_,_,_,_,milk),_,_], 
	member(h(english,_,red,_,_),S), 
	member(h(spanish,_,_,dog,_),S), 
	member(h(japanese,painter,_,_,_),S), 
	member(h(italian,_,_,_,tea),S), 
	member(h(_,_,green,_,coffee),S), 
	next(h(_,_,white,_,_),h(_,_,green,_,_),S), 
	member(h(_,sculptor,_,snails,_),S), 
	member(h(_,diplomat,yellow,_,_),S), 
	member(h(_,musician,_,_,juice),S), 
	neighbour(h(_,_,_,fox,_),h(_,doctor,_,_,_),S), 
	neighbour(h(_,_,_,horse,_),h(_,diplomat,_,_,_),S), 
	member(h(OwnerZ,_,_,zebra,_),S), 
	member(h(OwnerW,_,_,_,water),S),
  print('Owner of the zebra: '), print(OwnerZ), nl,
  print('Water drink: '), print(OwnerW), nl.

neighbour(X1,X2,L):- next(X1,X2,L); next(X2,X1,L).

%member(X, [X|_]).
%member(X, [_|Rest]) :- member(X, Rest).

next(L, R, [L,R|_]).
next(L, R, [_|Rest]) :- next(L, R, Rest).