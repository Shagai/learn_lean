import Mathlib

/-!
# Lesson 1: proofs as programs

Lean treats a proposition as a type and a proof as a value of that type.
The main skill in this lesson is reading a context:

- propositions such as `P Q : Prop`
- hypotheses such as `hP : P`
- goals such as `⊢ Q`

The examples are intentionally small. They are the atoms out of which longer proofs are built.
-/

namespace LeanMath.Introduction

-- If we know `P` and also know that `P` implies `Q`, then we can prove `Q`.
example (P Q : Prop) (hP : P) (hPQ : P → Q) : Q := by
  exact hPQ hP

-- To prove a conjunction, Lean asks for both pieces separately.
example (P Q : Prop) (hP : P) (hQ : Q) : P ∧ Q := by
  constructor
  · exact hP
  · exact hQ

-- A named theorem is useful when we want to reuse an idea later.
theorem swapAnd (P Q : Prop) : P ∧ Q → Q ∧ P := by
  intro h
  constructor
  · exact h.right
  · exact h.left

-- Exercise: try this before you unfold the proof term in your head.
example (P Q : Prop) (hP : P) (hQ : Q) : Q ∧ P := by
  constructor
  · exact hQ
  · exact hP

example (P Q : Prop) (hP : P) (hQ : Q) : Q ∧ P := by
  exact And.intro hQ hP

example (P Q : Prop) (hP : P) (hQ : Q) : Q ∧ P := by
  exact ⟨hQ, hP⟩

-- Exercise: composition of implications is just function composition.
example (P Q R : Prop) (hPQ : P → Q) (hQR : Q → R) : P → R := by
  intro hP
  exact hQR (hPQ hP)

example (P Q R : Prop) (hPQ : P → Q) (hQR : Q → R) : P → R := by
  exact fun hP => hQR (hPQ hP)

example (P Q R : Prop) (hPQ : P → Q) (hQR : Q → R) : P → R :=
  fun hP => hQR (hPQ hP)

end LeanMath.Introduction
