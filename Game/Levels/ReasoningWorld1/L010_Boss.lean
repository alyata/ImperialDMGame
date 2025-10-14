import Game.Metadata

World "ReasoningWorld1"
Level 10

Title "Boss Fight!"

Introduction "Can you beat the boss of this world? Good luck!"

Statement (A B C D E F G : Prop)
  (a : A)
  (p1 : ((B → B) ∧ (A ∧ C)) → E)
  (p2 : E ∧ F → G)
  (p3 : A → (C ∧ D))
  (p4 : D → F)
  : G := by
  have cd : C ∧ D  := by use_imp p3, a
  have c : C       := by use_and_L cd
  have d : D       := by use_and_R cd
  have bb : B → B  := by
    assume b
    exact b
  have f : F       := by use_imp p4, d
  have ac : A ∧ C  := by show_and a, c
  have bbac : (B → B) ∧ A ∧ C := by show_and bb, ac
  have e : E       := by use_imp p1, bbac
  have ef : E ∧ F  := by show_and e, f
  use_imp p2, ef

Conclusion "Good Job! In the next world we will learn about even more connectives!"

-- Conclusion "This last message appears if the level is solved."
