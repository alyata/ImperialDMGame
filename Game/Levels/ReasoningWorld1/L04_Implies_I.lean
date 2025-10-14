import Game.Metadata

World "ReasoningWorld"
Level 4

Title "Showing Implies"

Introduction "To prove `P → Q`, you must assume `P` and then write a proof of `Q`. Write `assume p` to make this new assumption. You can also write `show_imp p`, which is just a synonym for `assume p`."

Statement (P Q : Prop) : P → P := by
  assume p
  Hint "Notice that the goal has changed. Can you prove the new goal now?"
  exact p

-- Conclusion "This last message appears if the level is solved."

/- Use these commands to add items to the game's inventory. -/

/-- If the goal is `P -> Q`, then `assume p` creates the new assumption `p : P` and changes the goal to proving `Q`. -/
TacticDoc assume
/-- A synonym for `assume`.-/
TacticDoc show_imp
NewTactic assume show_imp
-- NewTheorem Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
