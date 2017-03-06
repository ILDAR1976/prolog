length([], 0). 
length([X|L], N):-length(L, M), N is M+1.