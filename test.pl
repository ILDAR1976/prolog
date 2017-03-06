test([H|T],[H|R]) :-
  write(H), nl,
  write(T), nl,
  write(R), nl.

test2([A|T],[B|R]) :-
  write(A), nl,
  write(T), nl,
  write(B), nl,
  write(R), nl.

test3(H,R):-
  write(H), nl,
  write(R), nl.

test4([A,B,C]) :-
  write(A), nl,
  write(B), nl,
  write(C), nl.  

test5(A,B,A) :-
  write(A), nl,
  write(B), nl.  
