import Game.Levels.ReasoningWorld

-- Here's what we'll put on the title screen
Title "Discrete Math Game @ Imperial Computing"
Introduction
"
# Welcome to the Discrete Math Game!

This is the companion game to the Discrete Math course for first-year computing students. In the course, you learn to construct correct English proofs of mathematical statements about sets. In this game, you will instead learn to write proofs in the language of the proof assistant *Lean*. Lean is able to check the correctness of your proofs, allowing you to quickly and correctly prototype proofs.

## Disclaimer: this game supplements your learning, but does not replace attendance of lectures or reading the notes.
"

Info "
Here you can put additional information about the game. It is accessible
from the starting through the drop-down menu.

For example: Game version, Credits, Link to Github and Zulip, etc.

Use **markdown**.
"

/-! Information to be displayed on the servers landing page. -/
Languages "en"
CaptionShort "Game Template"
CaptionLong "You should use this game as a template for your own game and add your own levels."
-- Prerequisites "" -- add this if your game depends on other games
-- CoverImage "images/cover.png"

/-! Build the game. Show's warnings if it found a problem with your game. -/
MakeGame
