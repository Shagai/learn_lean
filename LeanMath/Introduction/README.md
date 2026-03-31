# Introduction

This topic builds the proof habits you need before moving into algebra and calculus. The order matters: each lesson introduces a small amount of Lean syntax and a small amount of mathematics, then reuses it immediately.

## Learning goals

- Read propositions and hypotheses in Lean.
- Understand proofs as values of proposition types.
- Use `intro`, `constructor`, `cases`, `exact`, `rw`, `simp`, and `by_cases`.
- Recognize when a proof should use induction on `Nat`.
- Read and prove statements involving `∨`, `¬`, and `↔`.
- Use witnesses to express evenness, oddness, and divisibility on `Nat`.

## Lesson order

Each lesson now has a companion `_Notes.md` file with a plain-language walkthrough of every proof block.

1. [Lesson01_ProofsAsPrograms.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson01_ProofsAsPrograms.lean) and [Lesson01_ProofsAsPrograms_Notes.md](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson01_ProofsAsPrograms_Notes.md)
2. [Lesson02_AndImplicationForallExists.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson02_AndImplicationForallExists.lean) and [Lesson02_AndImplicationForallExists_Notes.md](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson02_AndImplicationForallExists_Notes.md)
3. [Lesson03_EqualityRewritingSimp.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson03_EqualityRewritingSimp.lean) and [Lesson03_EqualityRewritingSimp_Notes.md](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson03_EqualityRewritingSimp_Notes.md)
4. [Lesson04_NaturalNumbersInduction.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson04_NaturalNumbersInduction.lean) and [Lesson04_NaturalNumbersInduction_Notes.md](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson04_NaturalNumbersInduction_Notes.md)
5. [Lesson05_OrFalseNegation.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson05_OrFalseNegation.lean) and [Lesson05_OrFalseNegation_Notes.md](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson05_OrFalseNegation_Notes.md)
6. [Lesson06_IffAndByCases.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson06_IffAndByCases.lean) and [Lesson06_IffAndByCases_Notes.md](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson06_IffAndByCases_Notes.md)
7. [Lesson07_ParityAndDivisibility.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson07_ParityAndDivisibility.lean) and [Lesson07_ParityAndDivisibility_Notes.md](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson07_ParityAndDivisibility_Notes.md)

## How to study this folder

- Read comments before reading proofs.
- Pause at each exercise comment and try a proof from memory.
- If a proof works but feels opaque, rewrite it using more explicit steps.
- Use the companion `_Notes.md` file when you want a step-by-step explanation of why a proof works.
- Notice how Lessons 5-7 reuse `∃`, `cases`, and contradiction in concrete arithmetic settings before the curriculum moves outward again.
