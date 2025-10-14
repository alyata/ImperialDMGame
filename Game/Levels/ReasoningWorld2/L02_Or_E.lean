import Game.Metadata

World "ReasoningWorld2"
Level 2

Title "Using Or/Proof by Cases"

Introduction "If you have `pq : P ∨ Q`, and you can show the goal follows from P and that the goal follows from `Q`, then you have proven the goal by cases. Write `use_or pq as p, q` to initiate a proof by cases."

Statement (P Q R : Prop) (pq : P ∨ Q) (pr : P → R) (qr : Q → R) : R := by
  use_or pq as p, q
  Hint "This replaces the current goal with two goals to prove `R`. The assumption `pq` is replaced by `p : P` in the first goal, and by `q : Q` in the second goal. Finish the two goals now -- they must be done in order."
  use_imp pr, p
  use_imp qr, q

Conclusion "In practice, you may choose more informative or convenient names `p` and `q` when applying `use_or`."

/- Use these commands to add items to the game's inventory. -/

/-- If the current goal is `R` and `pq : P ∨ Q`, the tactic `use_or pq as p, q` replaces the current goal with two goals to prove `R`. The assumption `pq` is replaced by `p : P` in the first goal, and by `q : Q` in the second goal. -/
TacticDoc use_or
NewTactic use_or
-- NewTheorem Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
