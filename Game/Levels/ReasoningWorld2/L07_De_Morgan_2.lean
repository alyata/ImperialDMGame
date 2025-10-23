import Game.Metadata

World "ReasoningWorld2"
Level 7

Title "DeMorgan's Law 2"

Introduction "It's dangerous to go alone! Take this: `by_cases`."

Statement (P Q : Prop) (npq : ¬ (P ∧ Q)) :  ¬ P ∨ ¬ Q := by
Hint "The tactic `by_cases h : P` replaces the current goal with two goals. In the first goal you gain an extra assumption `h : P`, while in the second goal you gain the extra assumption `h : ¬ P`."
Hint "This is the tactic version of the law of excluded middle."
by_cases hp : P
{
  by_cases hq : Q
  {
    have pq : P ∧ Q := by show_and hp, hq
    contradict npq, pq
  }
  {
    show_or_R hq
  }
}
{
  show_or_L hp
}
Conclusion "Good job! In the next level you will prove the law of excluded middle anyway, justifying the introduction of this tactic."

/-- If `P: Prop`, the tactic `by_cases h : P` replaces the current goal with two goals. In the first goal you gain an extra assumption `h : P`, while in the second goal you gain the extra assumption `h : ¬ P`. -/
TacticDoc by_cases
NewTactic by_cases
