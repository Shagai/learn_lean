# Lesson 7 Notes: parity and divisibility

This companion note explains the proofs in [Lesson07_ParityAndDivisibility.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson07_ParityAndDivisibility.lean). The lesson turns logic into concrete arithmetic statements about natural numbers.

## Definitions `IsEven` and `IsOdd`

The lesson introduces two explicit predicates:

```lean
def IsEven (n : Nat) : Prop := ∃ k, n = 2 * k
def IsOdd (n : Nat) : Prop := ∃ k, n = 2 * k + 1
```

- `IsEven n` means that `n` is exactly twice some natural number.
- `IsOdd n` means that `n` is one more than an even number.
- Both definitions are existential statements, so proofs of parity naturally use witnesses.

## Example 1: proving `2 ∣ 2 * k`

Statement: prove that `2` divides `2 * k`.

- By definition, `2 ∣ 2 * k` means there exists some number `m` such that `2 * k = 2 * m`.
- Choosing `m = k` is the obvious witness.
- `refine ⟨k, ?_⟩` supplies that witness and leaves the equality goal.
- `rfl` closes the goal because both sides are identical.

## Example 2: proving `2 ∣ 14`

Statement: prove that `14` is divisible by `2`.

- Again we provide an explicit witness.
- `7` works because `14 = 2 * 7`.
- `norm_num` checks this numerical equality automatically.

## Theorem `isEven_iff_two_dvd`

Statement: prove `IsEven n ↔ 2 ∣ n`.

- `constructor` splits the equivalence into two implications.

### Forward direction

- Assume `h : IsEven n`.
- Unpack it with `rcases h with ⟨k, hk⟩`.
- Now `hk : n = 2 * k`.
- But this is exactly the witness data needed to prove `2 ∣ n`.
- So `exact ⟨k, hk⟩` finishes the direction.

### Reverse direction

- Assume `h : 2 ∣ n`.
- Unpack it in the same way to obtain `k` and `hk : n = 2 * k`.
- That witness proves `IsEven n` directly.

This theorem is useful because it shows that parity and divisibility are closely connected, and in Lean both are ultimately existential statements.

## Theorem `oddFive`

Statement: prove `IsOdd 5`.

- We need a witness `k` such that `5 = 2 * k + 1`.
- Choosing `k = 2` works.
- `norm_num` confirms the arithmetic identity.

## Example 5: proving `¬ IsEven 7`

Statement: prove that `7` is not even.

- To prove a negation, assume the opposite: `h : IsEven 7`.
- Unpack it as `⟨k, hk⟩`, where `hk : 7 = 2 * k`.
- This equation is impossible in natural numbers.
- `omega` finishes the arithmetic contradiction.

The logical structure is the same as before: assume the unwanted witness exists, then derive `False`.

## Final example: case split on divisibility

Statement: prove `2 ∣ n ∨ ¬ (2 ∣ n)`.

- `by_cases h : 2 ∣ n` creates two branches.
- In the first branch, `h` itself proves the left side.
- In the second branch, `h` is exactly a proof of the right side.

This is a clean example of case splitting on a concrete arithmetic proposition rather than on a bare abstract proposition.
