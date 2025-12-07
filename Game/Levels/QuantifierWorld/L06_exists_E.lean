import Game.Metadata

World "QuantifierWorld"
Level 6

Title "Using exists"

Introduction "
If you have an assumption `h : ∃ a : A, P(a)`, then the tactic `use_exists h as w, p` will replace `h` by a witness object `w : A`, along with an assumption `p : P(w)`. In English, this is like saying \"...let `w` be that object for which `P(w)` holds\".
"

Statement (A : Type) (h : ∃ a : A, a ∈ ∅) : False := by
  use_exists h as w, p
  Hint "great! you've now obtained an element of the empty set. You can now readily derive a contradiction, use the theorem `Set.empty_def : {w} ∉ ∅`."
  contradict Set.empty_def, p

/--
The empty set `∅ : Set A`. Write `∅` using `\empty` or `\emptyset`.
-/
DefinitionDoc Set.Empty as "Set.Empty / ∅" in "Set"
NewDefinition Set.Empty

/--
For any `x : A`, we have a proof `empty_def : x ∉ ∅` that `x` is not in `∅`.
-/
TheoremDoc Set.empty_def as "Set.empty_def" in "Set"
NewTheorem Set.empty_def

/--
If you have an assumption `h : ∃ a : A, P(a)`, then the tactic `use_exists h as w, p` will replace `h` by a witness object `w : A`, along with an assumption `p : P(w)`.
-/
TacticDoc use_exists
NewTactic use_exists
