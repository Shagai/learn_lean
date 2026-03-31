# Lesson 5 Notes: disjunction, `False`, and negation

This companion note explains the proofs in [Lesson05_OrFalseNegation.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson05_OrFalseNegation.lean). The central idea is that Lean treats each logical connective as a type with its own proof shape.

## Example 1: proving the left side of a disjunction

Statement: from `hP : P`, prove `P ∨ Q`.

- A proof of `P ∨ Q` must say which side is true.
- `left` tells Lean that we will prove the `P` branch.
- The remaining goal becomes just `P`.
- `exact hP` finishes the proof.

## Example 2: proving the right side of a disjunction

Statement: from `hQ : Q`, prove `P ∨ Q`.

- `right` chooses the second branch of the disjunction.
- After that choice, the goal is `Q`.
- `exact hQ` supplies the needed proof.

## Theorem `orComm`

Statement: prove `P ∨ Q → Q ∨ P`.

- `intro h` assumes a proof `h : P ∨ Q`.
- `cases h with` splits the argument into the two ways a disjunction can be built.

### First branch

- If `h` was built as `Or.inl hP`, then we know `hP : P`.
- The new goal is `Q ∨ P`.
- `right` chooses the `P` side, and `exact hP` closes it.

### Second branch

- If `h` was built as `Or.inr hQ`, then we know `hQ : Q`.
- Now `left` chooses the `Q` side of the goal `Q ∨ P`.
- `exact hQ` finishes the branch.

This is the standard elimination rule for `Or`: to use a disjunction, handle every possible case.

## Example 4: contradiction implies anything

Statement: from `hP : P` and `hnP : ¬ P`, prove `Q`.

- `¬ P` is shorthand for `P → False`.
- So `hnP hP` is a proof of `False`.
- The helper line names this contradiction as `hFalse`.
- `False.elim hFalse` tells Lean that once contradiction has been reached, any proposition follows.

## Example 5: proving a negation

Statement: prove `¬ (P ∧ ¬ P)`.

- To prove a negation, assume the statement being denied.
- `intro h` gives `h : P ∧ ¬ P`.
- From this conjunction, `h.1 : P` and `h.2 : ¬ P`.
- Applying `h.2` to `h.1` produces `False`.
- That is exactly what a proof of negation requires.

## Final exercise: proving `R` from `P ∨ Q`

Statement: given `h : P ∨ Q`, `hPR : P → R`, and `hQR : Q → R`, prove `R`.

- `cases h with` splits into the `P` branch and the `Q` branch.
- In the first branch, `hPR hP` proves `R`.
- In the second branch, `hQR hQ` proves `R`.

This pattern is often called proof by cases on a disjunction. It appears constantly in later mathematics.
