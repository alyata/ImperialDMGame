import Game.Metadata

World "QuantifierWorld"
Level 3

Title "Set Inclusion"

Introduction "
If we have two sets `X, Y : Set A`, then `X ⊆ Y` if every element in `X` is also in `Y`. In lean, this is defined by `∀ x : A, x ∈ X → x ∈ Y`.

Prove that every set of natural number is a subset of iself.
"

Statement {X : Set ℕ} : X ⊆ X := by
  Hint "Use the tactic `unfold_subset` to unfold `⊆` by its definition."
  unfold_subset
  arbitrary a
  assume h
  exact h

Conclusion "Nice! You can actually skip the `unfold_subset`: even though the goal is not explicitly of the form `∀ x : A, P(x)`, you can still immediately take `arbitrary a`."

/--
If `X, Y : Set A`, then the proposition `X ⊆ Y` is defined as `∀ a : A, a ∈ X → a ∈ Y`.
-/
DefinitionDoc «⊆» as "⊆"
NewDefinition «⊆»

/--
The tactic `unfold_subset` replaces any occurence of `X ⊆ Y` (where `X, Y : Set A`) by `∀ a : A, a ∈ X → a ∈ Y`.
-/
TacticDoc unfold_subset
NewTactic unfold_subset
