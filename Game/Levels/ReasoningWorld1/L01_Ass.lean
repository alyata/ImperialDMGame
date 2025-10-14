import Game.Metadata

World "ReasoningWorld"
Level 1

Title "Proving by Assumption"

Introduction "Proofs are carried out by writing down proof steps or *tactics* in sequence. Your first tactic is for proving a statement by assumption."

Statement (P : Prop) (p : P) : P := by
  Hint "`P : Prop` means that `P` is a proposition/statement."
  Hint "`p` is the assumption that `P` holds."
  Hint "To prove `P` from the assumption, write `exact p`, which means the goal is 'exactly' the same as the assumption named `p`."
  exact p

Conclusion "Note that the `p` is just an arbitrary name, which we use to refer to the assumption that `P` holds. It could equally well have been `panda : P`."

/- Use these commands to add items to the game's inventory. -/

/-- `exact p` proves the goal `P` from an assumption `p : P`. -/
TacticDoc exact
NewTactic exact
-- NewTheorem Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
