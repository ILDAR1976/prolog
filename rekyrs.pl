rekyrs(A1,2,S):-A1=4,S=5.
rekyrs(A1,1,A1):-A1=1.
rekyrs(A,N,S):-M=N-1,rekyrs(A1,M,S2),
              B=N-2,rekyrs(A2,B,_),A=3*A1-A2,
              S=S2+A.