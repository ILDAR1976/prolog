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
% Англичанен живет в красном доме
member(english:H1, N), member(red:H1,C),

write('2'),nl,

%У испанца есть собака
member(spanish:H2, N), member(dog:H2,P),
write('3'),nl,

%Японец является художником
member(japanese:H11, N),member(painter:H11, S),

write('4'),nl,

%Итальянец пьет чай
member(italian:H10, N),member(tea:H10, D),

write('5'),nl,

%Норвежец живет в первом доме слева
member(norwegian:1, N),

write('6'),nl,

%Владелец зеленого дома пьет кофе
member(coffee:H14, D),member(green:H14, C),

write('7'),nl,

%Зеленый дом находится справа от белого
member(green:H15,C),left(H16, H15),member(white:H16,C),

write('8'),nl,

%Скульптор разводит улиток
member(sculptor:H8, S),member(snails:H8, P),

write('9'),nl,

%Дипломат живет в желтом доме
member(diplomat:H3, S),member(yellow:H3, C),

write('10'),nl,

%В доме по середине пьют молоко
member(milk:3, D),

write('11'),nl,

%Норвежец живет рядом с голубым домом
member(norwegian:H6,N),next(H6, H7),member(blue:H7,C),

write('12'),nl,

%Скрипач пьет фруктовые соки
member(musician:H9, S),member(orange_juice:H9, D),

write('13'),nl,

%Лису держат в доме, соседнем с домом врача
member(doctor:H4, S), next(H4, H5),member(fox:H5, P),

write('14'),nl,

%Лошадь держат по соседству с домом дипломата
member(diplom:H12,S),next(H12, H13),member(horse:H13,P),

write('15'),nl,

%Кто-то держит зебру и кто-то пьет воду
member(zebra:_, P), member(water:_, D),

write('17'),nl.



next(X,Y) :- left(X,Y).
next(X,Y) :- left(Y,X).

left(1,2). 
left(2,3). 
left(3,4). 
left(4,5).