import Game.Metadata

World "ReasoningWorld1"
Level 6

Title "Example 1.5"

Introduction "You now have enough tactics to do some actual proofs! Good luck."

Statement (P Q : Prop) : P ∧ Q → Q := by
  Hint "This is Example 1.5 from the notes."
  assume pq
  use_and_R pq

-- Conclusion "This last message appears if the level is solved."
