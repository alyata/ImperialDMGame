import Game.Metadata

World "ReasoningWorld2"
Level 9

Title "Showing iff"

Introduction "This level and the next is about working with the connective `↔`, which you can write by typing `\\iff`. To prove `P ↔ Q`, first prove `P → Q` and `Q → P`."

Statement (P : Prop) : P ↔ P := by
have h : P → P := by assume p; exact p
Hint "Great! Now use the `show_iff` tactic to finish it off. You can find out how this tactic works from the right-hand inventory panel."
show_iff h, h

/--
`P ↔ Q` means `P → Q` and `Q → P`.

If you have assumptions `pq : P → Q` and `qp : Q → P` then `show_iff pq, qp` proves `P ↔ Q`.

On the other hand, if you have an assumption `h : P ↔ Q`, then `use_iff_R h` proves `P → Q` while `use_iff_L` proves `Q → P`.
-/
DefinitionDoc Iff as "↔"
NewDefinition Iff

/-- If you have assumptions `pq : P → Q` and `qp : Q → P` then `show_iff pq, qp` proves `P ↔ Q`. -/
TacticDoc show_iff
NewTactic show_iff
