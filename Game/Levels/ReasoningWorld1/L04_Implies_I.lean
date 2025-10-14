import Game.Metadata

World "ReasoningWorld1"
Level 4

Title "Showing Implies"

Introduction "To prove `P → Q`, you must assume `P` and then write a proof of `Q`. Write `assume p` to make this new assumption. You can also write `show_imp p`, which is just a synonym for `assume p`."

Statement (P Q : Prop) : P → P := by
  assume p
  Hint "Notice that the goal has changed. Can you prove the new goal now?"
  exact p

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
