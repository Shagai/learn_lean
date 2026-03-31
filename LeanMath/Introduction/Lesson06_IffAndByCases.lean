import Mathlib

/-!
# Lesson 6: equivalence and proof by cases

An equivalence `P ↔ Q` packages two implications together.
Lean handles it with the same proof habits as earlier lessons:

- To prove `P ↔ Q`, use `constructor`.
- The first goal is `P → Q`, and the second is `Q → P`.
- To use `h : P ↔ Q`, apply `h.mp` for the forward direction and `h.mpr` for the reverse direction.
- `by_cases h : T` splits a proof into the case where `T` holds and the case where it does not.
-/

namespace LeanMath.Introduction

-- `constructor` on an `↔` goal asks for both directions.
theorem andCommIff (P Q : Prop) : (P ∧ Q) ↔ (Q ∧ P) := by
  constructor
  · intro h
    exact ⟨h.2, h.1⟩
  · intro h
    exact ⟨h.2, h.1⟩

-- Once an equivalence is available, `h.mp` extracts the forward implication.
example (P Q : Prop) (h : P ↔ Q) (hP : P) : Q := by
  exact h.mp hP

-- And `h.mpr` extracts the reverse implication.
example (P Q : Prop) (h : P ↔ Q) (hQ : Q) : P := by
  exact h.mpr hQ

-- This theorem combines `↔` with case analysis on a disjunction.
theorem orSelf (P : Prop) : P ∨ P ↔ P := by
  constructor
  · intro h
    cases h with
    | inl hP =>
        exact hP
    | inr hP =>
        exact hP
  · intro hP
    left
    exact hP

-- `by_cases` expects a decidable proposition, such as an equality on natural numbers.
example (n : Nat) : n = 0 ∨ 0 < n := by
  by_cases h : n = 0
  · left
    exact h
  · right
    exact Nat.pos_of_ne_zero h

-- Exercise: reverse an equivalence by swapping the two directions.
example (P Q : Prop) : (P ↔ Q) → (Q ↔ P) := by
  intro h
  constructor
  · intro hQ
    exact h.mpr hQ
  · intro hP
    exact h.mp hP

end LeanMath.Introduction
