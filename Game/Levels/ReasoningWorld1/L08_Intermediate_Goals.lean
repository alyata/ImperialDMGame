import Game.Metadata

World "ReasoningWorld"
Level 8

Title "Intermediate Goals"

Introduction "Proofs often require you to prove other statements on your way to the main goal. To prove the goal `R`, you have to first prove `Q`."

Statement (P Q R : Prop) (pq : P → Q) (qr : Q → R): P → R := by
  Hint "First, make the assumption so we have all the ingredients ready."
  assume p
  Hint "Now, write `have q : Q := by INSERT_YOUR_PROOF_OF_Q_HERE`."
  have q : Q := by use_imp pq, p
  Hint "Huzzah! This introduces a new assumption `q : Q` which you can now use. Of course, you can a name other than `q`."
  use_imp qr, q

Conclusion "Due to a limitation of the web UI, you will have to write the proof of the intermediate goals in one line, so try to make easily reachable intermediate goals! By the way, intermediate goals in maths are called 'lemmas'."
