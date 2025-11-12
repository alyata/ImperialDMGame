import Game.Metadata

World "ReasoningWorld1"
Level 6

Title "Greener Pastures"

Introduction "
Mysteriously, whenever the chef makes a mess, a particular customer always comes and asks for \"beef-flavoured mapo tofu\".
Every single time the customer orders this, you groan and say \"coming right up...\""

Statement (beef_bulgogi mapo_tofu : Prop) : beef_bulgogi ∧ mapo_tofu → mapo_tofu := by
  assume mess
  use_and_R mess

Conclusion "You are getting bored with your job. You also realize you've learned all you can about Discrete Math from working at Kokoro, so you leave for greener pastures..."
-- Conclusion "This last message appears if the level is solved."
