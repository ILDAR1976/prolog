%It's example for construction if (X < 3) M = 5 esle M = 2
aa(X,M):-X<3,M is 5,!.
aa(X,M):-M is 2.

%An example of the stopping conditions for recursion, variant 1 
bb([_,_]):-!.
bb([H|T]):-write([H|T]),bb(T).

%An example of the stopping conditions for recursion, variant 2
cc([_]):-!.
cc([H|T]):-write([H|T]),cc(T).

%An example of the stopping conditions for recursion, variant 2
dd([]):-!.
dd([H|T]):-write([H|T]),dd(T).
