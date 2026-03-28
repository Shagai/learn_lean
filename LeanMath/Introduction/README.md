# Introduction

This topic builds the proof habits you need before moving into more mathematical libraries. The order matters: each lesson introduces a small amount of Lean syntax and a small amount of mathematics, then reuses it immediately.

## Learning goals

- Read propositions and hypotheses in Lean.
- Understand proofs as values of proposition types.
- Use `intro`, `constructor`, `exact`, `rw`, and `simp`.
- Recognize when a proof should use induction on `Nat`.

## Lesson order

Each lesson now has a companion `_Notes.md` file with a plain-language walkthrough of every proof block.

1. [Lesson01_ProofsAsPrograms.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson01_ProofsAsPrograms.lean) and [Lesson01_ProofsAsPrograms_Notes.md](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson01_ProofsAsPrograms_Notes.md)
2. [Lesson02_AndImplicationForallExists.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson02_AndImplicationForallExists.lean) and [Lesson02_AndImplicationForallExists_Notes.md](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson02_AndImplicationForallExists_Notes.md)
3. [Lesson03_EqualityRewritingSimp.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson03_EqualityRewritingSimp.lean) and [Lesson03_EqualityRewritingSimp_Notes.md](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson03_EqualityRewritingSimp_Notes.md)
4. [Lesson04_NaturalNumbersInduction.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson04_NaturalNumbersInduction.lean) and [Lesson04_NaturalNumbersInduction_Notes.md](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson04_NaturalNumbersInduction_Notes.md)

## How to study this folder

- Read comments before reading proofs.
- Pause at each exercise comment and try a proof from memory.
- If a proof works but feels opaque, rewrite it using more explicit steps.
- Use the companion `_Notes.md` file when you want a step-by-step explanation of why a proof works.
