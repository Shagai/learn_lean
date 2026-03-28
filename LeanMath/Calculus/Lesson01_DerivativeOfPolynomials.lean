import Mathlib

/-!
# Calculus 1: derivatives of simple polynomials

This lesson starts with the concrete function `x ↦ x^2`. In `mathlib`, two common ways
to talk about derivatives are:

- `HasDerivAt f f' x`, meaning "`f` has derivative `f'` at `x`"
- `deriv f x`, the derivative value extracted as a function

The first theorem below uses the library power rule directly. The second proves the
same derivative by combining the derivative of the identity function with the product rule.
-/

namespace LeanMath.Calculus

theorem derivSquare (x : ℝ) : deriv (fun y : ℝ => y ^ 2) x = 2 * x := by
  rw [deriv_pow_field (𝕜 := ℝ) (x := x) 2]
  simp

theorem hasDerivAtSquareManual (x : ℝ) :
    HasDerivAt (fun y : ℝ => y ^ 2) (2 * x) x := by
  simpa [pow_two, two_mul, one_mul, mul_one] using
    (hasDerivAt_id x).mul (hasDerivAt_id x)

theorem squareContinuousAt (x : ℝ) : ContinuousAt (fun y : ℝ => y ^ 2) x := by
  exact (hasDerivAtSquareManual x).continuousAt

-- Exercise: compare this proof with `derivSquare`.
example (x : ℝ) : deriv (fun y : ℝ => y ^ 3) x = 3 * x ^ 2 := by
  rw [deriv_pow_field (𝕜 := ℝ) (x := x) 3]
  norm_num

end LeanMath.Calculus
