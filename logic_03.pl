go:-solve([Colours,Drinks,Nationalities,Professions,Pets]),!.

solve([Colours,Drinks,Nationalities,Professions,Pets]) :- 
	generate([Colours,Drinks,Nationalities,Professions,Pets]),
	test(Colours,Drinks,Nationalities,Professions,Pets).

generate([]).
generate([L|T]) :- perm(L), generate(T).

perm([_:A,_:B,_:C,_:D,_:E]) :-
	permute([A,B,C,D,E], [1,2,3,4,5]).

permute([],[]).
	permute(L,[X|T]) :- remove(X,L,R),permute(R,T).

remove(X,[X|T],T).
remove(X,[H|T],[H|R]):- remove(X,T,R).


test(C, D, N, S, P) :-

% ���������� ����� � ������� ����
member(english:H1, N), member(red:H1,C),

%� ������� ���� ������
member(spanish:H2, N), member(dog:H2,P),

%������ �������� ����������
member(japanese:H11, N),member(painter:H11, S),

%��������� ���� ���
member(italian:H10, N),member(tea:H10, D),

%�������� ����� � ������ ���� �����
member(norwegian:1, N),

%�������� �������� ���� ���� ����
member(coffee:H14, D),member(green:H14, C),

%������� ��� ��������� ������ �� ������
member(green:H15,C),left(H16, H15),member(white:H16,C),

%��������� �������� ������
member(sculptor:H8, S),member(snails:H8, P),

%�������� ����� � ������ ����
member(diplomat:H3, S),member(yellow:H3, C),

%� ���� �� �������� ���� ������
member(milk:3, D),

%�������� ����� ����� � ������� �����
member(norwegian:H6,N),next(H6, H7),member(blue:H7,C),

%������� ���� ��������� ����
member(musician:H9, S),member(orange_juice:H9, D),

%���� ������ � ����, �������� � ����� �����
member(doctor:H4, S), next(H4, H5),member(fox:H5, P),

%������ ������ �� ��������� � ����� ���������
member(diplom:H12,S),next(H12, H13),member(horse:H13,P),

%���-�� ������ ����� � ���-�� ���� ����
member(zebra:_, P), member(water:_, D).

next(X,Y) :- left(X,Y).
next(X,Y) :- left(Y,X).

left(1,2). 
left(2,3). 
left(3,4). 
left(4,5).