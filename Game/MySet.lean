import Lean
open Lean PrettyPrinter Delaborator

universe u
variable {α : Type u}

def Set (α : Type u) := α → Prop

namespace Set

/-- Turn a predicate `p : α → Prop` into a set, also written as `{x | p x}` -/
def setOf {α : Type u} (p : α → Prop) : Set α :=
  p

/-- Membership in a set -/
protected def Mem (s : Set α) (a : α) : Prop := s a
/-- Use Lean's membership syntax from core -/
instance : Membership α (Set α) := ⟨fun S x => Set.Mem S x⟩

/-- Subset relation -/
protected def Subset (A B : Set α) :=
  ∀ a : α, a ∈ A → a ∈ B
/-- Subset notation: `a ⊆ b`  -/
instance : HasSubset (Set α) := ⟨Set.Subset⟩

public theorem subset_def {s t : Set α} : (s ⊆ t) ↔ ∀ x, x ∈ s → x ∈ t := by
  rfl

-- @[ext (iff := false)]
-- theorem ext {a b : Set α} (h : a ⊆ b ∧ b ⊆ a) : a = b := by
--   apply funext
--   intro x
--   ext
--   apply Iff.intro
--   intro ha; apply h.1; exact ha
--   intro hb; apply h.2; exact hb

theorem equals_def {a b : Set α} : a = b ↔ a ⊆ b ∧ b ⊆ a := by
  rw [funext_iff]
  apply Iff.intro
  intro h
  apply And.intro <;>
    (intro x ; specialize h x ; rw [propext_iff] at h)
  exact h.mp
  exact h.mpr

  intro ⟨h1, h2⟩ x
  apply propext
  specialize h1 x; specialize h2 x
  exact ⟨h1, h2⟩

/-- The empty set. -/
protected def Empty : Set α := fun _ ↦ False

@[inherit_doc] notation "∅" => Set.Empty

public theorem empty_def {w : α} : w ∉ ∅ := by
  intro f
  exact f

/-- Set comprehension syntax, either from a type or another set -/
declare_syntax_cat binder_construct
syntax (name := setComp) "{" binder_construct " | " term "}" : term
syntax ident : binder_construct
syntax ident " : " term : binder_construct
syntax ident " ∈ " term : binder_construct

macro_rules
  | `({ $var:ident : $type | $body }) => `(setOf (λ ($var : $type) => $body))
  | `({ $var:ident ∈ $set  | $body }) => `(setOf (λ $var => $var ∈ $set ∧ $body))
  | `({$var:ident          | $body})  => `(setOf (λ $var => $body))

open Lean PrettyPrinter Delaborator SubExpr

@[app_unexpander Set.setOf]
meta def setOfUnexpander : Lean.PrettyPrinter.Unexpander
  | `($_setOf (fun ($var:ident : $type:term) => $body)) => `({ $var:ident : $type:term | $body })
  | `($_setOf fun $var:ident => $body) => `({ $var:ident | $body })
  | _ => throw ()

theorem comp_def {A : Type} {P : A → Prop} {x : A}
  : x ∈ {a : A | P a} ↔ P x := by
  rfl

/-- The singleton of an element `a` is the set with `a` as a single element.

Note that you should **not** use this definition directly, but instead write `{a}`. -/
protected def singleton (a : α) : Set α := λ b => b = a

/-- finite set syntax -/
syntax (name := finSet) "{" term,+ "}" : term
macro_rules
  | `(finSet|{$a:term}) => `(Set.singleton $a)
  | `(finSet|{$x:term, $xs:term,*}) => `(insert $x {$xs:term,*})

/-- Unexpander for the `{ x }` notation. -/
@[app_unexpander Set.singleton]
meta def singletonUnexpander : Lean.PrettyPrinter.Unexpander
  | `($_singleton $a) => `({ $a:term })
  | _ => throw ()

/-- Unexpander for the `{ x, y, ... }` notation. -/
@[app_unexpander insert]
meta def insertUnexpander : Lean.PrettyPrinter.Unexpander
  | `($_ $a { $ts:term,* }) => `({$a:term, $ts,*})
  | _ => throw ()

#check {1, 2}

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

/-- The union of two sets `s` and `t` is the set of elements contained in either `s` or `t`.

Note that you should **not** use this definition directly, but instead write `s ∪ t`. -/
protected def Union (s₁ s₂ : Set α) : Set α := {a : α | a ∈ s₁ ∨ a ∈ s₂}

infixl :65 " ∪ " => Set.Union

theorem union_def {X Y : Set α} {a : α} : a ∈ X ∪ Y ↔ a ∈ X ∨ a ∈ Y := by
  rfl

/-- The intersection of two sets `s` and `t` is the set of elements contained in both `s` and `t`.

Note that you should **not** use this definition directly, but instead write `s ∩ t`. -/
protected def Inter (s₁ s₂ : Set α) : Set α := { a : α | a ∈ s₁ ∧ a ∈ s₂ }

infixl :70 " ∩ " => Set.Inter

theorem intersection_def {X Y : Set α} {a : α} : a ∈ X ∩ Y ↔ a ∈ X ∧ a ∈ Y := by
  rfl

/-- The complement of a set `s` is the set of elements not contained in `s`.

Note that you should **not** use this definition directly, but instead write `sᶜ`. -/
protected def Compl (s : Set α) : Set α := λ a => a ∉ s

prefix :80 "~ " => Set.Compl

theorem complement_def {X : Set α} {a : α} : a ∈ ~ X ↔ a ∉ X := by
  rfl

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
def image {β : Type v} (f : α → β) (s : Set α) : Set β := λ b => ∃ a : α, a ∈ s ∧ b = f a

/-- The property `s.Nonempty` expresses the fact that the set `s` is not empty. It should be used
in theorem assumptions instead of `∃ x, x ∈ s` or `s ≠ ∅` as it gives access to a nice API thanks
to the dot notation. -/
protected def Nonempty (s : Set α) : Prop :=
  ∃ x, x ∈ s

-- /-- Strict subset relation: `a ⊂ b`  -/
-- infix:50 " ⊂ " => SSubset

-- /-- Superset relation: `a ⊇ b`  -/
-- infix:50 " ⊇ " => Superset

-- /-- Strict superset relation: `a ⊃ b`  -/
-- infix:50 " ⊃ " => SSuperset

-- /-- `a ∩ b` is the intersection of`a` and `b`. -/
-- infixl:70 " ∩ " => Inter.inter



end Set
