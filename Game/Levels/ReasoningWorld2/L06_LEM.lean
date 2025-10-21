import Game.Metadata

World "ReasoningWorld2"
Level 6

Title "Optional Challenge: Prove the Law of Excluded Middle"

Introduction "In the course, you are given the law of excluded middle as a basic axiom. In fact you can prove it with judicious use of proof by contradiction! This is a rare example of when you genuinely need proof by contradiction."

/-- If `P : Prop` is a proposition, then `lem P : P ∨ ¬P`. -/
Statement lem (P : Prop) : P ∨ ¬ P := by
Hint "It looks like there's nothing you can do... maybe you should just `by_contra`?"
by_contra n
Hint "try proving `¬P`... (hint: you might want to switch on editor mode -- this lets you edit your proof line-by-line. This way, Lean can help you even inside a `have` proof.)"
have np : ¬ P := by assume p; (have nn : P ∨ ¬ P := by show_or_L p); contradict n,nn
have nn : P ∨ ¬ P := by show_or_R np
contradict n,nn

Conclusion "You may now use the theorem `lem P`! Note that `lem P` is not a tactic, so to prove the intermediate goal you must write something like `have pnp : P ∨ ¬ P := by exact lem p`."
