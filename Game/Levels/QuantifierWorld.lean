import Game.Levels.QuantifierWorld.L01_forall_I
import Game.Levels.QuantifierWorld.L02_sets
import Game.Levels.QuantifierWorld.L03_sets_inclusion
import Game.Levels.QuantifierWorld.L04_forall_E
import Game.Levels.QuantifierWorld.L05_exists_I
import Game.Levels.QuantifierWorld.L06_exists_E
import Game.Levels.QuantifierWorld.L07_set_comp
import Game.Levels.QuantifierWorld.L08_set_intersection
import Game.Levels.QuantifierWorld.L09_set_union
import Game.Levels.QuantifierWorld.L10_set_complement

World "QuantifierWorld"
Title "Quantifiers and Sets"

Introduction "
Quantifiers in Lean work differently than in the course: they must specify a *type* to quantify over. In other words, `∀ x, P(x)` is meaningless, only `∀ x : A, P(x)` is a valid proposition.

Sets in Lean also respect this typing discipline. There is no type of all sets, but for each type `A` there is a type `set A` of sets which contain elements of `A`.

In this world, we will learn how to prove statements involving quantifiers and some basic operations of sets.
"
