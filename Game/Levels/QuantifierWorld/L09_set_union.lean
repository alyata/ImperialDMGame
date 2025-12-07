import Game.Metadata

World "QuantifierWorld"
Level 9

Title "Union of Sets"

Introduction "
If `X, Y : Set A` then `X ∪ Y` contains exactly the elements that are either in `X` or in `Y`. This definition is encoded in the theorem `Set.union_def` for use with `by_def` (optional, but useful).

Now prove the following (possibly slightly traumatizing) theorem.
"

Statement {A : Type} {X Y Z: Set A} : X ⊆ Z ∧ Y ⊆ Z → X ∪ Y ⊆ Z := by
  assume h
  have hxz : X ⊆ Z := by use_and_L h
  have hyz : Y ⊆ Z := by use_and_R h
  arbitrary a
  assume hxy
  use_or hxy as hx, hy

  have hxz : a ∈ X → a ∈ Z := by use_forall hxz, a
  use_imp hxz, hx

  have hyz : a ∈ Y → a ∈ Z := by use_forall hyz, a
  use_imp hyz, hy

/--
If `X, Y : Set A` then `X ∪ Y` is defined as `{ a : A | a ∈ X ∨ a ∈ Y}`. This definition is encoded in the theorem `Set.union_def`.
-/
DefinitionDoc Set.Union as "Set.Union / _ ∪ _" in "Set"
NewDefinition Set.Union

/--
The definition of union of two sets.
-/
TheoremDoc Set.union_def as "Set.union_def" in "Set"
NewTheorem Set.union_def
