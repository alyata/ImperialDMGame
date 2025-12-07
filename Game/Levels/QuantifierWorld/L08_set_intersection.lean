import Game.Metadata

World "QuantifierWorld"
Level 8

Title "Intersection of Sets"

Introduction "
If `X, Y : Set A` then `X ∩ Y` contains exactly the elements that are in both `X` and `Y`. This definition is encoded in the theorem `Set.inter_def`.
"

Statement {A : Type} {X Y Z: Set A} : Z ⊆ X ∧ Z ⊆ Y → Z ⊆ X ∩ Y := by
  assume h
  have hzx : Z ⊆ X := by use_and_L h
  have hzy : Z ⊆ Y := by use_and_R h
  arbitrary a
  assume hz
  have hzx : a ∈ Z → a ∈ X := by use_forall hzx, a
  have hzy : a ∈ Z → a ∈ Y := by use_forall hzy, a
  have hx : a ∈ X := by use_imp hzx, hz
  have hy : a ∈ Y := by use_imp hzy, hz
  show_and hx, hy

/--
If `X, Y : Set A` then `X ∩ Y` is defined as `{ a : A | a ∈ X ∧ a ∈ Y}`. This definition is encoded in the theorem `Set.intersection_def`.
-/
DefinitionDoc Set.Intersection as "Set.Intersection / _ ∩ _" in "Set"
NewDefinition Set.Intersection

/--
The definition of intersection of two sets.
-/
TheoremDoc Set.intersection_def as "Set.intersection_def" in "Set"
NewTheorem Set.intersection_def
