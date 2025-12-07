import Game.Metadata

World "QuantifierWorld"
Level 5

Title "Showing exists"

Introduction "
To prove `∃ a : A, P(a)`, use the tactic `show_exists w, p` where `w : A` is the witness, and `p : P(w)` is a proof that the predicate `P` holds at the witness `w`.
"

Statement : ∃ a : ℕ, a + 10 = 12 := by
  Hint "In this case, you probably want to take your witness to be `2`, and have to prove a lemma `2 + 10 = 12`. In this case, Lean is smart enough to figure out `2 + 10` computes to `12`, so you can prove your lemma using `rfl`!"
  have yay : 2 + 10 = 12 := by exact rfl
  show_exists 2, yay

Conclusion "In general, `rfl` can be used to prove two things that are equal up to performing some elementary \"calculations\"."

/--
`∃ x : A, P(x)` means  \"there is some `w : A` for which the proposition `P(w)` holds\". To enter the symbol `∃`, type `\exists`.

If your goal is `∃ x : A, P(x)`, use the tactic `show_exists w, p` where `w : A` is an object and `p : P(w)`.

If you have an assumption `h : ∃ x : A, P(x)`, the tactic `use_exists h as w, p` replaces the assumption `h` with a new object `w : A` and the assumption `p : P(w)`.
-/
DefinitionDoc «∃» as "∃"
NewDefinition «∃»

/--
To prove `∃ a : A, P(a)`, use the tactic `show_exists w, p` where `w : A` is the witness, and `p : P(w)` is a proof that the predicate `P` holds at the witness `w`.
-/
TacticDoc show_exists
NewTactic show_exists
