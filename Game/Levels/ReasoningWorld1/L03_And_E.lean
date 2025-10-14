import Game.Metadata

World "ReasoningWorld1"
Level 3

Title "Using And"

Introduction "Suppose `pq : P ∧ Q`. To prove `P` write `use_and_L pq`. Similarly, to prove `Q` write `use_and_R pq`."

Statement (P Q : Prop) (pq : P ∧ Q) : P := by
  use_and_L pq

/-- `use_and_R pq` proves the goal `Q` from `pq : P ∧ Q`. -/
TacticDoc use_and_R
/-- `use_and_L pq` proves the goal `P` from `pq : P ∧ Q`. -/
TacticDoc use_and_L
NewTactic use_and_L use_and_R
