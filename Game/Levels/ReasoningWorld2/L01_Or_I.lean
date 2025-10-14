import Game.Metadata

World "ReasoningWorld2"
Level 1

Title "Showing Or"

Introduction "To prove `P ∨ Q` from `p : P`, write `show_or_L p`. Similarly, write `show_or_R q` to prove `P ∨ Q` from `q : Q`. Feel free to use either one here!"

Statement (P Q : Prop) (p : P) (q : Q) : P ∨ Q := by
  show_or_L p

-- Conclusion "This last message appears if the level is solved."

/- Use these commands to add items to the game's inventory. -/

/-- `show_or_L p` proves the goal `P ∧ Q` from `p : P`. -/
TacticDoc show_or_L
/-- `show_or_R q` proves the goal `P ∧ Q` from `q : Q`. -/
TacticDoc show_or_R
NewTactic show_or_L show_or_R

/-- `P ∨ Q` means "`P` or `Q` (or both)". To enter the symbol `∨`, type `\or`.

If your goal is `P ∨ Q`, use `show_or_L` or `show_or_R` to prove it.

If you have `h : P ∨ Q`, use `use_or` to do a proof by cases over `h`.
-/
DefinitionDoc Or as "∨"
NewDefinition Or
-- NewTheorem Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
