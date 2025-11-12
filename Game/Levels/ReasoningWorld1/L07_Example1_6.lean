import Game.Metadata

World "ReasoningWorld1"
Level 7

Title "Example 1.6"

Introduction "It is Friday! You finish your last lecture lecture and look at your phone. It looks like your mates are gathering at the pub. You realize this is a good opportunity to learn Discrete Math, so you head there as well!

Your friend, who is a completely normal human being, says to you at the party:

\"Yo check out this problem I found from page 9, Section 1.6, Example 1.6 of the Discrete Math lecture notes. It has TWO proofs.\"

Because you came to the party to learn Discrete Math, you immediately get cracking at the proof.
"

Statement (P Q : Prop) : (P → Q) → (P → Q) := by
Hint "Just before you start the proof, your friend leans in with a strange, morbid look on their face and whispers in your ear \"You can make multiple assumptions at once, as many as the goal allows. Try it now with `assume h p`!\""
Branch
  assume h
  Hint "You realize your friend just really cares about your learning! You buy them a drink and thank them for the tip, but you think you found a better proof without making two assumptions."
  exact h
assume h p
Hint "BAD ENDING: You later notice that your friend's face is just a mask, and they must've been replaced by some sort of Discrete Math impostor."
use_imp h, p
