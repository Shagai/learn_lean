# Lesson 1 Notes: proofs as programs

This companion note unpacks the proofs in [Lesson01_ProofsAsPrograms.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson01_ProofsAsPrograms.lean). Read the Lean file first, then use these notes to translate each tactic into ordinary mathematical language.

## Example 1: applying an implication

Statement: from `hP : P` and `hPQ : P -> Q`, prove `Q`.

- A proof of `P -> Q` behaves like a function: it turns any proof of `P` into a proof of `Q`.
- `hP` is exactly the input that `hPQ` needs.
- `exact hPQ hP` applies the implication to the known proof of `P`.

## Example 2: proving a conjunction

Statement: from `hP : P` and `hQ : Q`, prove `P /\ Q`.

- A conjunction has two fields, so Lean asks for two subproofs.
- `constructor` splits the goal `P /\ Q` into the two goals `P` and `Q`.
- `exact hP` solves the first subgoal, and `exact hQ` solves the second.

## Theorem `swapAnd`

Statement: prove `P /\ Q -> Q /\ P`.

- `intro h` assumes the conjunction `h : P /\ Q`.
- Now the goal is `Q /\ P`, so `constructor` again splits the goal into two pieces.
- `h.right` is Lean's name for the proof of `Q` stored in the conjunction.
- `h.left` is the proof of `P`.
- The theorem says that once you know both `P` and `Q`, you may present them in the opposite order.

## Three versions of the same `Q /\ P` proof

The next three examples all prove the same statement:

```text
from hP : P and hQ : Q, prove Q /\ P
```

They differ only in syntax.

### Version 1: `constructor`

- `constructor` breaks `Q /\ P` into two goals.
- `exact hQ` proves `Q`.
- `exact hP` proves `P`.

### Version 2: `And.intro`

- `And.intro` is the constructor for conjunctions.
- `exact And.intro hQ hP` directly builds a proof of `Q /\ P`.
- This is the same mathematical content as the previous proof, written as one term instead of several tactic steps.

### Version 3: tuple notation

- `exact ⟨hQ, hP⟩` is Lean's compact notation for building the conjunction from its two parts.
- The angle-bracket notation is Lean's compact syntax for applying the constructor to both pieces.
- It is the shortest of the three, but it means exactly the same thing.

## Three versions of implication composition

The final three examples all prove:

```text
from hPQ : P -> Q and hQR : Q -> R, prove P -> R
```

This is just function composition in logical form.

### Version 1: tactic style

- `intro hP` assumes a proof of `P`, because the goal is an implication.
- `hPQ hP` gives a proof of `Q`.
- `hQR (hPQ hP)` turns that proof of `Q` into a proof of `R`.

### Version 2: anonymous function in tactic mode

- `exact fun hP => ...` says "the proof of `P -> R` is the function sending `hP` to a proof of `R`."
- Inside the function body, the same composition appears: `hQR (hPQ hP)`.

### Version 3: pure term style

- The last example removes the `by` block entirely and writes the proof term directly.
- It is still the same proof: assume `hP`, then pass it through `hPQ`, then through `hQR`.

The lesson's main point is that Lean proofs can be read both as tactic scripts and as explicit proof terms. The two views describe the same underlying object.
