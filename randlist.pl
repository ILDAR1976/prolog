randList(Size, _List):-
  Size < 0, !, fail.
randList(0, []):-!.
randList(Size, [Head|Tail]):-
  NextSize is Size - 1, random(Head), !,
  randList(NextSize, Tail).