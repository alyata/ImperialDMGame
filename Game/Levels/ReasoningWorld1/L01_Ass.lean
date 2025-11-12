import Game.Metadata

World "ReasoningWorld1"
Level 1

Title "Proving by Assumption"

Introduction "
Hello there! Your **goal** in each level is to prove a proposition from some given objects and assumptions.

In the center, the righthand side of the 'Active Goal' tab tells you the proposition you have to prove. The lefthand side tells you what objects and assumptions you are allowed to use.

Currently, the righthand side says you have to prove `sky_is_purple`. This is of course not true, but luckily you are already given the assumption `p : sky_is_purple` on the lefthand side. You should read this as saying that `p` is the name of the assumption that `sky_is_purple`. There is also the object `sky_is_purple : Prop` -- this says `sky_is_purple` is an object of type `Prop`, which is short for 'Proposition'.

In Lean, proofs are much more structured than in English. The basic building block of proofs are called *tactics*. Your first tactic is called `exact`, which is used to prove a statement which follows *exactly* from an assumption."

Statement (sky_is_purple : Prop) (p : sky_is_purple) : sky_is_purple := by
  Hint "To prove `sky_is_purple` using the assumption `p`, write `exact p` in the textbox below the 'Active Goal' tab, and click 'Execute'!"
  exact p

Conclusion "Note that the `p` is just an arbitrary name, which we use to refer to the assumption that `sky_is_purple` holds. It could equally well have been `panda : sky_is_purple`."

/- Use these commands to add items to the game's inventory. -/

/-- `exact p` proves the goal `P` from an assumption `p : P`. -/
TacticDoc exact
NewTactic exact
-- NewTheorem Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
