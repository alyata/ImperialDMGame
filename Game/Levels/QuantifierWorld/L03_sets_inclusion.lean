import Game.Metadata

World "QuantifierWorld"
Level 3

Title "Set Inclusion"

Introduction "
Prove that every set of natural numbers is a subset of iself.

If we have two sets `X, Y : Set A`, then `X ⊆ Y` _by definition_ says that  `∀ x : A, x ∈ X → x ∈ Y`. In Lean, I've provided a new tactic called `by_def`, which allows you to do this sort of unfolding. So if you try applying `by_def Set.subset_def`, Lean will replace the goal `X ⊆ X` by `∀ x : ℕ, x ∈ X → x ∈ X`. The definition of subset is encoded in the theorem `Set.subset_def`. Try it now!
"

Statement {X : Set ℕ} : X ⊆ X := by
  by_def Set.subset_def
  arbitrary a
  assume h
  by_ass h

Conclusion "Nice! When writing a pen-and-paper proof, you have to unfold definitions explicitly. But in lean the `by_def` is actually optional because lean is smart enough to 'see through' definitions, so here, even though your goal is `X ⊆ X`, lean will also treat it as if your goal is just `∀ x : ℕ, x ∈ X → x ∈ X`. So `by_def` is useful when you are having trouble keeping track of the definitions in your head, but you don't have to use it."

/--
If `X, Y : Set A`, then the proposition `X ⊆ Y` or `Subset X Y` is defined as `∀ a : A, a ∈ X → a ∈ Y`. This definition is encoded in the theorem `Set.subset_def`. Write `\subseteq` or `\ss` to type out the symbol `⊆`.
-/
DefinitionDoc «⊆» as "Set.Subset / ⊆" in "Set"
NewDefinition «⊆»

/--
`s ⊆ t` iff every element of `s` is an element of `t`.
-/
TheoremDoc Set.subset_def as "Set.subset_def" in "Set"
NewTheorem Set.subset_def

/--
The tactic `by_def q` takes a proof of a theorem or assumption of the form `q : P ↔ Q`. If your goal is `P` then the tactic succeeds and your goal is replaced by `Q`.

You can perform `by_def q at h` on an assumption `h : P` instead. This will replace the type of `h` to be `Q` instead.

If you write `by_def <-q` then this will replace assumption `Q` by `P` instead.
-/
TacticDoc by_def
NewTactic by_def
