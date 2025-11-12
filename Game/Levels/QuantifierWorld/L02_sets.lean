import Game.Metadata

World "QuantifierWorld"
Level 2

Title "Elements of a Set"

Introduction "
For any type `A`, a set `X` containing elements of `A` has type `X : Set A`. If `a : A` is an object, then there is a proposition `x ∈ X` which expresses `x` being an element of `X`. To get the symbol `∈`, type `\\in`.

Prove that every element in a set of natural numbers contains itself.
"

Statement {X : Set ℕ} : ∀ x : ℕ, x ∈ X → x ∈ X := by
  arbitrary a
  assume h
  exact h

Conclusion "Nice!"

/- Use these commands to add items to the game's inventory. -/

/--
If you have an object `x : A` and a set `X : Set A`, then the proposition `x ∈ X` expresses `x` being an element of `X`. This is a primitive proposition, it is not defined in terms of other propositions.
-/
DefinitionDoc «∈» as "∈"
NewDefinition «∈»
