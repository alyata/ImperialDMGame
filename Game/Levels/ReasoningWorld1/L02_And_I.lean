import Game.Metadata

World "ReasoningWorld1"
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

/-- `P ∧ Q` means "both `P` and `Q` holds". To enter the symbol `∧`, type `\and`.

If your goal is `P ∧ Q`, use `show_and` to prove it.

If you have `pq : P ∧ Q`, `use_and_L pq` will let you prove `P` and `use_and_R pq` will let you prove `Q`.
-/
DefinitionDoc And as "∧"
NewDefinition And
-- NewTheorem Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
