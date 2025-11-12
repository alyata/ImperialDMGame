import Lean
import Init.Prelude

universe u
variable {α : Type u}

def Set (α : Type u) := α → Prop

/-- Turn a predicate `p : α → Prop` into a set, also written as `{x | p x}` -/
def setOf {α : Type u} (p : α → Prop) : Set α :=
  p

namespace Set

/-- Membership in a set -/
protected def Mem (s : Set α) (a : α) : Prop :=
  s a

/- gives ∈ notation -/
instance : Membership α (Set α) :=
  ⟨Set.Mem⟩

protected def Subset (s₁ s₂ : Set α) :=
  ∀ a : α, a ∈ s₁ → a ∈ s₂

/- gives ⊆ notation -/
instance : HasSubset (Set α) :=
  ⟨Set.Subset⟩

public theorem subset_def {s t : Set α} : (s ⊆ t) = ∀ x, x ∈ s → x ∈ t := by
  rfl

/- gives ∅ and {} notation -/
instance : EmptyCollection (Set α) :=
  ⟨fun _ ↦ False⟩

theorem ext {a b : Set α} (h : a ⊆ b ∧ b ⊆ a) : a = b := by
  have h : ∀ (x : α), x ∈ a ↔ x ∈ b := by
    intro x
    exact ⟨h.1 x, h.2 x⟩
  exact funext (fun x ↦ propext (h x))

/-- The universal set on a type `α` is the set containing all elements of `α`.

This is conceptually the "same as" `α` (in set theory, it is actually the same), but type theory
makes the distinction that `α` is a type while `Set.univ` is a term of type `Set α`. `Set.univ` can
itself be coerced to a type `↥Set.univ` which is in bijection with (but distinct from) `α`. -/
def univ : Set α := λ _ => True

/-- `Set.insert a s` is the set `{a} ∪ s`.

Note that you should **not** use this definition directly, but instead write `insert a s` (which is
mediated by the `Insert` typeclass). -/
protected def insert (a : α) (s : Set α) : Set α := λ b => b = a ∨ b ∈ s

instance : Insert α (Set α) := ⟨Set.insert⟩

/-- The singleton of an element `a` is the set with `a` as a single element.

Note that you should **not** use this definition directly, but instead write `{a}`. -/
protected def singleton (a : α) : Set α := λ b => b = a

instance instSingletonSet : Singleton α (Set α) := ⟨Set.singleton⟩

/-- The union of two sets `s` and `t` is the set of elements contained in either `s` or `t`.

Note that you should **not** use this definition directly, but instead write `s ∪ t`. -/
protected def union (s₁ s₂ : Set α) : Set α := λ a => a ∈ s₁ ∨ a ∈ s₂

instance : Union (Set α) := ⟨Set.union⟩

/-- The intersection of two sets `s` and `t` is the set of elements contained in both `s` and `t`.

Note that you should **not** use this definition directly, but instead write `s ∩ t`. -/
protected def inter (s₁ s₂ : Set α) : Set α := λ a => a ∈ s₁ ∧ a ∈ s₂

instance : Inter (Set α) := ⟨Set.inter⟩

/-- The complement of a set `s` is the set of elements not contained in `s`.

Note that you should **not** use this definition directly, but instead write `sᶜ`. -/
protected def compl (s : Set α) : Set α := λ a => a ∉ s

/-- The difference of two sets `s` and `t` is the set of elements contained in `s` but not in `t`.

Note that you should **not** use this definition directly, but instead write `s \ t`. -/
protected def diff (s t : Set α) : Set α := λ a => a ∈ s ∧ a ∉ t

instance : SDiff (Set α) := ⟨Set.diff⟩

/-- `𝒫 s` is the set of all subsets of `s`. -/
def powerset (s : Set α) : Set (Set α) := λ t => t ⊆ s

@[inherit_doc] prefix:100 "𝒫 " => powerset

universe v in
/-- The image of `s : Set α` by `f : α → β`, written `f '' s`, is the set of `b : β` such that
`f a = b` for some `a ∈ s`. -/
def image {β : Type v} (f : α → β) (s : Set α) : Set β := λ b => ∃ a ∈ s, b = f a

/-- The property `s.Nonempty` expresses the fact that the set `s` is not empty. It should be used
in theorem assumptions instead of `∃ x, x ∈ s` or `s ≠ ∅` as it gives access to a nice API thanks
to the dot notation. -/
protected def Nonempty (s : Set α) : Prop :=
  ∃ x, x ∈ s

end Set
