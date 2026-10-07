import Game.Metadata

open Set

World "QuantifierWorld"
Level 2

Title "Elements of a Set"

Introduction "
For any type `U`, a set `X` containing elements of `A` has type `X : Set U`. If `a : A` is an object, then there is a proposition `a ∈ X` which expresses `a` being an element of `X`. To get the symbol `∈`, type `\\in`.

Prove that every element in a set contains itself.
"

Statement {U : Type} {X : Set U} : ∀ x ∈ X, x ∈ X := by
  arbitrary a
  assume h
  by_ass h

Conclusion "Nice!"

/- Use these commands to add items to the game's inventory. -/

/--
If you have an object `x : A` and a set `X : Set A`, then the proposition `x ∈ X` or `Set.Mem x X` expresses `x` being an element of `X`. Use `\in` to type `∈`.

This is a primitive proposition, it is not defined in terms of other propositions (actually this is a lie, but it is true for the purposes of the game).
-/
DefinitionDoc «∈» as "Set.Mem / ∈" in "Set"
NewDefinition «∈»
