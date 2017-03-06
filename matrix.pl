solve(N,X) :-
  generate(N,X),
  test(X).

print_solve(N,X) :-
  solve(N,X),write(X),nl,fail.

test(X) :-
  sumeq(X),
  transpose(X,T),
  sumeq(T).

sumeq([_]).
sumeq([A,B|T]) :-
  sum(A,S),
  sum(B,S),
  sumeq([B|T]).

sum([],0).
sum([H|T],Sum):-
    sum(T,Sum1),
    Sum is H + Sum1.

taken(0,L,L,[]).
taken(N,[A|L1],L2,[A|T]) :- N1 is N-1, taken(N1,L1,L2,T).

chop(N,[],M,M).
chop(N,L,M,[R|T]) :- taken(N,L,L1,R), chop(N,L1,M,T).
chop(N,L,R) :- chop(N,L,[],R).

generate(N,Sq) :-
  NSq is N*N,
  integers(1,NSq,IntList),
  permute(IntList,L),
  chop(N,L,Sq).

slice([],[],[]).
slice([X|R],[A|T],[Y|Z]):-
 X = [A|Y],
 slice(R,T,Z).

transpose(M,[R|Rest]):-
 slice(M,R,Z), !,
 transpose(Z,Rest).
transpose(_,[]).

takeout(X,[X|R],R).  
takeout(X,[F |R],[F|S]) :- takeout(X,R,S).

permute([],[]).
permute([X|Y],Z) :- permute(Y,W), takeout(X,Z,W).  

integers(First, 0, []):-!.
integers(First, Size, [Head|Tail]):-
  OutFirst is First + 1,
  Head is First,
  NextSize is Size - 1,
  !,
  integers(OutFirst, NextSize, Tail). 
