%% ======================================================================
%%  PROLOG LAB PROGRAMS  (Q27 - Q39)   -- tested style: SWI-Prolog
%%  Predicate names are unique per program, so the whole file loads
%%  together:   ?- [prolog_programs].
%%  Sample queries are given in comments under each program.
%% ======================================================================

:- dynamic known/1, med_yes/1, med_no/1.
:- discontiguous female/1, male/1.


%% ----------------------------------------------------------------------
%% Q27. DB with NAME, DOB
%% ----------------------------------------------------------------------
db_person(ravi,   dob(12, 5, 2001)).
db_person(anita,  dob(3, 11, 2000)).
db_person(kumar,  dob(25, 1, 2002)).
db_person(meena,  dob(12, 5, 1999)).

born_in_year(Name, Year) :- db_person(Name, dob(_, _, Year)).
same_dob(N1, N2) :- db_person(N1, D), db_person(N2, D), N1 \= N2.
show_dob(Name) :- db_person(Name, dob(D, M, Y)),
                  format('~w was born on ~w-~w-~w~n', [Name, D, M, Y]).

% ?- db_person(ravi, DOB).
% ?- born_in_year(N, 2000).
% ?- same_dob(A, B).
% ?- show_dob(anita).


%% ----------------------------------------------------------------------
%% Q28. STUDENT - TEACHER - SUB - CODE
%% ----------------------------------------------------------------------
stu(s1, ravi).      stu(s2, anita).    stu(s3, kumar).
tch(t1, sharma).    tch(t2, iyer).     tch(t3, khan).
subj(cs101, 'Programming').
subj(cs102, 'Data Structures').
subj(cs103, 'Artificial Intelligence').

teaches(sharma, cs101).
teaches(iyer,   cs102).
teaches(khan,   cs103).

studies(ravi,  cs101).
studies(ravi,  cs103).
studies(anita, cs102).
studies(kumar, cs101).
studies(kumar, cs102).

student_teacher(S, T)  :- studies(S, Code), teaches(T, Code).
subject_of_student(S, SubName) :- studies(S, Code), subj(Code, SubName).
teacher_subject(T, SubName)    :- teaches(T, Code), subj(Code, SubName).
code_of(SubName, Code)         :- subj(Code, SubName).

% ?- student_teacher(ravi, T).
% ?- subject_of_student(kumar, S).
% ?- teacher_subject(iyer, S).
% ?- code_of('Programming', C).


%% ----------------------------------------------------------------------
%% Q29. PLANETS DB      planet(Name, Order_from_Sun, Diameter_km, Moons)
%% ----------------------------------------------------------------------
planet(mercury, 1,   4879,  0).
planet(venus,   2,  12104,  0).
planet(earth,   3,  12756,  1).
planet(mars,    4,   6792,  2).
planet(jupiter, 5, 142984, 95).
planet(saturn,  6, 120536, 146).
planet(uranus,  7,  51118, 28).
planet(neptune, 8,  49528, 16).

bigger_than(P1, P2) :- planet(P1, _, D1, _), planet(P2, _, D2, _), D1 > D2.
has_moons(P)        :- planet(P, _, _, M), M > 0.
nth_planet(N, P)    :- planet(P, N, _, _).
inner(P)            :- planet(P, N, _, _), N =< 4.

% ?- planet(earth, Order, Dia, Moons).
% ?- nth_planet(5, P).
% ?- bigger_than(jupiter, earth).
% ?- has_moons(P).


%% ----------------------------------------------------------------------
%% Q30. TOWERS OF HANOI
%% ----------------------------------------------------------------------
hanoi(N) :- hanoi(N, left, right, center).

hanoi(0, _, _, _) :- !.
hanoi(N, From, To, Via) :-
    N > 0,
    M is N - 1,
    hanoi(M, From, Via, To),
    format('Move disk ~w from ~w to ~w~n', [N, From, To]),
    hanoi(M, Via, To, From).

% ?- hanoi(3).


%% ----------------------------------------------------------------------
%% Q31. BIRD CAN FLY OR NOT
%% ----------------------------------------------------------------------
bird(sparrow).   bird(eagle).    bird(crow).
bird(penguin).   bird(ostrich).  bird(emu).   bird(kiwi).

flightless(penguin).  flightless(ostrich).  flightless(emu).  flightless(kiwi).

can_fly(X) :- bird(X), \+ flightless(X).

check_bird(X) :- can_fly(X), !, format('~w can fly.~n', [X]).
check_bird(X) :- bird(X), !,   format('~w cannot fly.~n', [X]).
check_bird(X) :- format('~w is not a bird in the database.~n', [X]).

% ?- can_fly(eagle).        % true
% ?- can_fly(penguin).      % false
% ?- check_bird(ostrich).
% ?- can_fly(X).            % lists all flying birds
% ?- bird(X), \+ can_fly(X).


%% ----------------------------------------------------------------------
%% Q32. FAMILY TREE
%% Pam, Liz, Ann, Pat are female; Tom, Bob, Jim are male
%% ----------------------------------------------------------------------
female(pam).  female(liz).  female(ann).  female(pat).
male(tom).    male(bob).    male(jim).

