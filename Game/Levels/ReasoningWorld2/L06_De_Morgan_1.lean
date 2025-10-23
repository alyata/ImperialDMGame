import Game.Metadata

World "ReasoningWorld2"
Level 6

Title "DeMorgan's Law"

Introduction "This is one direction of the DeMorgan's law. Taken from Example 1.12 of the notes."

Statement (P Q : Prop) (npq : ¬ P ∨ ¬ Q) : ¬ (P ∧ Q) := by
assume pq
use_or npq as np, nq
have p : P := by use_and_L pq
contradict np, p
have q : Q := by use_and_R pq
contradict nq, q
