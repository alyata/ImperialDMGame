import Game.Metadata

World "ReasoningWorld1"
Level 9

Title "Complex Intermediate Goals"

Introduction "
You keep playing Minecraft and night falls. To survive the night, you have to craft a torch."

Statement (wood wood_block stick coal torch : Prop) (wood_block_recipe : wood → wood_block) (stick_recipe : wood_block → stick) (torch_recipe : stick ∧ coal → torch): coal ∧ wood → torch := by
  assume cw
  have w : wood := by use_and_R cw
  have wb : wood_block := by use_imp wood_block_recipe, w
  have s : stick := by use_imp stick_recipe, wb
  have c : coal := by use_and_L cw
  Hint "You realize you need `stick ∧ coal` to craft your torch. Your bootleg copy of Minecraft chimes in again with some noise about proving stuff:"
  Hint "Intermediate goals may themselves contain connectives. Type `\\to` or `\\imp` and press the space key to write the `→` symbol. Type `\\and` to write the `∧` symbol. If you forget these, you can check them in the \"Definitions\" tab on the right!"
  have sc : stick ∧ coal := by show_and s, c
  use_imp torch_recipe, sc

Conclusion "You close your computer -- that's enough Minecraft for tonight, because your Discrete Math exam is tomorrow!"
