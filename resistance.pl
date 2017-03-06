resistance(seq(X,Y),R) :- 
	resistance(X,RX), resistance(Y,RY), R is RX + RY. 
resistance(par(X,Y),R) :- 
	resistance(X,RX), resistance(Y,RY), R is RX*RY/(RX + RY).
resistance(R,R).

