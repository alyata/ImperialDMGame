import Game.Metadata

World "QuantifierWorld"
Level 4

Title "Using forall"

Introduction " Let `X, Y, Z : Set U` be sets. Then `X ⊆ Y` and `Y ⊆ Z` implies `X ⊆ Z`.

For this you will need to use the assumption `X ⊆ Y`, which is ultimately a forall statement. The tactic `use_forall h, a` applies a forall statement `h : ∀ x : A, P(x)` to some object `a : A` in order to prove `P(a)`.
"

Statement {U : Type} {X Y Z : Set U} : X ⊆ Y ∧ Y ⊆ Z → X ⊆ Z := by
  assume h
  have h1 : X ⊆ Y := by use_and_L h
  have h2 : Y ⊆ Z := by use_and_R h
  Hint "You can apply the tactic `by_def` at an assumption in the context too, not just the goal. Try it now by writing `by_def Set.subset_def at {h1}` to unfold the assumption {h1}."
  by_def Set.subset_def at h1
  by_def Set.subset_def at h2
  arbitrary a
  assume h
  Hint "You can try the `use_forall` on `{h1}` and `{h2}` now."
  have h1' : a ∈ X → a ∈ Y := by use_forall h1, a
  have h4 : a ∈ Y := by use_imp h1', h
  have h2' : a ∈ Y → a ∈ Z := by use_forall h2, a
  use_imp h2', h4

/--
If you have an assumption `h : ∀ x : A, P(x)` and an object `a : A`, then `use_forall h, a` proves `P(a)`.
-/
TacticDoc use_forall
NewTactic use_forall
