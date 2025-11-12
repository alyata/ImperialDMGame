import Game.Metadata

World "ReasoningWorld1"
Level 3

Title "Using Implies"

Introduction "You feel that your life is beautiful whenever the sky glows a pretty purple, so you have the assumption `h : sky_is_purple → life_is_beautiful`. Luckily, today you look up and the sky is purple, so you also have the assumption `p : sky_is_purple`!

To prove `life_is_beautiful`, you have to **use** the assumption `h` and apply it to `h`. To do this in Lean, use the tactic `use_imp` like this: `use_imp h, p`. Don't forget the comma `,` between `h` and `p`!"

Statement (sky_is_purple life_is_beautiful : Prop) (h : sky_is_purple → life_is_beautiful) (p : sky_is_purple) : life_is_beautiful := by
  use_imp h, p

Conclusion "Wow, you're collecting an awful lot of tactics aren't you? Whenever you're starting to lose track of all these tactics, go to the right side of the screen and click on the tactic for a quick refresher!"

/-- `use_imp h, p` proves the goal `Q` from `h : P → Q` and `p : P`. -/
TacticDoc use_imp
NewTactic use_imp
