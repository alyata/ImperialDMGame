import Game.Metadata

World "ReasoningWorld"
Level 2

Title "Showing And"

Introduction "To prove `P ∧ Q` from `p : P` and `q : Q`, write `show_and p, q`."

Statement (P Q : Prop) (p : P) (q : Q) : P ∧ Q := by
  show_and p, q

-- Conclusion "This last message appears if the level is solved."

/- Use these commands to add items to the game's inventory. -/

/-- `show_and p, q` proves the goal `P ∧ Q` from `p : P` and `q : Q`. -/
TacticDoc show_and
NewTactic show_and
-- NewTheorem Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
