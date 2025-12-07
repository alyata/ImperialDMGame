import GameServer
import Init.Prelude
import Mathlib.Data.Nat.Init
import Game.MySet

-- import Mathlib.Tactic.Common

macro "assume" args:(colGt ident)* : tactic =>
  `(tactic| intro $args*)
macro "show_imp" args:(colGt ident)* : tactic =>
  `(tactic| intro $args*)
-- macro "by_contra" arg:(colGt ident) : tactic =>
--   `(tactic| apply Classical.byContradiction; assume $arg)
macro "arbitrary" args:(colGt ident)* : tactic =>
  `(tactic| intro $args*)

-- syntax "assume" ident* : tactic
-- syntax "show_imp" ident* : tactic
syntax "by_contr" ident : tactic
syntax "show_and" term "," term : tactic
syntax "show_iff" term "," term : tactic
syntax "use_and_L" term : tactic
syntax "use_and_R" term : tactic
syntax "use_iff_R" term : tactic
syntax "use_iff_L" term : tactic
syntax "show_or_L" term : tactic
syntax "show_or_R" term : tactic
syntax "use_imp" term "," term : tactic
syntax "use_forall" term "," term : tactic
syntax "show_exists" term "," term : tactic
syntax "use_exists" Lean.Parser.Tactic.elimTarget "as" colGt ident "," colGt ident : tactic
syntax "contradict" term "," term : tactic
syntax "use_or" Lean.Parser.Tactic.elimTarget "as" colGt ident "," colGt ident : tactic
syntax "by_def" term : tactic
syntax "by_def" term "at" ident : tactic
-- syntax "by_def" Lean.Parser.Tactic.rwRule : tactic
-- syntax "by_def" Lean.Parser.Tactic.rwRule "at" Lean.Parser.Tactic.locationHyp : tactic
macro_rules
  -- | `(tactic| assume $ps*)          => `(tactic|intro $ps*)
  -- | `(tactic| show_imp $ps*)        => `(tactic|intro $ps*)
  | `(tactic| by_contr $p)             => `(tactic| apply Classical.byContradiction; assume $p)
  | `(tactic| show_and $p, $q)         => `(tactic|exact And.intro $p $q)
  | `(tactic| show_iff $p, $q)         => `(tactic|exact Iff.intro $p $q)
  | `(tactic| use_and_L $pq)           => `(tactic|exact And.left $pq)
  | `(tactic| use_and_R $pq)           => `(tactic|exact And.right $pq)
  | `(tactic| use_iff_R $h)            => `(tactic|exact Iff.mp $h)
  | `(tactic| use_iff_L $h)            => `(tactic|exact Iff.mpr $h)
  | `(tactic| use_imp $p, $q)          => `(tactic|exact $p $q)
  | `(tactic| use_forall $p, $q)       => `(tactic|exact $p $q)
  | `(tactic| show_exists $w, $p)      => `(tactic|exact Exists.intro $w $p)
  | `(tactic| use_exists $h as $w, $p) => `(tactic|rcases $h with ⟨$w, $p⟩)
  | `(tactic| contradict $p, $q)       => `(tactic|exact False.elim ($p $q))
  | `(tactic| show_or_L $p)            => `(tactic|exact Or.inl $p)
  | `(tactic| show_or_R $q)            => `(tactic|exact Or.inr $q)
  | `(tactic| use_or $h as $p, $q)     => `(tactic|rcases $h with $p | $q)
  | `(tactic| by_def $t)               => `(tactic|apply Iff.mpr $t)
  | `(tactic| by_def $t at $h)         => `(tactic|replace $h := Iff.mp $t $h)

/-! Use this file to add things that should be available in all levels.


For example, this demo imports the mathlib tactics

*Note*: As long as `Game.lean` exists and ends with the `MakeGame` command,
you are completely free how you structure your lean project, this is merely
a suggestion.

*Bug*: However, things are bugged out if the levels of different worlds are imported
in a random order. Therefore, you should keep the structure of one file Lean file per world
which imports all its levels.
-/

macro "unfold_subset" : tactic =>
  `(tactic | simp only [Set.subset_def])
