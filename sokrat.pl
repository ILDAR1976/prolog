% Сократ - человек
human(sokrat).
% Платон - тоже человек
human(platon).

% Чтобы некто был смертным, он должен быть человеком
mortal(Someone) :- human(Someone).