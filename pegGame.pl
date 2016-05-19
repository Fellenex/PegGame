%______________________________________________________________________________________ GENERAL PLANNER
plan(L,Cost) :- initial_state(I), goal_state(G), reachable(I,L,G).

reachable(S,[],S).
%Question 3a) can go here
reachable(S1,[M|L],S3) :- legal_move(S1,M,S2), reachable(S2,L,S3). %Question 3b) goes in this line

shortPlan(L,Cost) :- tryPlan([],L,Cost).

tryPlan(L,L,Cost) :- plan(L, Cost).
tryPlan(X,L,Cost) :- tryPlan([_|X],L,Cost).

initial_state([[0],[1,1],[1,1,1],[1,1,1,1],[1,1,1,1,1]]).



goal_state([[1],[0,0],[0,0,0],[0,0,0,0],[0,0,0,0,0]]).
goal_state([[0],[1,0],[0,0,0],[0,0,0,0],[0,0,0,0,0]]).
goal_state([[0],[0,1],[0,0,0],[0,0,0,0],[0,0,0,0,0]]).
goal_state([[0],[0,0],[1,0,0],[0,0,0,0],[0,0,0,0,0]]).
goal_state([[0],[0,0],[0,1,0],[0,0,0,0],[0,0,0,0,0]]).
goal_state([[0],[0,0],[0,0,1],[0,0,0,0],[0,0,0,0,0]]).
goal_state([[0],[0,0],[0,0,0],[1,0,0,0],[0,0,0,0,0]]).
goal_state([[0],[0,0],[0,0,0],[0,1,0,0],[0,0,0,0,0]]).
goal_state([[0],[0,0],[0,0,0],[0,0,1,0],[0,0,0,0,0]]).
goal_state([[0],[0,0],[0,0,0],[0,0,0,1],[0,0,0,0,0]]).
goal_state([[0],[0,0],[0,0,0],[0,0,0,0],[1,0,0,0,0]]).
goal_state([[0],[0,0],[0,0,0],[0,0,0,0],[0,1,0,0,0]]).
goal_state([[0],[0,0],[0,0,0],[0,0,0,0],[0,0,1,0,0]]).
goal_state([[0],[0,0],[0,0,0],[0,0,0,0],[0,0,0,1,0]]).
goal_state([[0],[0,0],[0,0,0],[0,0,0,0],[0,0,0,0,1]]).

%______________________________________________________________________________________ Moves

legal_move([[0],[1,A],[1,B,C],D,E],leftOne, [[1],[0,A],[0,B,C],D,E]).
legal_move([[0],[A,1],[B,C,1],D,E],rightOne, [[1],[A,0],[B,C,0],D,E]).


legal_move([Z,[0,A],[1,B,C],[1,D,E,F],G],leftTwoOne, [Z,[1,A],[0,B,C],[0,D,E,F],G]).
legal_move([Z,[0,A],[B,1,C],[D,E,1,F],G],rightTwoOne, [Z,[1,A],[B,0,C],[D,E,0,F],G]).
legal_move([Z,[A,0],[B,C,1],[D,E,F,1],G],leftTwoTwo, [Z,[A,1],[1,B,C],[D,E,F,1],G]).
legal_move([Z,[A,0],[B,1,C],[D,1,E,F],G],rightTwoTwo, [Z,[A,1],[B,0,C],[D,1,E,F],G]).


legal_move([[1],[1,A],[0,B,C],D,E], topThreeOne, [[0],[0,A],[1,B,C],D,E]).
legal_move([A,B,[0,1,1],C,D], rightThreeOne, [A,B,[1,0,0],C,D]).
legal_move([A,B,[0,C,D],[1,E,F,G],[1,H,I,J,K]], leftThreeOne, [A,B,[1,C,D],[0,E,F,G],[0,H,I,J,K]]).
legal_move([A,B,[0,C,D],[E,1,F,G],[H,I,1,J,K]], downRightThreeOne, [A,B,[1,C,D],[E,0,F,G],[H,I,0,J,K]]).

