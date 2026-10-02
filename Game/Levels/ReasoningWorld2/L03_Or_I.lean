import Game.Metadata

World "ReasoningWorld2"
Level 3

Title "Showing Or"

Introduction "
November 10 2010, 2:42 PM

You watched the CCTV recording as a figure in a yellow hooded jacket entered the Tesco and stabbed the cashier. Timestamp: November 9 2010, 6:05:15 AM.

In front of you stands a young man in a yellow hooded jacket, detained by the police.

\"Please you have to believe me! I was just getting my breakfast...
I couldn't decide between the salmon & cream cheese sandwich or the tuna mayo, so I went to the cashier to get a recommendation when I found her like this! \"

The young man proceeds to tell you about his activities of that morning. You asked where he got the jacket from.

\"I found it randomly just outside my house one block down. Someone must've tossed it but it's still perfectly good! \"

You ask for the police to collect the jacket as evidence. The man becomes even more confused and rattled, as the colour drains from his face. You inspect the jacket and find a speck of blood, which you submitted for analysis at the crime lab.

November 11 2010, 10:39 AM



To prove `P ∨ Q` from `p : P`, write `show_or_L p`. Similarly, write `show_or_R q` to prove `P ∨ Q` from `q : Q`. Feel free to use either one here!"

Statement (impossibly_aloof miss_the_balloon : Prop) (p : impossibly_aloof) (q : miss_the_balloon) : impossibly_aloof ∨ miss_the_balloon := by
  show_or_L p

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
