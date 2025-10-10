import Game.Metadata

World "ReasoningWorld"
Level 5

Title "Using Implies"

Introduction "Suppose `h : P → Q` and `p : P`. To prove `Q` write `use_imp h, p`."

Statement (P Q : Prop) (h : P → Q) (p : P) : Q := by
  use_imp h, p

-- Conclusion "This last message appears if the level is solved."

/- Use these commands to add items to the game's inventory. -/

/-- `use_imp h, p` proves the goal `Q` from `h : P → Q` and `p : P`. -/
TacticDoc use_imp
NewTactic use_imp




-- NewTheorem Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