legal_move([A,B,[C,0,D],[E,1,F,G],[H,1,I,J,K]], leftThreeTwo, [A,B,[C,1,D],[E,0,F,G],[H,0,I,J,K]]).
legal_move([A,B,[C,0,D],[E,F,1,G],[H,I,J,1,K]], leftThreeTwo, [A,B,[C,1,D],[E,F,0,G],[H,I,J,0,K]]).

legal_move([[1],[A,1],[B,C,0],D,E], topThreeThree, [[0],[A,0],[B,C,1],D,E]).
legal_move([A,B,[1,1,0],C,D], leftThreeThree, [A,B,[0,0,1],C,D]).
legal_move([A,B,[C,D,0],[E,F,1,G],[H,I,1,J,K]], downLeftThreeThree, [A,B,[C,D,1],[E,F,0,G],[H,I,0,J,K]]).
legal_move([A,B,[C,D,0],[E,F,G,1],[H,I,J,K,1]], rightThreeThree, [A,B,[C,D,1],[E,F,G,0],[H,I,J,K,0]]).

legal_move([A,[1,B],[1,C,D],[0,E,F,G],H], topFourOne, [A,[0,B],[0,C,D],[1,E,F,G],H]).
legal_move([A,B,C,[0,1,1,D],E], rightFourOne, [A,B,C,[1,0,0,D],E]).

legal_move([A,[B,1],[C,1,D],[E,0,F,G],H], topFourTwo, [A,[B,0],[C,0,D],[E,1,F,G],H]).
legal_move([A,B,C,[D,0,1,1],E], rightFourTwo, [A,B,C,[D,1,0,0],E]).

legal_move([A,[1,B],[C,1,D],[E,F,0,G],H], topFourThree, [A,[0,B],[C,0,D],[E,F,1,G],H]).
legal_move([A,B,C,[1,1,0,D],E], leftFourThree, [A,B,C,[0,0,1,D],E]).

legal_move([A,[B,1],[C,D,1],[E,F,G,0],H], topFourFour, [A,[B,0],[C,D,0],[E,F,G,1],H]).
legal_move([A,B,C,[D,1,1,0],E], leftFourFour, [A,B,C,[D,0,0,1],E]).


legal_move([A,B,[1,C,D],[1,E,F,G],[0,H,I,J,K]], topFiveOne, [A,B,[0,C,D],[0,E,F,G],[1,H,I,J,K]]).
legal_move([A,B,C,D,[0,1,1,E,F]], rightFiveOne, [A,B,C,D,[1,0,0,E,F]]).

legal_move([A,B,[C,1,D],[E,1,F,G],[H,0,I,J,K]], topFiveTwo, [A,B,[C,0,D],[E,0,F,G],[H,1,I,J,K]]).
legal_move([A,B,C,D,[E,0,1,1,F]], topFiveTwo, [A,B,C,D,[E,1,0,0,F]]).

legal_move([A,B,[1,C,D],[E,1,F,G],[H,I,0,J,K]], topLeftFiveThree, [A,B,[0,C,D],[E,0,F,G],[H,I,1,J,K]]).
legal_move([A,B,[C,D,1],[E,F,1,G],[H,I,0,J,K]], topRightFiveThree, [A,B,[C,D,0],[E,F,0,G],[H,I,1,J,K]]).
legal_move([A,B,C,D,[1,1,0,E,F]], leftFiveThree, [A,B,C,D,[0,0,1,E,F]]).
legal_move([A,B,C,D,[E,F,0,1,1]], rightFiveThree, [A,B,C,D,[E,F,1,0,0]]).

legal_move([A,B,[C,1,D],[E,F,1,G],[H,I,J,0,K]], topFiveFour, [A,B,[C,0,D],[E,F,0,G],[H,I,J,1,K]]).
legal_move([A,B,C,D,[E,1,1,0,F]], leftFiveFour, [A,B,C,D,[E,0,0,1,F]]).

legal_move([A,B,[C,D,1],[E,F,G,1],[H,I,J,K,0]], topFiveFive, [A,B,[C,D,0],[E,F,G,0],[H,I,J,K,1]]).
legal_move([A,B,C,D,[E,F,1,1,0]], leftFiveFive, [A,B,C,D,[E,F,0,0,1]]).
