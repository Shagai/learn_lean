import Mathlib

/-!
# Lesson 5: disjunction, `False`, and negation

This lesson adds the proof patterns for "either/or" and "not".
In Lean:

- `P ∨ Q` means that either `P` or `Q` holds.
- To prove `P ∨ Q`, use `left` or `right`.
- To use `h : P ∨ Q`, use `cases` because there are two possible branches.
- `False` is the empty proposition: once you have a proof of `False`, any goal follows.
- `¬ P` is notation for `P → False`.
-/

namespace LeanMath.Introduction

-- `left` proves the left side of a disjunction.
example (P Q : Prop) (hP : P) : P ∨ Q := by
  left
  exact hP

-- `right` proves the right side of a disjunction.
example (P Q : Prop) (hQ : Q) : P ∨ Q := by
  right
  exact hQ

-- `cases` expects data with several constructors, and `Or` has two:
-- either `Or.inl hP` or `Or.inr hQ`.
theorem orComm (P Q : Prop) : P ∨ Q → Q ∨ P := by
  intro h
  cases h with
  | inl hP =>
      right
      exact hP
  | inr hQ =>
      left
      exact hQ

-- `False.elim` closes any goal once a contradiction has been reached.
example (P Q : Prop) (hP : P) (hnP : ¬ P) : Q := by
  have hFalse : False := by
    exact hnP hP
  exact False.elim hFalse

-- To prove a negation `¬ P`, assume `P` and derive `False`.
example (P : Prop) : ¬ (P ∧ ¬ P) := by
  intro h
  exact h.2 h.1

-- Exercise: eliminate a disjunction by handling both branches separately.
example (P Q R : Prop) (h : P ∨ Q) (hPR : P → R) (hQR : Q → R) : R := by
  cases h with
  | inl hP =>
      exact hPR hP
  | inr hQ =>
      exact hQR hQ

end LeanMath.Introduction
