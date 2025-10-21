import Game.Metadata

World "ReasoningWorld2"
Level 5

Title "Proof by Contradiction"

Introduction "To prove `Q`, you can always assume `nq : ¬Q` in order to reach a contradiction. You can do this with the tactic `by_contra nq` - give it a shot now!"

Statement (P Q : Prop) (nqnp : ¬Q → ¬P)  : P → Q := by
  intro p
  by_contra nq
  have np : ¬ P := by use_imp nqnp, nq
  contradict np, p

Conclusion "Remember, use this powerful tool sparingly! This principle is not acceptable in [constructivist mathematics](https://en.wikipedia.org/wiki/Constructivism_(philosophy_of_mathematics)). If you have a proof by contradiction, always check whether you can simplify to a proof that does not use it. "

/-- If the goal is `Q`, the tactic `by_contra nq` adds a new assumption `nq : ¬Q` and replaces the goal with `False`. -/
TacticDoc by_contra
NewTactic by_contra
