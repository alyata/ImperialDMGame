import Game.Metadata

World "TypesWorld"
Level 1

set_option pp.parens true

Introduction "All your tactics have been stolen 😭. You sit there, dumbfounded: you can't even prove the easiest stuff now...

However, after crying for a while, you think: hang on, the proof of `P → P` is essentially saying: assume you are given as input some `h : P`, then you have to produce an output of type `P`. But that's just the identity function!
"

Statement (P : Prop): P → P := by
Hint "The lambda expression in Lean is quite similar to the one in Haskell. It is written as `λ x => f(x)`. To get the `λ` symbol, type `\\lambda`."
Hint "Use `exact (λ h => h)` to "
exact (λ h => h)

OnlyTactic exact
