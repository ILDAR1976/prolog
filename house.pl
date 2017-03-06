door(a,b).
door(b,c).
door(b,d).
door(c,d).
door(d,e).
door(d,f).
door(f,g).
door(h,i).

move(X,Y) :-
  door(X,Y);
  door(Y,X).


path(X,Y,P):- bdth([[X]],Y,P).

bdth([[X|T]|_],X,[X|T]).
bdth([P|QI],X,R) :-
	findall(Z,prolong(P,Z),T),
	append(QI,T,QO),!,
	bdth(QO,X,R).
bdth([_|T],Y,L) :- bdth(T,Y,L).

not(P) :- P, !, fail.
not(_).