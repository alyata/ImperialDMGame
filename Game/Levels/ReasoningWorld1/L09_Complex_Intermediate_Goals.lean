import Game.Metadata

World "ReasoningWorld1"
Level 9

Title "Complex Intermediate Goals"

Introduction "Intermediate goals may themselves contain connectives. Type `\\to` or `\\imp` and press the space key to write the `→` symbol. Type `\\and` to write the `∧` symbol."

Statement (P Q R : Prop) (pqr : (Q → P) → R): P → R := by
  assume p
  Hint "You need to prove the intermediate goal `Q → P`, which requires two tactics. Use a `;` to separate the two tactics."
  have qp : Q → P := by assume q; exact p
  use_imp pqr, qp

Conclusion "In the next world, we will introduce more symbols. We'll tell you how to write these when the time comes! For now, a challenger approaches..."
