import Mathlib

/-!
# Algebra 1: basic identities

At this stage the main new idea is that Lean's algebraic theorems can be used
at two levels:

- concretely, on familiar number systems such as `ℤ` and `ℝ`
- abstractly, on any type carrying the right algebraic structure

This is one of the ways Lean clarifies mathematics: the assumptions are always visible.
-/

namespace LeanMath.Algebra

section AbstractSemiring

variable {R : Type*} [Semiring R]
variable (a b c : R)

-- `mul_add` is left distributivity: it expands a product when the sum is on the right,
-- so it matches expressions of the form `a * (b + c)`.
-- Distributivity is not special to integers or reals. It belongs to every semiring.
example : a * (b + c) = a * b + a * c := by
  simp [mul_add]

end AbstractSemiring

section ConcreteExamples

-- Associativity on integers looks exactly like the algebra fact you already know.
example (a b c : ℤ) : (a + b) + c = a + (b + c) := by
  simp [add_assoc]

-- `ring` is useful for polynomial identities over commutative semirings and fields.
example (x y : ℝ) : (x + y) ^ 2 = x ^ 2 + 2 * x * y + y ^ 2 := by
  ring

-- `add_mul` is right distributivity: it expands a product when the sum is on the left,
-- so it matches expressions of the form `(a + b) * c`.
-- Exercise: prove the right distributive law in a concrete ring.
example (a b c : ℤ) : (a + b) * c = a * c + b * c := by
  simp [add_mul]

end ConcreteExamples

end LeanMath.Algebra
