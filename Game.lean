import Game.Levels.ReasoningWorld1
import Game.Levels.ReasoningWorld2
import Game.Levels.QuantifierWorld

-- Here's what we'll put on the title screen
Title "Discrete Math Game @ Imperial Computing"
Introduction
"
# Welcome to the Discrete Math Game!

This is the companion game to the Discrete Math course for first-year computing students. In the course, you learn to construct correct English proofs of mathematical statements about sets. In this game, you will instead learn to write proofs in the language of the proof assistant *Lean*. Lean is able to check the correctness of your proofs, allowing you to quickly and correctly prototype proofs. You should learn how Lean does this, so that you can do this for yourself even without access to Lean.

## Disclaimer: this game supplements your learning, but does not replace attendance of lectures or reading the notes. If you encounter any discrepancy between this game and the lectures/notes, those always take precedent over the game.
"

Info "
## Discrete Math Game @ Imperial Computing

Thank you for playing the Discrete Math game. If you have any **questions**, **feedback**, **thoughts** or **issues** to report please do not hesitate to post on EdStem or email me (Alyssa) at alyssa.renata19@imperial.ac.uk! All feedback is greatly appreciated, and ideas are welcome to make the levels less \"dry\" with more flavour text or even an overarching plot.

There are more games to be found on the [main page](https://adam.math.hhu.de/#/), which you are free to play! Note that the tactics you find in those games will be very different, though in principle they can all be implemented in terms of what you learned in this course.

When you are ready for something more, you can also [install Lean on your PC](https://lean-lang.org/install/) so you can start formalizing your favourite pieces of math and computer science. If you want to work with the same tactics as in this game, you can find the Lean code in my [github repository](https://github.com/alyata/ImperialDMGame).

## Acknowledgements

I would like to thank the following people for testing the game and for their feedback at various stages of development!

*Zhixuan Yang*, *David Davies*, *Omar Tahir*, *Mohammad Kala*, *Aurelia Kepke-Wysocki*, *Vítek Jelínek*, *Paulo Emílio de Vilhena*
"

/-! Information to be displayed on the servers landing page. -/
Languages "en"
CaptionShort "Imperial DM Game"
CaptionLong "Discrete Math Game for first-year students at Imperial College's Department of Computing."
-- Prerequisites "" -- add this if your game depends on other games
-- CoverImage "images/cover.png"

/-! Build the game. Show's warnings if it found a problem with your game. -/
MakeGame
