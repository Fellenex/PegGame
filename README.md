# Peg Game

This is a cute little game that one can play with golf tees and a block of wood with a triangular grid of holes.
There will have to be a triangular number of holes (1, 3, 6, 10, 15, 21, ...) for the holes to line up as a triangle. See https://oeis.org/A000217 for more details.

This implementation creates a plan to win the peg game when there are 15 holes

## Rules of the Game

* There are 15 holes, arranged in a triangle.
* The starting position has 14 holes filled, with one corner hole empty
* The player then takes a golf tee and jumps over top of another one, landing in the empty hole beside the jumpee. The jumpee tee is then removed from the board.


## Implementation Details

The state atoms are internally organized in the following way:
```
  state([[A],[B,C],[D,E,F],[G,H,I,J],[K,L,M,N,O]])
```
which looks like

![Internal/External PegGame Mapping](/graph.png?raw=true)
