import Mathlib

/-!
# Lesson 3: equality, rewriting, and simplification

Equality is one of Lean's most useful tools because it lets us replace equals by equals.

- `rw [h]` rewrites using an equality `h`.
- `simp` uses a collection of standard simplification rules.

This lesson stays on natural numbers so the proof state stays easy to read.
-/

namespace LeanMath.Introduction

-- Associativity lets us change parentheses without changing the value.
example (a b c : Nat) : a + b + c = a + (b + c) := by
  rw [Nat.add_assoc]

-- `simp` knows many standard facts about `Nat`, including `a + 0 = a`.
example (a : Nat) : a + 0 = a := by
  simp

-- Rewriting an assumption changes the goal.
example (a b : Nat) (h : a = b) : a + a = b + b := by
  rw [h]

-- Several rewrites can be chained into one simplification step.
example (a b c : Nat) : (a + b) + c + 0 = a + (b + c) := by
  simp [Nat.add_assoc]

-- Exercise: use rewriting in the opposite direction.
example (a b c : Nat) : a + (b + c) = a + b + c := by
  rw [Nat.add_assoc]

end LeanMath.Introduction

