integers(First, 0, []):-!.
integers(First, Size, [Head|Tail]):-
  OutFirst is First + 1,
  Head is First,
  NextSize is Size - 1,
  !,
  integers(OutFirst, NextSize, Tail). 
