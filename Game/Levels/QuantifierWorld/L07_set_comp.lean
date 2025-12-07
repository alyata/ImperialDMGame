import Game.Metadata

World "QuantifierWorld"
Level 7

Title "Set Comprehension"

Introduction "
Prove that `343` belongs in the set of multiples of `7`.
This set is constructed by set comprehension. In general, the set comprehension `{x : A | P(x)}` defines the set containing exactly those elements `a : A` which satisfy `P(a)`.

This definition is encoded in the theorem `Set.comp_def`, so that you can use it with the `by_def` tactic. But as usual, since lean can 'see through' definitions, using it is optional.
"

Statement : 343 ∈ { n : ℕ | ∃ p : ℕ, p * 7 = n} := by
  by_def Set.comp_def
  have h : 49 * 7 = 343 := by exact rfl
  show_exists 49, h

/--
The set comprehension `{x : A | P(x)}` defines the set containing exactly those elements `a : A` which satisfy `P(a)`. This definition is encoded in the `Set.comp_def` theorem.
-/
DefinitionDoc Set.setComp as "{ x : A | P(x) }" in "Set"
NewDefinition Set.setComp

/--
For any `a : A`, we have `comp_def : a ∈ {x : A | P(x)} ↔ P(a)`, i.e. that `a` is an element of a set comprehension iff it satisfies the condition of the comprehension.
-/
TheoremDoc Set.comp_def as "Set.comp_def" in "Set"
NewTheorem Set.comp_def
