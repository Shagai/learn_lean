import Mathlib

/-!
# Algebra 2: functions and sets

Functions and sets appear everywhere in modern mathematics, so it is worth learning
their Lean notation early.

- Function composition is written `g ∘ f`.
- Set inclusion is written `A ⊆ B`.
- Membership is written `x ∈ A`.
- The preimage of a set is written `f ⁻¹' A`.
-/

namespace LeanMath.Algebra

open Set

-- Function composition is definitionally true: Lean can close it with `rfl`.
example (f g : Nat → Nat) (x : Nat) : (g ∘ f) x = g (f x) := by
  rfl

-- A proof of set inclusion is a function sending elements of `A` to elements of `B`.
example (A B : Set Nat) : A ∩ B ⊆ B ∩ A := by
  intro x hx
  exact ⟨hx.2, hx.1⟩

-- Set-builder notation lets us state familiar subsets directly.
example : ({n : Nat | n < 3} : Set Nat) ⊆ {n : Nat | n < 5} := by
  intro n hn
  have h35 : 3 < 5 := by
    decide
  exact lt_trans hn h35

-- Preimages preserve inclusion: this is a first abstract set-theoretic fact.
example (f : ℝ → ℝ) (A B : Set ℝ) (hAB : A ⊆ B) : f ⁻¹' A ⊆ f ⁻¹' B := by
  intro x hx
  exact hAB hx

end LeanMath.Algebra

