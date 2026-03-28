# Lesson 2 Notes: implication, `forall`, and `exists`

This companion note explains the proofs in [Lesson02_AndImplicationForallExists.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson02_AndImplicationForallExists.lean). The central idea of this lesson is that `->`, `forall`, and `exists` each have a standard proof pattern in Lean.

## Example 1: implication

Statement: from `hPQ : P -> Q` and `hQR : Q -> R`, prove `P -> R`.

- To prove an implication, use `intro` to assume the input.
- After `intro hP`, the goal becomes `R`.
- `hPQ hP` gives a proof of `Q`.
- `hQR (hPQ hP)` turns that proof of `Q` into a proof of `R`.

This is the same composition pattern as in Lesson 1.

## Example 2: a universal statement

Statement: prove `forall n : Nat, n + 0 = n`.

- To prove a universal statement, choose an arbitrary value.
- `intro n` tells Lean to fix an arbitrary natural number `n`.
- The remaining goal is `n + 0 = n`.
- `simp` knows the standard fact that adding zero on the right does not change a natural number, so it closes the goal.

## Example 3: an existential statement

Statement: prove `exists n : Nat, n + 1 = 3`.

- To prove an existential statement, you must provide a witness.
- `refine ⟨2, ?_⟩` says: use `2` as the witness and leave a new subgoal for the proof that it works.
- The remaining goal becomes `2 + 1 = 3`.
- `norm_num` proves that arithmetic fact.

The important habit is constructive: do not only say that something exists, actually show one value that works.

## Example 4: from `forall` to `exists`

Statement: from `h : forall n : Nat, P n`, prove `exists n : Nat, P n`.

- The hypothesis `h` says that `P n` is true for every natural number `n`.
- If something is true for every natural number, then it is true for at least one natural number.
- `refine ⟨0, ?_⟩` chooses `0` as the witness.
- The remaining goal is `P 0`.
- `exact h 0` works because `h` may be applied to any natural number, including `0`.

The witness `0` is not special here. Any natural number would have worked.

## Example 5: unpack one existential and build another

Statement: from `h : exists n : Nat, n = 2`, prove `exists m : Nat, m + 1 = 3`.

- `rcases h with ⟨n, hn⟩` unpacks the existential hypothesis.
- After this line, you have a concrete natural number `n` and a proof `hn : n = 2`.
- `refine ⟨n, ?_⟩` chooses that same `n` as the witness for the new existential goal.
- The remaining goal is `n + 1 = 3`.
- `rw [hn]` replaces `n` by `2`, so the goal becomes `2 + 1 = 3`.
- Lean can then finish because that equality computes to a true numerical identity.

This is the elimination pattern for existential statements: take a hidden witness out of the hypothesis, then use it in the proof.
