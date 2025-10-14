import Game.Levels.ReasoningWorld1

-- Here's what we'll put on the title screen
Title "Discrete Math Game @ Imperial Computing"
Introduction
"
# Welcome to the Discrete Math Game!

This is the companion game to the Discrete Math course for first-year computing students. In the course, you learn to construct correct English proofs of mathematical statements about sets. In this game, you will instead learn to write proofs in the language of the proof assistant *Lean*. Lean is able to check the correctness of your proofs, allowing you to quickly and correctly prototype proofs.

## Disclaimer: this game supplements your learning, but does not replace attendance of lectures or reading the notes.
"

Info "
## Discrete Math Game @ Imperial Computing

Thank you for playing the Discrete Math game. If you have any **questions**, **feedback**, **thoughts** or **issues** to report please do not hesitate to post on EdStem or email alyssa.renata19@imperial.ac.uk! All feedback is greatly appreciated.

Special Thanks to Mohammad Kala and Aurelia for testing the game at various phases!
"

/-! Information to be displayed on the servers landing page. -/
Languages "en"
CaptionShort "Game Template"
CaptionLong "You should use this game as a template for your own game and add your own levels."
-- Prerequisites "" -- add this if your game depends on other games
-- CoverImage "images/cover.png"

/-! Build the game. Show's warnings if it found a problem with your game. -/
MakeGame
