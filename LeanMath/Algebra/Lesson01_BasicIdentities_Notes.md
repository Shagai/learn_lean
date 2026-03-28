# Algebra 1 Notes: basic identities

This companion note explains the proofs in [Lesson01_BasicIdentities.lean](/Users/jorge/Projects/math/lean4/LeanMath/Algebra/Lesson01_BasicIdentities.lean). The lesson contrasts two styles:

- abstract proofs that work in any structure with the right axioms
- concrete proofs in familiar number systems such as `ℤ` and `ℝ`

## `mul_add` versus `add_mul`

These two names are easy to mix up, so it helps to read them by the shape of the left-hand side.

- `mul_add` matches `a * (b + c)`. The multiplication comes first in the name because the outside operation on the left is multiplication.
- `add_mul` matches `(a + b) * c`. The addition comes first in the name because the outside operation on the left is addition.
- So `mul_add` distributes over a sum on the right, while `add_mul` distributes over a sum on the left.

In ordinary algebra, both are distributive laws. In Lean, the different names tell you which side of the product contains the sum you want to expand.

## Example 1: distributivity in an abstract semiring

Statement: prove `a * (b + c) = a * b + a * c` for any semiring `R`.

- The typeclass assumption `[Semiring R]` tells Lean that distributivity is available for `R`.
- `mul_add` is the distributive law in that abstract setting.
- `simp [mul_add]` rewrites the left-hand side using that theorem and closes the goal.

This example matters because the proof is not about a specific number system. It works uniformly in every semiring.

## Example 2: associativity on integers

Statement: prove `(a + b) + c = a + (b + c)` for integers.

- `add_assoc` is the associativity theorem for addition.
- `simp [add_assoc]` rewrites the expression into the required form.
- Even though the variables are integers here, the idea is the same as in the natural-number version from the introduction folder.

## Example 3: expanding a square over the reals

Statement: prove `(x + y) ^ 2 = x ^ 2 + 2 * x * y + y ^ 2`.

- This is a polynomial identity.
- `ring` is designed for exactly this kind of goal.
- It expands both sides and checks that they are algebraically equal in a commutative semiring or field.

The proof is short because the library tactic knows the algebraic normal form computation.

## Example 4: right distributivity in a concrete ring

Statement: prove `(a + b) * c = a * c + b * c` for integers.

- `add_mul` is the theorem expressing right distributivity.
- `simp [add_mul]` rewrites the left-hand side into the right-hand side.
- Compared with the first example, this one is concrete: the variables live in `ℤ`, not in an arbitrary semiring.
