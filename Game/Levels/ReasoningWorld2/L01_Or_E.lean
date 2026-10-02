import Game.Metadata

World "ReasoningWorld2"
Level 1

Title "Using Or/Proof by Cases"

Introduction "
November 10 2010, 2:00 PM

You find yourself on the scene of the crime: a Tesco. In front of you lies a dead body, the cashier. Stab wound, a very vanilla murder attempt, except... on the ground, *two* knives scattered about, both bloody!

The first knife is a butterfly knife, and the second knife is a kitchen knife (you recognize it as a Santoku, from your days as a sushi chef). At least one of these knives was used for the murder... But first, let's see what you can conclude for certain, independently of which knife was used.

In the UK, under-18s are not allowed to buy knives. This also applies when you order knives online. From this you conclude that the murderer must be 18 or older!

(Obviously, because *everyone* living in the UK always abides by the law, and would never hand a knife to an under-18, this is the only possible conclusion. Obviously.)

From your discrete math class in law school, you remember the following lesson: if you have `pq : P ∨ Q`, and you can show the goal follows from `P` and that the goal follows from `Q`, then you have proven the goal by cases. A proof by cases is always initiated by writing `use_or pq as p, q`."

Statement
(butterfly_used_for_murder
santoku_used_for_murder
butterfly_bought_online
santoku_bought_instore
murderer_is_over_18 : Prop)
(pq : butterfly_used_for_murder ∨ santoku_used_for_murder)
(pp : butterfly_used_for_murder → butterfly_bought_online)
(qq : santoku_used_for_murder → santoku_bought_instore)
(qr : santoku_bought_instore → murderer_is_over_18)
(pr : butterfly_bought_online → murderer_is_over_18)
: murderer_is_over_18 := by
  use_or pq as p, q
  Hint "HINT: Now you see Lean replaces the current goal with *two* goals to prove the `murder_is_over_18`. The assumption `pq` is replaced by `p : butterfly_used_for_murder` in the first goal, and by `q : santoku_used_for_murder` in the second goal. Finish the two goals now -- they must be done in order."
  have online : butterfly_bought_online := by use_imp pp, p
  use_imp pr, online
  have store  : santoku_bought_instore := by use_imp qq, q
  use_imp qr, store

Conclusion "
You conclude that the murderer must be over 18, but the existence of two knives remains a mystery... You move on to talk to the suspect."

/- Use these commands to add items to the game's inventory. -/

/-- If the current goal is `R` and `pq : P ∨ Q`, the tactic `use_or pq as p, q` replaces the current goal with two goals to prove `R`. The assumption `pq` is replaced by `p : P` in the first goal, and by `q : Q` in the second goal. -/
TacticDoc use_or
NewTactic use_or


NewHiddenTactic «as»
