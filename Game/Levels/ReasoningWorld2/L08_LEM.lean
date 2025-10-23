import Game.Metadata

World "ReasoningWorld2"
Level 8

Title "Optional Challenge: Prove the Law of Excluded Middle"

Introduction "In the course, you are given the law of excluded middle (LEM) as a basic axiom, and earlier I gave you `by_cases` as a primitive tactic. But in fact you can prove LEM just from judicious use of proof by contradiction! This is a rare example of when you genuinely need proof by contradiction."

/-- You can't use this, that would be cheating!  -/
TacticDoc by_cases
DisabledTactic by_cases

/-- If `P : Prop` is a proposition, then `lem P : P ∨ ¬P`. -/
Statement lem (P : Prop) : P ∨ ¬ P := by
Hint "Feel free to move on to other levels! In practice you will be using `by_cases` instead of `lem` directly, so unlocking `lem` is just a nice little bonus for the completionists."
by_contra n
Hint "try proving `¬P`..."
Hint "you might want to switch on editor mode -- this lets you edit your proof line-by-line. This way, Lean can help you even inside a `have` proof.)"
have np : ¬ P := by assume p; (have nn : P ∨ ¬ P := by show_or_L p); contradict n,nn
have nn : P ∨ ¬ P := by show_or_R np
contradict n,nn

Conclusion "Well done! You may now use the theorem `lem P`. Note that `lem P` is not a tactic, but a theorem. You can use it in places where a proof of a proposition is needed. For example, the tactics `by_cases h : P` and `use_or (lem P) as h, h` does the same thing. In practice"
