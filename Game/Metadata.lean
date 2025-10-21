import GameServer
import Lean

-- import Mathlib.Tactic.Common

macro "assume" args:(colGt ident)* : tactic =>
  `(tactic| intro $args*)
macro "show_imp" args:(colGt ident)* : tactic =>
  `(tactic| intro $args*)
-- macro "by_contra" arg:(colGt ident) : tactic =>
--   `(tactic| apply Classical.byContradiction; assume $arg)

-- syntax "assume" ident* : tactic
-- syntax "show_imp" ident* : tactic
syntax "by_contra" ident : tactic
syntax "show_and" term "," term : tactic
syntax "use_and_L" term : tactic
syntax "use_and_R" term : tactic
syntax "show_or_L" term : tactic
syntax "show_or_R" term : tactic
syntax "use_imp" term "," term : tactic
syntax "contradict" term "," term : tactic
syntax "use_or" Lean.Parser.Tactic.elimTarget "as" colGt ident "," colGt ident : tactic
macro_rules
  -- | `(tactic| assume $ps*)         => `(tactic|intro $ps*)
  -- | `(tactic| show_imp $ps*)       => `(tactic|intro $ps*)
  | `(tactic| by_contra $p)        => `(tactic| apply Classical.byContradiction; assume $p)
  | `(tactic| show_and $p, $q)     => `(tactic|exact And.intro $p $q)
  | `(tactic| use_and_L $pq)       => `(tactic|exact And.left $pq)
  | `(tactic| use_and_R $pq)       => `(tactic|exact And.right $pq)
  | `(tactic| use_imp $p, $q)      => `(tactic|exact $p $q)
  | `(tactic| contradict $p, $q)   => `(tactic|exact False.elim ($p $q))
  | `(tactic| show_or_L $p)        => `(tactic|exact Or.inl $p)
  | `(tactic| show_or_R $q)        => `(tactic|exact Or.inr $q)
  | `(tactic| use_or $h as $p, $q) => `(tactic |rcases $h with $p | $q)

/-! Use this file to add things that should be available in all levels.


For example, this demo imports the mathlib tactics

*Note*: As long as `Game.lean` exists and ends with the `MakeGame` command,
you are completely free how you structure your lean project, this is merely
a suggestion.

*Bug*: However, things are bugged out if the levels of different worlds are imported
in a random order. Therefore, you should keep the structure of one file Lean file per world
which imports all its levels.
-/
