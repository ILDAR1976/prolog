go:-solve([Colours,Drinks,Nationalities,Professions,Pets]),!. 

solve([Colours,Drinks,Nationalities,Professions,Pets]) :- 
	generate([Colours,Drinks,Nationalities,Professions,Pets]),
	test(Colours,Drinks,Nationalities,Professions,Pets).

generate([L1, L2, L3, L4, L5]) :-
  perm(L1,[red,yellow,blue,green,white]),
  perm(L2,[juice,tea,coffee,milk,water]),
  perm(L3,[english,spanish,japanese,norwegian,italian]),
  perm(L4,[diplomat,sculptor,painter,musician,doctor]),
  perm(L5,[dog,fox,snails,horse,zebra]).

perm([U:A,V:B,X:C,Y:D,Z:E],L) :-
  permute([A,B,C,D,E], [1,2,3,4,5]), [U,V,X,Y,Z] = L.
  
permute([],[]).
  permute(L,[X|T]):- remove(X,L,R),permute(R,T).

remove(X,[X|T],T).
remove(X,[H|T],[H|R]):- remove(X,T,R).

test(C, D, N, S, P):-

write('1'),nl,
% ���������� ����� � ������� ����
member(english:H1, N), member(red:H1,C),

write('2'),nl,

%� ������� ���� ������
member(spanish:H2, N), member(dog:H2,P),
write('3'),nl,

%������ �������� ����������
member(japanese:H11, N),member(painter:H11, S),

write('4'),nl,

%��������� ���� ���
member(italian:H10, N),member(tea:H10, D),

write('5'),nl,

%�������� ����� � ������ ���� �����
member(norwegian:1, N),

write('6'),nl,

%�������� �������� ���� ���� ����
member(coffee:H14, D),member(green:H14, C),

write('7'),nl,

%������� ��� ��������� ������ �� ������
member(green:H15,C),left(H16, H15),member(white:H16,C),

write('8'),nl,

%��������� �������� ������
member(sculptor:H8, S),member(snails:H8, P),

write('9'),nl,

%�������� ����� � ������ ����
member(diplomat:H3, S),member(yellow:H3, C),

write('10'),nl,

%� ���� �� �������� ���� ������
member(milk:3, D),

write('11'),nl,

%�������� ����� ����� � ������� �����
member(norwegian:H6,N),next(H6, H7),member(blue:H7,C),

write('12'),nl,

%������� ���� ��������� ����
member(musician:H9, S),member(orange_juice:H9, D),

write('13'),nl,

%���� ������ � ����, �������� � ����� �����
member(doctor:H4, S), next(H4, H5),member(fox:H5, P),

write('14'),nl,

%������ ������ �� ��������� � ����� ���������
member(diplom:H12,S),next(H12, H13),member(horse:H13,P),

write('15'),nl,

%���-�� ������ ����� � ���-�� ���� ����
member(zebra:_, P), member(water:_, D),

write('17'),nl.



next(X,Y) :- left(X,Y).
next(X,Y) :- left(Y,X).

left(1,2). 
left(2,3). 
left(3,4). 
left(4,5).