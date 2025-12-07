import Game.Metadata

World "QuantifierWorld"
Level 10

Title "Complement of Sets"

Introduction "
If `X : Set A` then `~ X` contains exactly the elements that are not in `X`. This definition is encoded in the theorem `Set.complement_def`. For this final level, prove one of DeMorgan's equations for sets. For this you will also need to work with equality of sets. The definition of set equality is encoded in the theorem `Set.equals_def` (I will not tell you what it is, you have to check the documentation on the righthand side!)

This proof is more involved than what you've done so far: you will need to `have` intermediate goals within intermediate goals. To do this, you will want to switch from the current \"typewriter mode\" to the \"text editor mode\", which you can access by clicking the `</>` logo on the top right corner.

In the text editor mode, you can edit your proof line-by-line as in a text editor. Each line corresponds to one tactic application. If you move the cursor to the end of the line, it shows the \"proof state\" after the tactic is applied. If you move the cursor to the beginning of the line, it shows the \"proof state\" just before the tactic is applied.

The exception to this rule is the intermediate goals tactic: `have p : P := by ...`. In typewriter mode, you had to write the proof for `P` in a single line. In text editor mode, you can write them over separate lines, as long as you indent. Moreover, you can have an intermediate goal within your intermediate goal as long as you indent appropriately!

For example, if we have an assumption `hnxy : a ∈ ~ (X ∪ Y)` in the proof state, we can write
```
have g1 : a ∈ ~ X := by
  assume hx
  have hxy : a ∈ X ∪ Y := by
    show_or_L hx
  contradict hnxy, hxy
```
"

Statement {A : Type} {X Y: Set A} : ~ (X ∪ Y) = ~ X ∩ ~ Y := by
  by_def Set.equals_def
  have h1 : ~ (X ∪ Y) ⊆ (~ X ∩ ~ Y) := by
    arbitrary a
    assume hnxy
    by_def Set.complement_def at hnxy
    have g1 : a ∈ ~ X := by
      assume hx
      have hxy : a ∈ X ∪ Y := by
        show_or_L hx
      contradict hnxy, hxy
    have g2 : a ∈ ~ Y := by
      assume hy
      have hxy : a ∈ X ∪ Y := by
        show_or_R hy
      contradict hnxy, hxy
    show_and g1, g2
  have h2 : (~ X ∩ ~ Y) ⊆ ~ (X ∪ Y) := by
    arbitrary a
    assume hnxny hxy
    use_or hxy as hx, hy
    have hnx : a ∈ ~ X := by
      use_and_L hnxny
    contradict hnx, hx
    have hny : a ∈ ~ Y := by
      use_and_R hnxny
    contradict hny, hy
  show_and h1, h2

Conclusion "Great job! That was quite a long proof. "

/--
If `X, Y : Set A` then `X = Y` is defined as `X ⊆ Y ∧ Y ⊆ X`. This definition is encoded in the theorem `Set.equals_def`.
-/
DefinitionDoc Eq as "Eq / _ = _" in "Set"
/--
If `X : Set A` and `a : A`, then by definition `a ∈ ~ X` iff `¬ (a ∈ X)`. This definition is encoded in the theorem `Set.complement_def`.
-/
DefinitionDoc Set.Compl as "Set.Compl / ~ _" in "Set"
NewDefinition Set.Compl Eq

/--
The definition of equality between two sets.
-/
TheoremDoc Set.equals_def as "Set.equals_def" in "Set"
/--
The definition of the complement of a set.
-/
TheoremDoc Set.complement_def as "Set.complement_def" in "Set"
NewTheorem Set.equals_def Set.complement_def
