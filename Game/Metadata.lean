import GameServer
import Lean

-- import Mathlib.Tactic.Common

macro "assume" args:(colGt ident)* : tactic =>
  `(tactic| intro $args*)
macro "show_imp" args:(colGt ident)* : tactic =>
  `(tactic| intro $args*)

syntax "show_and" term "," term : tactic
syntax "use_and_L" term : tactic
syntax "use_and_R" term : tactic
syntax "use_imp" term "," term : tactic
macro_rules
  | `(tactic| show_and $p, $q) => `(tactic|exact And.intro $p $q)
  | `(tactic| use_and_L $pq) => `(tactic|exact And.left $pq)
  | `(tactic| use_and_R $pq) => `(tactic|exact And.right $pq)
  | `(tactic| use_imp $p, $q) => `(tactic|exact $p $q)

/-! Use this file to add things that should be available in all levels.


For example, this demo imports the mathlib tactics

*Note*: As long as `Game.lean` exists and ends with the `MakeGame` command,
you are completely free how you structure your lean project, this is merely
a suggestion.

*Bug*: However, things are bugged out if the levels of different worlds are imported
in a random order. Therefore, you should keep the structure of one file Lean file per world
which imports all its levels.
-/