% parent(Parent, Child)
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

mother(M, C)       :- parent(M, C), female(M).
father(F, C)       :- parent(F, C), male(F).
grandfather(G, C)  :- parent(G, P), parent(P, C), male(G).
grandmother(G, C)  :- parent(G, P), parent(P, C), female(G).
sister(S, X)       :- parent(P, S), parent(P, X), female(S), S \= X.
brother(B, X)      :- parent(P, B), parent(P, X), male(B),   B \= X.

% ?- mother(M, bob).          % M = pam
% ?- father(tom, X).          % X = bob ; X = liz
% ?- grandfather(tom, ann).   % true
% ?- grandmother(G, jim).     % false  (jim's grandfather is bob, not a woman)
% ?- grandmother(pam, ann).   % true
% ?- sister(liz, bob).        % true
% ?- sister(ann, X).          % X = pat
% ?- brother(bob, liz).       % true


%% ----------------------------------------------------------------------
%% Q33. DIETING SYSTEM BASED ON DISEASE
%% ----------------------------------------------------------------------
diet_for(diabetes,
    [eat('whole grains, vegetables, legumes'),
     avoid('sugar, sweets, white bread'),
     tip('small frequent meals, monitor carbs')]).
diet_for(hypertension,
    [eat('fruits, vegetables, low-fat dairy, oats'),
     avoid('salt, pickles, processed food'),
     tip('limit sodium below 2g/day')]).
diet_for(obesity,
    [eat('salads, high-fibre food, lean protein'),
     avoid('fried food, soft drinks, junk food'),
     tip('calorie deficit with regular exercise')]).
diet_for(anemia,
    [eat('spinach, beetroot, dates, jaggery, meat, citrus fruits'),
     avoid('tea/coffee along with meals'),
     tip('vitamin C helps iron absorption')]).
diet_for(heart_disease,
    [eat('oats, nuts, fish, olive oil, fruits'),
     avoid('saturated fat, red meat, butter'),
     tip('low cholesterol diet')]).

suggest_diet(Disease) :-
    diet_for(Disease, Advice), !,
    format('Diet plan for ~w:~n', [Disease]),
    forall(member(A, Advice),
           ( A =.. [Type, Text], format('  ~w: ~w~n', [Type, Text]) )).
suggest_diet(Disease) :-
    format('No diet information available for ~w.~n', [Disease]).

% ?- suggest_diet(diabetes).
% ?- suggest_diet(anemia).


%% ----------------------------------------------------------------------
%% Q34. MONKEY BANANA PROBLEM
%% state(MonkeyPos, MonkeyOn(onfloor/onbox), BoxPos, HasBanana)
%% Banana hangs from the ceiling in the middle of the room.
%% ----------------------------------------------------------------------
loc(atdoor).  loc(atwindow).  loc(middle).

mb_move(state(middle, onbox, middle, hasnot), grasp,
        state(middle, onbox, middle, has)).
mb_move(state(P, onfloor, P, H), climb,
        state(P, onbox, P, H)).
mb_move(state(P1, onfloor, P1, H), push(P1, P2),
        state(P2, onfloor, P2, H)) :- loc(P2), P1 \= P2.
mb_move(state(P1, onfloor, B, H), walk(P1, P2),
        state(P2, onfloor, B, H)) :- loc(P2), P1 \= P2.

mb_solve(state(_, _, _, has), _, []).
mb_solve(S, Visited, [M|Ms]) :-
    mb_move(S, M, S2),
    \+ member(S2, Visited),
    mb_solve(S2, [S2|Visited], Ms).

monkey :-
    Start = state(atdoor, onfloor, atwindow, hasnot),
    mb_solve(Start, [Start], Plan),
    write('Plan to get the banana:'), nl,
    forall(member(M, Plan), (write('  '), write(M), nl)).

% ?- monkey.
% ?- mb_solve(state(atdoor, onfloor, atwindow, hasnot),
%             [state(atdoor, onfloor, atwindow, hasnot)], Plan).


%% ----------------------------------------------------------------------
%% Q35. FRUIT AND ITS COLOR USING BACKTRACKING
%% ----------------------------------------------------------------------
fruit_color(apple,       red).
fruit_color(banana,      yellow).
fruit_color(grapes,      green).
fruit_color(orange,      orange).
fruit_color(strawberry,  red).
fruit_color(mango,       yellow).
fruit_color(lemon,       yellow).
fruit_color(cherry,      red).

% Backtracking is forced by 'fail': Prolog tries every matching fact.
fruits_of_color(Color) :-
    fruit_color(Fruit, Color),
    format('~w is ~w~n', [Fruit, Color]),
    fail.
fruits_of_color(_).

all_fruits :-
    fruit_color(F, C),
    format('~w -> ~w~n', [F, C]),
    fail.
all_fruits.

% ?- fruits_of_color(red).
% ?- all_fruits.
% ?- fruit_color(F, yellow).     % press ; to backtrack for more answers


%% ----------------------------------------------------------------------
%% Q36. BEST FIRST SEARCH
%% Graph with heuristic h(Node, EstimatedCostToGoal). Goal = g
%% ----------------------------------------------------------------------
bf_edge(s, a).  bf_edge(s, b).
bf_edge(a, c).  bf_edge(a, d).
bf_edge(b, e).  bf_edge(b, f).
bf_edge(e, g).  bf_edge(f, g).

bf_h(s, 10).  bf_h(a, 7).  bf_h(b, 5).  bf_h(c, 9).
bf_h(d, 6).   bf_h(e, 2).  bf_h(f, 3).  bf_h(g, 0).

best_first(Start, Goal, Path) :-
    bf_h(Start, H),
    bf([H-[Start]], Goal, RevPath),
    reverse(RevPath, Path).

bf([_-[Goal|Rest]|_], Goal, [Goal|Rest]) :- !.
bf([_-[Node|Rest]|Open], Goal, Path) :-
    findall(H-[Child, Node|Rest],
            ( bf_edge(Node, Child),
              \+ member(Child, [Node|Rest]),
              bf_h(Child, H) ),
            Children),
    append(Children, Open, NewOpen),
    keysort(NewOpen, Sorted),          % lowest heuristic first
    bf(Sorted, Goal, Path).

% ?- best_first(s, g, Path).      % Path = [s, b, e, g]


%% ----------------------------------------------------------------------
%% Q37. MEDICAL DIAGNOSIS  (interactive expert system)
%% Answer with  yes.  or  no.   (with the full stop)
%% ----------------------------------------------------------------------
med_disease(flu,      [fever, cough, body_pain, headache]).
med_disease(cold,     [sneezing, runny_nose, sore_throat]).
med_disease(malaria,  [fever, chills, sweating, headache]).
med_disease(typhoid,  [fever, stomach_pain, weakness, loss_of_appetite]).
med_disease(measles,  [fever, skin_rash, red_eyes, cough]).

med_ask(S) :- med_yes(S), !.
med_ask(S) :- med_no(S), !, fail.
med_ask(S) :-
    format('Does the patient have ~w? (yes/no): ', [S]),
    read(Answer),
    (   Answer == yes -> assert(med_yes(S))
    ;   assert(med_no(S)), fail
    ).

med_clear :- retractall(med_yes(_)), retractall(med_no(_)).

diagnose :-
    med_clear,
    (   med_disease(D, Symptoms),
        forall(member(S, Symptoms), med_ask(S))
    ->  format('~nDiagnosis: the patient probably has ~w.~n', [D])
    ;   format('~nNo matching disease found. Please consult a doctor.~n')
    ),
    med_clear.

% ?- diagnose.


%% ----------------------------------------------------------------------
%% Q38. FORWARD CHAINING  (data-driven: facts -> new facts)
%% ----------------------------------------------------------------------
fc_fact(has_feathers).
fc_fact(lays_eggs).
fc_fact(has_wings).
fc_fact(can_swim).

% fc_rule(Conclusion, [Conditions])
fc_rule(bird,            [has_feathers, lays_eggs]).
fc_rule(can_fly,         [bird, has_wings, light_weight]).
fc_rule(water_bird,      [bird, can_swim]).
fc_rule(needs_pond,      [water_bird]).

fc_holds(F) :- fc_fact(F).
fc_holds(F) :- known(F).

forward :-
    fc_rule(Concl, Conds),
    \+ fc_holds(Concl),
    forall(member(C, Conds), fc_holds(C)),
    assert(known(Concl)),
    format('Derived new fact: ~w  (from ~w)~n', [Concl, Conds]),
    !, forward.
forward.

run_forward :-
    retractall(known(_)),
    forward,
    nl, write('All derived facts: '),
    findall(F, known(F), L), write(L), nl.

% ?- run_forward.
% ?- run_forward, known(water_bird).


%% ----------------------------------------------------------------------
%% Q39. BACKWARD CHAINING  (goal-driven: goal -> sub-goals -> facts)
%% ----------------------------------------------------------------------
bc_fact(has_feathers).
bc_fact(lays_eggs).
bc_fact(has_wings).
bc_fact(can_swim).

bc_rule(bird,       [has_feathers, lays_eggs]).
bc_rule(can_fly,    [bird, has_wings, light_weight]).
bc_rule(water_bird, [bird, can_swim]).
bc_rule(needs_pond, [water_bird]).

prove(Goal) :- prove(Goal, 0).

prove(Goal, D) :-
    bc_fact(Goal),
    indent(D), format('~w is a known FACT~n', [Goal]).
prove(Goal, D) :-
    bc_rule(Goal, Conds),
    indent(D), format('To prove ~w, need ~w~n', [Goal, Conds]),
    D1 is D + 1,
    prove_all(Conds, D1),
    indent(D), format('=> ~w proved~n', [Goal]).

prove_all([], _).
prove_all([G|Gs], D) :- prove(G, D), prove_all(Gs, D).

indent(D) :- N is D * 3, forall(between(1, N, _), write(' ')).

% ?- prove(needs_pond).     % succeeds, prints the reasoning chain
% ?- prove(can_fly).        % fails: light_weight is neither a fact nor derivable

%% ======================================================================
%%  END
%% ======================================================================
