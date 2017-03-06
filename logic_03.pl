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

% Англичанен живет в красном доме
member(english:H1, N), member(red:H1,C),

%У испанца есть собака
member(spanish:H2, N), member(dog:H2,P),

%Японец является художником
member(japanese:H11, N),member(painter:H11, S),

%Итальянец пьет чай
member(italian:H10, N),member(tea:H10, D),

%Норвежец живет в первом доме слева
member(norwegian:1, N),

%Владелец зеленого дома пьет кофе
member(coffee:H14, D),member(green:H14, C),

%Зеленый дом находится справа от белого
member(green:H15,C),left(H16, H15),member(white:H16,C),

%Скульптор разводит улиток
member(sculptor:H8, S),member(snails:H8, P),

%Дипломат живет в желтом доме
member(diplomat:H3, S),member(yellow:H3, C),

%В доме по середине пьют молоко
member(milk:3, D),

%Норвежец живет рядом с голубым домом
member(norwegian:H6,N),next(H6, H7),member(blue:H7,C),

%Скрипач пьет фруктовые соки
member(musician:H9, S),member(orange_juice:H9, D),

%Лису держат в доме, соседнем с домом врача
member(doctor:H4, S), next(H4, H5),member(fox:H5, P),

%Лошадь держат по соседству с домом дипломата
member(diplom:H12,S),next(H12, H13),member(horse:H13,P),

%Кто-то держит зебру и кто-то пьет воду
member(zebra:_, P), member(water:_, D).

next(X,Y) :- left(X,Y).
next(X,Y) :- left(Y,X).

left(1,2). 
left(2,3). 
left(3,4). 
left(4,5).