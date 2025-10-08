import Game.Metadata

World "ReasoningWorld"
Level 1

Title "Proving by Assumption"

Introduction "Proofs are carried out by writing down proof steps or *tactics* in sequence. The first tactic we learnt about is for proving a statement by assumption."

Statement (P : Prop) (p : P) : P := by
  Hint "`P : Prop` means that `P` is a proposition/statement."
  Hint "`p` is the assumption that `P` holds."
  Hint "To prove `P` from the assumption, write `exact p`, which means the goal follows from the assumption named `p`."
  exact p

-- Conclusion "This last message appears if the level is solved."

/- Use these commands to add items to the game's inventory. -/

/-- `exact p` proves the goal `P` from an assumption `p : P`. -/
TacticDoc exact
NewTactic exact
-- NewTheorem Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
