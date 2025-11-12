import Game.Levels.QuantifierWorld.L01_forall_I
import Game.Levels.QuantifierWorld.L02_sets
import Game.Levels.QuantifierWorld.L03_sets_inclusion
import Game.Levels.QuantifierWorld.L04_forall_E

World "QuantifierWorld"
Title "Quantifiers and Sets"

Introduction "
Quantifiers in Lean work differently than in the course: they must specify a *type* to quantify over. In other words, `∀ x, P(x)` is meaningless, only `∀ x : A, P(x)` is a valid proposition.

Sets in Lean also respect this typing discipline. There is no type of all sets, but for each type `A` there is a type `set A` of sets which contain elements of `A`.
"
