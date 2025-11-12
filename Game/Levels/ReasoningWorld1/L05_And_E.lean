import Game.Metadata

World "ReasoningWorld1"
Level 5

Title "Using And"

Introduction "PANICK! The chef has accidentally mixed all the beef bulgogi with the mapo tofu! It's all mixed up in a `mess : beef_bulgogi ∧ mapo_tofu`. Now someone is asking for beef bulgogi but you don't know what to do!!!!

Because you have been going to yoga, you decide to take a deep breath and calm down. You suddenly remember the wise words of your manager (who has by now long vanished):

\"To prove `P` write `use_and_L pq`. Similarly, to prove `Q` write `use_and_R pq`.\"

You realize this lets you separate the `beef_bulgogi` from the `mess`!"

Statement (beef_bulgogi mapo_tofu : Prop) (mess : beef_bulgogi ∧ mapo_tofu) : beef_bulgogi := by
  use_and_L mess

Conclusion "After your shift, you eat some leftover Mapo tofu. Hmmm, surprisingly beefy flavour!"

/-- `use_and_R pq` proves the goal `Q` from `pq : P ∧ Q`. -/
TacticDoc use_and_R
/-- `use_and_L pq` proves the goal `P` from `pq : P ∧ Q`. -/
TacticDoc use_and_L
NewTactic use_and_L use_and_R
