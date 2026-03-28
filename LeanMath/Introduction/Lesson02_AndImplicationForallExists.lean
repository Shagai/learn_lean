import Mathlib

/-!
# Lesson 2: implication, `∀`, and `∃`

Three proof patterns are central in Lean:

- To prove an implication `P → Q`, use `intro` and assume `P`.
- To prove `∀ x, P x`, use `intro` to choose an arbitrary `x`.
- To prove `∃ x, P x`, use `refine ⟨witness, ?_⟩` or `use witness`.

The reverse direction for an existential proof is elimination:
if `h : ∃ x, P x`, then `rcases h with ⟨x, hx⟩` gives a concrete witness `x`
and a proof `hx : P x`.
-/

namespace LeanMath.Introduction

-- Implication is handled by temporarily assuming the input.
example (P Q R : Prop) (hPQ : P → Q) (hQR : Q → R) : P → R := by
  intro hP
  exact hQR (hPQ hP)

-- A universal statement is proved by taking an arbitrary natural number.
example : ∀ n : Nat, n + 0 = n := by
  intro n
  simp

-- An existential statement is proved by exhibiting a witness.
example : ∃ n : Nat, n + 1 = 3 := by
  refine ⟨2, ?_⟩
  norm_num

-- Here we turn a universal hypothesis into an existential conclusion.
example (P : Nat → Prop) (h : ∀ n : Nat, P n) : ∃ n : Nat, P n := by
  refine ⟨0, ?_⟩
  exact h 0

-- Here we unpack one existential statement and build another.
example (h : ∃ n : Nat, n = 2) : ∃ m : Nat, m + 1 = 3 := by
  rcases h with ⟨n, hn⟩
  refine ⟨n, ?_⟩
  rw [hn]

end LeanMath.Introduction
