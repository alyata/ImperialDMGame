import Game.Metadata

World "ReasoningWorld1"
Level 2

Title "Showing Implies"

Introduction "In the next levels, your goals will look more complicated. But fret not, for you will soon learn how to prove anything!

This time, your goal is `life_is_beautiful → life_is_beautiful`! In general, if your goal is `P → Q`, you must assume `P` and then write a proof of `Q`. In Lean, the assumption is made using the `assume` tactic. To make an assumption called `panda`, write `assume panda` in the text box and press `execute`.
"

Statement (life_is_beautiful : Prop) : life_is_beautiful → life_is_beautiful := by
  assume panda
  Hint "Isn't that nice? Based on the goal, Lean can infer the proposition you are assuming."
  Hint "Of course `assume {panda}` didn't quite finish the proof, so there is now a new 'Active Goal' tab. The old one(s) are displayed above the current one, for your reference. The new 'Active Goal' looks suspiciously familiar though... Maybe you can finish this one yourself?"
  exact panda

Conclusion "Good job! In the beginning, you can also write `show_imp panda`, which is just a synonym for `assume panda`."

/-- If the goal is `P -> Q`, then `assume p` creates the new assumption `p : P` and changes the goal to proving `Q`. -/
TacticDoc assume
/-- A synonym for `assume`.-/
TacticDoc show_imp
NewTactic assume show_imp

/-- `P → Q` means "`P` implies `Q`". To enter the symbol `→`, type `\imp`.

If your goal is `P → Q`, assume `P` and try to prove `Q`.

If you have `pq : P → Q`, the `use_imp` tactic will let you use `pq` along with some `p : P` to derive `Q`.
-/
DefinitionDoc Imp as "→"
NewDefinition Imp
