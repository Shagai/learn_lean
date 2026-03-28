import Mathlib

/-!
# Lesson 4: induction on natural numbers

Induction is the standard proof method for recursive statements about `Nat`.
Lean's `induction` tactic splits the proof into:

- a base case, usually `0`
- an inductive step, where you may assume the statement for `n`

This lesson also defines a small recursive function so you can see how recursion
and induction fit together.
-/

namespace LeanMath.Introduction

-- We define `double` recursively so we can later prove a theorem about it.
def double : Nat → Nat
  | 0 => 0
  | n + 1 => double n + 2

-- This theorem is already in the library as `Nat.zero_add`, but proving it manually
-- is a good first induction exercise.
theorem zeroAddManual (n : Nat) : 0 + n = n := by
  induction n with
  | zero =>
      rfl
  | succ n ih =>
      rw [Nat.add_succ, ih]

-- The inductive hypothesis reduces the recursive call to ordinary arithmetic.
theorem doubleEqAddSelf (n : Nat) : double n = n + n := by
  induction n with
  | zero =>
      rfl
  | succ n ih =>
      rw [double, ih]
      omega

-- Exercise: once you trust the custom proof, compare it with the library theorem.
example (n : Nat) : 0 + n = n := by
  exact zeroAddManual n

end LeanMath.Introduction
