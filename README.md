# Peg Game

This is a cute little game one can play with golf tees and a block of wood with a triangular grid of holes.
There will have to be a triangular number of holes (1, 3, 6, 10, 15, 21, ...) for the holes to line up as a triangle. See https://oeis.org/A000217 for more details.

This implementation creates a plan to win the peg game when there are 15 holes.

## Rules of the Game

* Let the number of holes be t(n), for some integer n.
* The starting position has t(n)-1 holes filled, and 1 of the corner holes empty.
* The winning position is any state which has t(n)-1 holes empty, and 1 hole filled.
* The only move which can be made is to take a golf tee and jump over top of another one, landing in the hole 2 spaces away. By doing so, the tee which was jumped over is taken out of the board.

## Implementation Details

The state atoms are internally organized in the following way:
```
  state([[A],[B,C],[D,E,F],[G,H,I,J],[K,L,M,N,O]])
```
which looks like

![Internal/External PegGame Mapping](/graph.png?raw=true)

## Acknowledgments

* Thanks to Cracker Barrel for making me feel like this was a simple problem. It is!
