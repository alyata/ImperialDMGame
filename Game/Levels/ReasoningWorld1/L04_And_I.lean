import Game.Metadata

World "ReasoningWorld1"
Level 4

Title "Showing And"

Introduction "You got a part-time job at Kokoro. Congratulations! A customer is now asking for a `katsu_curry` and a `pumpkin_croquette`. So your goal is to give them `katsu_curry ∧ pumpkin_croquette`.

Your manager comes up to you with a stern face and says to you: \"If you have assumptions `p : P` and `q : Q`, to prove `P ∧ Q`, use the tactic `show_and p, q`. Now go make me money.\"
"

Statement
{katsu_curry : Prop}
(pumpkin_croquette
 mapo_tofu
 beef_bulgogi : Prop)
(p : pumpkin_croquette)
(m : mapo_tofu)
(best_food_ever : katsu_curry)
(b : beef_bulgogi)
: katsu_curry ∧ pumpkin_croquette := by
  show_and best_food_ever, p

Conclusion "The manager hands you some money at the end of the shift. She says \"Spend your money wisely. When I was your age I bought a Discrete Math textbook with my first salary. Worse decision ever.\" She walks away calmly into the night and you never see her again..."

/- Use these commands to add items to the game's inventory. -/

/-- `show_and p, q` proves the goal `P ∧ Q` from `p : P` and `q : Q`. -/
TacticDoc show_and
NewTactic show_and

/-- `P ∧ Q` means "both `P` and `Q` holds". To enter the symbol `∧`, type `\and`.

If your goal is `P ∧ Q`, use `show_and` to prove it.

If you have `pq : P ∧ Q`, `use_and_L pq` will let you prove `P` and `use_and_R pq` will let you prove `Q`.
-/
DefinitionDoc And as "∧"
NewDefinition And
-- NewTheorem Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
