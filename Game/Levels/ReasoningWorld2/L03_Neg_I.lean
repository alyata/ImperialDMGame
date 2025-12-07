import Game.Metadata

World "ReasoningWorld2"
Level 3

Title "Showing Not"

Introduction "To show `¬ P`, you must assume `P` and obtain a contradiction. Begin by using the `assume` tactic as usual."

Statement (P Q R : Prop) (pq : P → Q) (pr : P → R) (rnq : R → ¬ Q)  : ¬ P := by
  assume p
  Hint "In Lean, there is a special proposition `False` which is only provable by deriving a contradiction. If you have `nq : ¬ Q` and `q : Q`, then the tactic `contradict nq, q` derives a contradiction. Try to finish the proof with this tactic now. Type `\\not` to write `¬`. "
  have q : Q := by use_imp pq, p
  have r : R := by use_imp pr, p
  have nq : ¬ Q := by use_imp rnq, r
  contradict nq, q
  Conclusion "You may have noticed that to 'show not' you do not need a new tactic. Now try replacing `contradict` with `use_imp`. What happened? What does this tell you about the relationship between `¬` and `→`?"

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
