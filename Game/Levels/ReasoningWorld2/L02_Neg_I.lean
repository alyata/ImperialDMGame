import Game.Metadata

World "ReasoningWorld2"
Level 2

Title "Showing Not"

Introduction "
November 10 2010, 2:42 PM

You watched the CCTV recording as a figure in a yellow hooded jacket entered the Tesco and stabbed the cashier. Timestamp: November 9 2010, 6:05:15 AM.

In front of you stands a young man in a yellow hooded jacket, hands cuffed behind his back. The police are taking his statement.

\"Please you have to believe me! I was just getting my breakfast...
I couldn't decide between the salmon & cream cheese sandwich or the tuna mayo, so I went to the cashier to get a recommendation when I found her like this! \"

You think about the facts you've gathered so far. Your gut tells you that this man is not the murderer... But you cannot just rely on your gut, you have to prove this from the evidence!

Just then

(man_is_the_murderer ∧ murderer_is_over_18 -> man_is_over_18)

To show `¬ P`, you must assume `P` and obtain a contradiction. Begin by using the `assume` tactic as usual. "

Statement (P Q R : Prop) (pq : P → Q) (pr : P → R) (rnq : R → ¬ Q)  : ¬ P := by
  assume p
  Hint "In Lean, there is a special proposition `False` which is *only* provable by deriving a contradiction. If you have `nq : ¬ Q` and `q : Q`, then the tactic `contradict nq, q` derives a contradiction. Try to finish the proof with this tactic now. Type `\\not` to write `¬`. "
  have q : Q := by use_imp pq, p
  have r : R := by use_imp pr, p
  have nq : ¬ Q := by use_imp rnq, r
  contradict nq, q
  Conclusion "You may have noticed that to 'show not' you do not need a new tactic. Now try replacing `contradict` with `use_imp`. What happened? What does this tell you about the relationship between `¬`, `→` and `False`?"

/- Use these commands to add items to the game's inventory. -/

/-- If you have `nq : ¬ Q` and `q : Q`, then the tactic `contradict nq, q` derives a contradiction. This tactic proves any goal. -/
TacticDoc contradict
NewTactic contradict

/-- `¬ P` means "`P` does not hold". To enter the symbol `¬`, type `\not`.

If your goal is `¬ P`, `assume p` and then derive a contradiction.

If you have `np : ¬ P`, use `contradict` to derive a contradiction.
-/
DefinitionDoc Not as "¬"
NewDefinition Not
-- NewTheorem Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
