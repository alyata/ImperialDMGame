import Game.Metadata

World "ReasoningWorld1"
Level 8

Title "Intermediate Goals"

Introduction "You come home after a night of ~partying~ Discrete Math-ing, and you come to the wise decision of playing Minecraft. You just started playing, and now need to craft a `stick`. You know that you need some `wood` to make a `stick`.
"

Statement (wood wood_block stick : Prop) (wood_block_recipe : wood → wood_block) (stick_recipe : wood_block → stick) : wood → stick := by
  assume w
  Hint "After collecting `{w} : wood` you realize you first need to make a `wood_block` before you can craft your `stick`. You feel stuck until the game chimes in with a help message:"
  Hint "If you need to prove an intermediate goal `Q`, write `have q : Q := by INSERT_YOUR_PROOF_OF_Q_HERE`."
  Hint "(You realize your copy of Minecraft is not quite vanilla, it seems to have the Discrete Math mod installed...)"
  have wb : wood_block := by use_imp wood_block_recipe, w
  Hint "Huzzah! This introduces a new assumption `{wb} : wood_block` which you can now use. Now you feel more confident to craft your `stick`."
  use_imp stick_recipe, wb

Conclusion "MESSAGE FROM DEV: Due to a limitation of the web UI, you will have to write the proof of the intermediate goals in one line, so try to make easily reachable intermediate goals! If you really need to use multiple tactics, use `;` to separate them.

For example, `have pp : P → P := by assume p; exact p`."

/-- The tactic `have q : Q := by INSERT_YOUR_PROOF_OF_Q_HERE` introduces a new assumption `q : Q`. Due to a limitation of the web UI, you will have to write the proof of the intermediate goals in one line, so try to make easily reachable intermediate goals!
-/
TacticDoc «have»
NewTactic «have»
