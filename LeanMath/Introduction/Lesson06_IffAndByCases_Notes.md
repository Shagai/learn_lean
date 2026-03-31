# Lesson 6 Notes: equivalence and proof by cases

This companion note explains the proofs in [Lesson06_IffAndByCases.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson06_IffAndByCases.lean). The lesson introduces two common ideas:

- an equivalence `P ↔ Q`, which means both `P → Q` and `Q → P`
- case splitting with `by_cases`

## Theorem `andCommIff`

Statement: prove `(P ∧ Q) ↔ (Q ∧ P)`.

- `constructor` on an `↔` goal splits the proof into two implication goals.

### Forward direction

- Assume `h : P ∧ Q`.
- Then `h.1 : P` and `h.2 : Q`.
- The target is `Q ∧ P`.
- `exact ⟨h.2, h.1⟩` builds that conjunction in the swapped order.

### Reverse direction

- Assume `h : Q ∧ P`.
- Now `h.1 : Q` and `h.2 : P`.
- The goal is `P ∧ Q`.
- `exact ⟨h.2, h.1⟩` swaps the pieces again.

This shows the general pattern for `↔`: prove each implication one at a time.

## Example 2: using the forward direction of an equivalence

Statement: from `h : P ↔ Q` and `hP : P`, prove `Q`.

- `h.mp` means "modus ponens for the forward direction".
- So `h.mp hP` turns a proof of `P` into a proof of `Q`.

## Example 3: using the reverse direction of an equivalence

Statement: from `h : P ↔ Q` and `hQ : Q`, prove `P`.

- `h.mpr` extracts the reverse implication `Q → P`.
- Applying it to `hQ` proves `P`.

## Theorem `orSelf`

Statement: prove `P ∨ P ↔ P`.

- Again `constructor` splits the `↔`.

### From `P ∨ P` to `P`

- `intro h` assumes the disjunction.
- `cases h with` splits the proof into the left and right branch.
- In either branch, the hypothesis is a proof of `P`, so the result is immediate.

### From `P` to `P ∨ P`

- `intro hP` assumes `P`.
- `left` chooses the first side of the disjunction.
- `exact hP` supplies the proof.

## Example 5: splitting on whether `n = 0`

Statement: prove `n = 0 ∨ 0 < n`.

- `by_cases h : n = 0` creates two goals.
- In the first branch, `h : n = 0`, so the left side of the disjunction is true.
- In the second branch, `h : n ≠ 0`.
- The theorem `Nat.pos_of_ne_zero h` converts nonzero into positivity.
- This finishes the right side `0 < n`.

This example is important because it shows that case analysis is not only for data like `Or`. It can also be used to split on a decidable proposition.

## Final exercise: reversing an equivalence

Statement: prove `(P ↔ Q) → (Q ↔ P)`.

- Assume `h : P ↔ Q`.
- Use `constructor` to build `Q ↔ P`.
- The forward direction of the new equivalence is `Q → P`, which is exactly `h.mpr`.
- The reverse direction is `P → Q`, which is exactly `h.mp`.

So reversing an equivalence simply swaps the two stored implications.
