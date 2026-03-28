# Calculus 1 Notes: derivatives of simple polynomials

This companion note explains the proofs in [Lesson01_DerivativeOfPolynomials.lean](/Users/jorge/Projects/math/lean4/LeanMath/Calculus/Lesson01_DerivativeOfPolynomials.lean). The lesson shows two styles of derivative proof:

- applying a library theorem directly
- assembling the derivative from simpler pieces by hand

## Theorem `derivSquare`

Statement: prove `deriv (fun y : ℝ => y ^ 2) x = 2 * x`.

- `deriv_pow_field` is the library power rule for the derivative of `y ^ n`.
- `rw [deriv_pow_field (𝕜 := ℝ) (x := x) 2]` applies that rule to the square function over the reals.
- After rewriting, the goal becomes a simpler algebraic identity.
- `simp` finishes the cleanup.

The important point is that the heavy calculus step is delegated to the library theorem.

## Theorem `hasDerivAtSquareManual`

Statement: prove directly that `fun y : ℝ => y ^ 2` has derivative `2 * x` at `x`.

- `hasDerivAt_id x` says that the identity function has derivative `1` at `x`.
- Multiplying that theorem by itself with `.mul` uses the product rule.
- So Lean obtains a derivative statement for `fun y => y * y`.
- The expression in the theorem is written as `y ^ 2`, so `simpa [pow_two, two_mul, one_mul, mul_one]` rewrites the product-rule result into the desired form `2 * x`.

This proof is longer than `derivSquare`, but it teaches where the derivative formula comes from.

## Theorem `squareContinuousAt`

Statement: prove that `fun y => y ^ 2` is continuous at `x`.

- A standard theorem in analysis says that differentiability at a point implies continuity at that point.
- `hasDerivAtSquareManual x` gives the differentiability statement.
- Appending `.continuousAt` extracts the continuity conclusion.

So this theorem is an example of reusing one result to get another with almost no extra work.

## Final example: the derivative of `x^3`

Statement: prove `deriv (fun y : ℝ => y ^ 3) x = 3 * x ^ 2`.

- The proof mirrors `derivSquare`.
- `rw [deriv_pow_field (𝕜 := ℝ) (x := x) 3]` applies the power rule.
- `norm_num` simplifies the numerical part of the resulting expression and leaves exactly `3 * x ^ 2`.

This is a good comparison exercise: once you understand the square case, the cube case follows the same template.
