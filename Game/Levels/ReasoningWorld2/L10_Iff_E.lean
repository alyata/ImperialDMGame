import Game.Metadata

World "ReasoningWorld2"
Level 10

Title "Using Iff"

Introduction "Finish this level using the `use_iff_L` and `use_iff_R` tactics, which you can read more about in your inventory."

Statement (P Q R : Prop) (h : P ↔ Q) (p : P) (r : P ∧ Q → R) : R := by
  have pq : P → Q := by use_iff_R h
  have q : Q := by use_imp pq, p
  have pnq : P ∧ Q := by show_and p, q
  use_imp r, pnq

Conclusion "Good! Working with `↔` will be handy in the next world, where we use these to state definitions."

/-- If you have an assumption `h : P ↔ Q`, then `use_iff_R h` proves `P → Q`. -/
TacticDoc use_iff_R

/-- If you have an assumption `h : P ↔ Q`, then `use_iff_L h` proves `Q → P`. -/
TacticDoc use_iff_L

NewTactic use_iff_R use_iff_L
