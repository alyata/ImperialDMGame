import Game.Metadata

World "QuantifierWorld"
Level 1

Title "Showing Forall"

Introduction "
Inspect the context of the obligation. There is now a type `U` which represents the universe -- it contains every basic object we will ever talk about. For example, if we want to talk about natural numbers then `U` would be `ℕ`.

Your goal now is to show that every object is equal to itself. To show a forall statement, you begin by taking an arbitrary element. To do this in Lean, use the tactic `arbitrary a`.
"

Statement {U : Type} : ∀ x : U, x = x := by
  arbitrary a
  Hint "to show `{a} = {a}`, use the `rfl` theorem. You can read more about it on the right-hand side of this page."
  by_ass rfl

Conclusion "Just like `assume a`, the variable name `a` is up to you. "

/--
For any `a : A`, the term `rfl : a = a` proves the equality of `a` with itself.
-/
TheoremDoc rfl as "rfl" in "Equality"
NewTheorem rfl

/-- If the goal is `∀ x : A, P(x)`, the tactic `arbitrary a` takes an arbitrary object `a : A` and replaces the goal by `P(a)`. -/
TacticDoc arbitrary
NewTactic arbitrary

/--
`∀ x : A, P(x)` means  \"for each `a : A`, the proposition `P(a)` holds\". To enter the symbol `∀`, type `\forall`.

If your goal is `∀ x : A, P(x)`, use the tactic `arbitrary a`. This gives you a new object `a : A` (the arbitrary object) and replaces the goal with `P(a)`. You are free to choose the name `a` for this arbitrary object.

If you have an assumption `h : ∀ x : A, P(x)` and an object `a : A`, the tactic `use_forall h, a` allows you to prove `P(a)`.
-/
DefinitionDoc «∀» as "∀"
NewDefinition «∀»
