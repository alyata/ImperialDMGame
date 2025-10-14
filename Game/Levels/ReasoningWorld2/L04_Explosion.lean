import Game.Metadata

World "ReasoningWorld2"
Level 4

Title "Ex Falso Quodlibet"

Introduction "'Ex Falso quodlibet' is Latin meaning 'From falsehood, anything follows.' The `contradict` tactic can also be used to derive any proposition from a contradiction. Try it now!"

Statement (P Q R : Prop) (p : P) (np : ¬ P)  : 1 = 2 := by
  contradict np, p
