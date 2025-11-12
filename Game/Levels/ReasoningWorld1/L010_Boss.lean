import Game.Metadata

World "ReasoningWorld1"
Level 10

set_option pp.parens true

Title "Exam"

Introduction "You get a good night's sleep, and you walk into your Discrete Math exam feeling prepared. This does not change despite how insane and abstract the question looks, since for some ineffable reason you have found many opportunities to practise Discrete Math in various life activites."

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
  have bb : B → B  := by assume b; exact b
  have f : F       := by use_imp p4, d
  have ac : A ∧ C  := by show_and a, c
  have bbac : (B → B) ∧ A ∧ C := by show_and bb, ac
  have e : E       := by use_imp p1, bbac
  have ef : E ∧ F  := by show_and e, f
  use_imp p2, ef

Conclusion "You hand in your exam, confidence restored."

-- Conclusion "This last message appears if the level is solved."
