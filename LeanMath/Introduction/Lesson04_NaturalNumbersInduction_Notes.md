# Lesson 4 Notes: natural numbers and induction

This companion note explains the proofs in [Lesson04_NaturalNumbersInduction.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson04_NaturalNumbersInduction.lean). The theme is that recursive definitions and induction proofs fit together naturally on `Nat`.

## Definition `double`

The function

```lean
def double : Nat -> Nat
  | 0 => 0
  | n + 1 => double n + 2
```

is defined by recursion.

- At `0`, the value is `0`.
- At `n + 1`, Lean reduces the problem to the smaller input `n`.
- This recursive structure is why induction is the right proof method for later theorems about `double`.

## Theorem `zeroAddManual`

Statement: prove `0 + n = n` for every natural number `n`.

- `induction n with` splits the proof into a base case and an inductive step.

### Base case

- When `n = 0`, the goal is `0 + 0 = 0`.
- `rfl` closes the goal because both sides compute to the same expression.

### Inductive step

- Assume the inductive hypothesis `ih : 0 + n = n`.
- The new goal is `0 + (n + 1) = n + 1`.
- `rw [Nat.add_succ, ih]` does two things:
  - `Nat.add_succ` rewrites `0 + (n + 1)` as `(0 + n) + 1`
  - `ih` replaces `0 + n` by `n`
- The goal becomes `n + 1 = n + 1`, so the step is complete.

## Theorem `doubleEqAddSelf`

Statement: prove `double n = n + n` for every natural number `n`.

Again, `induction n with` is the right move because `double` itself was defined recursively.

### Base case

- When `n = 0`, the goal is `double 0 = 0 + 0`.
- Both sides reduce to `0`, so `rfl` works.

### Inductive step

- Assume `ih : double n = n + n`.
- The goal is `double (n + 1) = (n + 1) + (n + 1)`.
- `rw [double, ih]` unfolds the definition of `double` at `n + 1` and then replaces `double n` by `n + n`.
- After those rewrites, the goal is a purely arithmetic equality about natural numbers.
- `omega` finishes the arithmetic cleanup.

The structure of the proof is important: induction handles the recursion, and `omega` handles the numerical algebra left over at the end.

## Final example: reuse a theorem

Statement: prove `0 + n = n`.

- The earlier theorem `zeroAddManual n` already proves exactly this statement.
- `exact zeroAddManual n` simply reuses the established result.

This is a good habit in larger developments: once a proof has a clear name, prefer reusing it rather than reproving the same fact.
