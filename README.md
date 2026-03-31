# Lean Math Learning Project

This repository is a structured place to learn mathematics through Lean and learn Lean through mathematics. The material is organized as a curriculum, not just as isolated snippets, so you can read the explanations, inspect the code, and then try the exercises inside the lesson files.

## Project goals

- Learn proof-oriented Lean by writing small, precise proofs.
- Learn mathematics in a foundations-first order.
- Keep every lesson short enough to study in one sitting.
- Leave room for future expansion into more advanced topics.

## Current structure

- `LeanMath/Introduction/`: logic, propositions, equality, rewriting, induction, disjunction, negation, equivalence, parity, divisibility
- `LeanMath/Algebra/`: algebraic identities, functions, and sets
- `LeanMath/Calculus/`: first derivative and continuity examples
- `AGENTS.md`: project rules and goals for future iterations

Each topic folder also has a `README.md` with lesson order and prerequisites.
Every lesson also has a companion `_Notes.md` file that explains each proof in plain language.

## How to use the project

1. Open the repository in VS Code with the Lean 4 extension installed.
2. Install Lean from the official page: <https://lean-lang.org/install/>
3. In the repository root, run:

```sh
lake update
lake build
```

4. Start with [LeanMath/Introduction/README.md](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/README.md).
5. Read the comments in each `.lean` file and try the exercise blocks before reading the finished proof.
6. Use the matching `_Notes.md` file when you want a slower explanation of each proof step.

## Suggested study workflow

1. Read the lesson comments first.
2. Step through the Lean code in the editor.
3. Pause before each exercise and try to solve it yourself.
4. Compare your proof with the provided one.
5. Keep notes about which tactics or theorems felt unfamiliar.
6. If a finished proof still feels compressed, read the lesson's `_Notes.md` companion next to it.

## First lesson map

1. [Lesson 1](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson01_ProofsAsPrograms.lean): propositions, hypotheses, conjunction, with [notes](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson01_ProofsAsPrograms_Notes.md)
2. [Lesson 2](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson02_AndImplicationForallExists.lean): implication, `∀`, `∃`, with [notes](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson02_AndImplicationForallExists_Notes.md)
3. [Lesson 3](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson03_EqualityRewritingSimp.lean): equality, `rw`, `simp`, with [notes](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson03_EqualityRewritingSimp_Notes.md)
4. [Lesson 4](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson04_NaturalNumbersInduction.lean): induction on `Nat`, with [notes](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson04_NaturalNumbersInduction_Notes.md)
5. [Lesson 5](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson05_OrFalseNegation.lean): `∨`, `False`, `¬`, and contradiction, with [notes](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson05_OrFalseNegation_Notes.md)
6. [Lesson 6](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson06_IffAndByCases.lean): `↔` and `by_cases`, with [notes](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson06_IffAndByCases_Notes.md)
7. [Lesson 7](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson07_ParityAndDivisibility.lean): parity and divisibility on `Nat`, with [notes](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson07_ParityAndDivisibility_Notes.md)
8. [Algebra 1](/Users/jorge/Projects/math/lean4/LeanMath/Algebra/Lesson01_BasicIdentities.lean): algebraic laws and polynomial identities, with [notes](/Users/jorge/Projects/math/lean4/LeanMath/Algebra/Lesson01_BasicIdentities_Notes.md)
9. [Algebra 2](/Users/jorge/Projects/math/lean4/LeanMath/Algebra/Lesson02_FunctionsAndSets.lean): functions and basic set proofs, with [notes](/Users/jorge/Projects/math/lean4/LeanMath/Algebra/Lesson02_FunctionsAndSets_Notes.md)
10. [Calculus 1](/Users/jorge/Projects/math/lean4/LeanMath/Calculus/Lesson01_DerivativeOfPolynomials.lean): derivatives of `x^2` and `x^3`, with [notes](/Users/jorge/Projects/math/lean4/LeanMath/Calculus/Lesson01_DerivativeOfPolynomials_Notes.md)

## Extending the curriculum

Future iterations should add small lessons, keep topic order explicit, and add new top-level areas only when there is enough material to justify them. With the introduction bridge now covering `∨`, `¬`, `↔`, and proof by cases, the next recommended expansion is an algebra lesson on injective and surjective maps together with image and preimage proofs. After that, calculus can grow with a second lesson on the chain rule, and later branches can still include number theory, topology, and linear algebra.
