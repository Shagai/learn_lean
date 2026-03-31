import Mathlib

/-!
# Lesson 7: parity and divisibility

This lesson turns the logic from the previous lessons into arithmetic statements about `Nat`.

- `d ∣ n` means that `n` is divisible by `d`.
- To prove `d ∣ n`, give a witness `k` with `n = d * k`.
- Negating a divisibility or parity statement means showing that no witness can work.
- We will also use explicit definitions of evenness and oddness.
-/

namespace LeanMath.Introduction

def IsEven (n : Nat) : Prop := ∃ k, n = 2 * k

def IsOdd (n : Nat) : Prop := ∃ k, n = 2 * k + 1

-- A divisibility proof is just an existential proof with the right witness.
example (k : Nat) : 2 ∣ 2 * k := by
  refine ⟨k, ?_⟩
  rfl

-- Concrete arithmetic examples are often the clearest place to start.
example : 2 ∣ 14 := by
  refine ⟨7, ?_⟩
  norm_num

-- `IsEven` is equivalent to divisibility by `2`.
theorem isEven_iff_two_dvd (n : Nat) : IsEven n ↔ 2 ∣ n := by
  constructor
  · intro h
    rcases h with ⟨k, hk⟩
    exact ⟨k, hk⟩
  · intro h
    rcases h with ⟨k, hk⟩
    exact ⟨k, hk⟩

-- Odd numbers are built by giving the witness in the formula `2 * k + 1`.
theorem oddFive : IsOdd 5 := by
  refine ⟨2, ?_⟩
  norm_num

-- To prove a negation, unpack the witness and derive a contradiction.
example : ¬ IsEven 7 := by
  intro h
  rcases h with ⟨k, hk⟩
  -- After unpacking the definition, the remaining contradiction is arithmetic.
  omega

-- `by_cases` lets us split on a concrete arithmetic proposition.
example (n : Nat) : 2 ∣ n ∨ ¬ (2 ∣ n) := by
  by_cases h : 2 ∣ n
  · left
    exact h
  · right
    exact h

end LeanMath.Introduction
