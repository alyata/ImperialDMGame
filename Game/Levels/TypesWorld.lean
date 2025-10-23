import Game.Levels.TypesWorld.L01_Types

World "TypesWorld"
Title "Types & Quantifiers"

Introduction "
We will now be learning about the quantifiers `∀` and `∃`.

Quantifiers in Lean work differently in that they must specify a *type* to quantify over. The types in Lean are inductive types just like in Haskell, and in fact Lean is also a functional programming language similar to Haskell.

Contrast this with the quantifiers we encountered in the course, which quantifies over everything in existence such as `Charizard, 63, 🎂, Steffen, etc.` One way to implement this in Lean is to just fix a reallyyy big type which contains everything, and then only work with that type. But we will not do this, because in practice the information provided by the types are useful, allowing us to type-check operations. For example, we will see that we can only form sets whose elements all come from the same type.
"
