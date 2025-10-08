import Game.Metadata

World "ReasoningWorld"
Level 7

Title "Example 1.6"

Introduction "This is Example 1.6 from the notes. Be sure to try both ways of proving this!"

Statement (P Q : Prop) : (P → Q) → (P → Q) := by
  Hint "You can make multiple assumptions at once, as many as the goal allows. Try it now with `assume h p`!"
  assume h p
  use_imp h, p

-- Conclusion "This last message appears if the level is solved."
