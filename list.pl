list(First, 0, []):-!.
list(First, Size, [Head|Tail]):-
  OutFirst is First + 1,
  Head is First,
  NextSize is Size - 1,
  !,
  list(OutFirst, NextSize, Tail). 
