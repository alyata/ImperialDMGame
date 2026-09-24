import Game.Metadata

World "ReasoningWorld1"
Level 1

Title "Proving by Assumption"

Introduction "
Hello there! Your **goal** in each level is to convince Lean that a certain given **proposition** holds. This takes the form of a turn-based 2-player game. Your moves are called **tactics**, while Lean's moves are called (proof) **obligations**. You win when you make a move/tactic and Lean shuts up without giving you another obligation. The sequence of tactics that you apply to make Lean shut up is called a **proof**. Over time you will see that these tactic proofs are not so different from the proofs you write in the course.

Before you start playing, let's explore the interface. Lean always starts first, and in the center of the screen you will see its opening move, the first proof obligation, under the 'Active Goal' tab. A proof obligation has two components. The first component on the righthand side of the 'Active Goal' tab tells you the proposition Lean is obliging you to proof. The second component on the lefthand side tells you what objects and assumptions you are allowed to use to respond to it.

Currently, the righthand side says You want to convince Lean that the `sky_is_purple`. This is easy, since Lean has foolishly given you the assumption `p : sky_is_purple` on the lefthand side. You should read this as saying that `p` is the name of the assumption that `sky_is_purple`. There is also the object `sky_is_purple : Prop` -- this says `sky_is_purple` is an object of type `Prop`, which is short for 'Proposition'.

Make your first move now, by showing Lean that `sky_is_purple` follows **exactly** from the assumption `p`."

Statement (sky_is_purple : Prop) (p : sky_is_purple) : sky_is_purple := by
  Hint "To prove `sky_is_purple` using the assumption `p`, write `exact p` in the text box below the 'Active Goal' tab, and either press 'Enter' or click 'Execute'!"
  exact p

Conclusion "
Nice! Lean is now convinced that the `sky_is_purple`.

Note that the `p` is just an arbitrary name, which we use to refer to the assumption that `sky_is_purple` holds. It could equally well have been `panda : sky_is_purple`."

/- Use these commands to add items to the game's inventory. -/

/-- `exact p` proves the goal `P` from an assumption `p : P`. -/
TacticDoc exact
NewTactic exact
-- NewTheorem Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
