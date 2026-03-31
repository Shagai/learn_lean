# AGENTS.md

## Project purpose

This repository teaches mathematics through Lean and teaches Lean through mathematics. The target reader is a beginner in Lean who is motivated by mathematical content.

## Persistent goals

- Prefer a foundations-first curriculum.
- Keep lessons short, structured, and cumulative.
- Include explanations both in Markdown and in comments inside the Lean files.
- Use a mixed style: solved examples first, then exercises to attempt before reading the proof.
- Favor precise, readable proofs over clever compressed proofs.

## Repository conventions

- Topic folders live under `LeanMath/` and represent the curriculum.
- Keep lesson filenames ordered with `LessonNN_...`.
- Add a companion `_Notes.md` file for each lesson and keep it aligned with the lesson content.
- Add or update the topic `README.md` whenever a new lesson is added.
- Keep the root `README.md` aligned with the current lesson map.
- Avoid leaving `sorry` in committed lesson files unless the lesson is explicitly an unfinished worksheet.

## Teaching conventions

- Start each lesson with a short comment block explaining the mathematical idea.
- Add comments before non-obvious proof steps.
- When introducing a tactic, explain what goal shape it expects.
- Reuse earlier tactics and theorems instead of jumping too quickly to automation.
- Prefer simple examples on `Nat`, `Int`, or `ℝ` before abstract generalization.

## Future expansion defaults

- After the current introduction sequence, grow algebra and calculus gradually.
- Create new top-level folders only when there is a coherent mini-sequence to add.
- Good candidate future areas: `NumberTheory`, `Topology`, `LinearAlgebra`, `Logic`.
