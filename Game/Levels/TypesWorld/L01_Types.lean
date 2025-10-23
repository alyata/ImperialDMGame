import Game.Metadata

World "TypesWorld"
Level 1

set_option pp.parens true

Statement : ∀ x : Nat, x = x + 1 → x = x + 1 := by
intro x
assume h
exact h
