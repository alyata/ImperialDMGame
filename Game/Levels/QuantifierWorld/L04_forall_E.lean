import Game.Metadata

World "QuantifierWorld"
Level 4

Title "Using forall"

Introduction " Let `A` be a type and `X, Y, Z : Set A`. Then `X ⊆ Y` and `Y ⊆ Z` implies `X ⊆ Z`.
"

Statement {A : Type} {X Y Z : Set A} : X ⊆ Y ∧ Y ⊆ Z → X ⊆ Z := by
  assume h
  have h1 : X ⊆ Y := by use_and_L h
  have h2 : Y ⊆ Z := by use_and_R h
  arbitrary a
  assume h
  Hint "The tactic `use_forall h, a` applies a forall statement `h : ∀ x : A, P(x)` to some object `a : A` in order to prove `P(a)`. You can use this on `{h1}` and `{h2}` now. "
  have h1' : a ∈ X → a ∈ Y := by use_forall h1, a
  have h4 : a ∈ Y := by use_imp h1', h
  have h2' : a ∈ Y → a ∈ Z := by use_forall h2, a
  use_imp h2', h4

Conclusion "Nice! You can actually skip the `unfold_subset`: even though the goal is not explicitly of the form `∀ x : A, P(x)`, you can still immediately take `arbitrary a`."

/--
If you have an assumption `h : ∀ x : A, P(x)` and an object `a : A`, then `use_forall h, a` proves `P(a)`.
-/
TacticDoc use_forall
NewTactic use_forall
