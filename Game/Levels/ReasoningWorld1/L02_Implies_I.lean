import Game.Metadata

World "ReasoningWorld1"
Level 2

Title "Showing Implies"

Introduction "
This time, Lean wants to be convinced that `life_is_beautiful → life_is_beautiful`! When your goal is `P → Q`, you must first assume `P`. Do this now by writing `assume panda` in the text box and press `execute`.
"

Statement (life_is_beautiful : Prop) : life_is_beautiful → life_is_beautiful := by
  assume panda
  Hint "Notice that unlike in pen-and-paper-proofs, Lean will just automatically guess the proposition you are assuming. But Lean is still not convinced! Its responded with another proof obligation. The old obligations are displayed above the current one, for your reference. The new 'Active Goal' looks suspiciously familiar now though... Maybe you can finish this one yourself?"
  by_ass panda

Conclusion "Good job! By the way, you can also write `show_imp panda` as a synonym for `assume panda`."

/-- If the goal is `P -> Q`, then `assume p` creates the new assumption `p : P` and changes the goal to proving `Q`. -/
TacticDoc assume
/-- A synonym for `assume`.-/
TacticDoc show_imp
NewTactic assume show_imp

/-- `P → Q` means "`P` implies `Q`". To enter the symbol `→`, type `\imp`.

If your goal is `P → Q`, use the tactic `assume p : P` and then try to prove `Q`.

If you have assumptions `pq : P → Q` and `p : P`, the `use_imp pq, p` tactic will let you prove `Q`.
-/
DefinitionDoc Imp as "→"
NewDefinition Imp
