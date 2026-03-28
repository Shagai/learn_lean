# Lesson 3 Notes: equality, rewriting, and simplification

This companion note explains the proofs in [Lesson03_EqualityRewritingSimp.lean](/Users/jorge/Projects/math/lean4/LeanMath/Introduction/Lesson03_EqualityRewritingSimp.lean). The lesson is about two everyday tools:

- `rw`, which replaces equals by equals
- `simp`, which carries out standard simplifications automatically

## Example 1: associativity by rewriting

Statement: prove `a + b + c = a + (b + c)`.

- The expression `a + b + c` is parsed as `(a + b) + c`.
- `Nat.add_assoc` is the associativity theorem for addition on natural numbers.
- `rw [Nat.add_assoc]` rewrites `(a + b) + c` into `a + (b + c)`.
- After the rewrite, both sides of the goal match exactly.

## Example 2: simplifying `a + 0`

Statement: prove `a + 0 = a`.

- `simp` knows many standard facts about natural numbers.
- One of those facts is that adding zero on the right does nothing.
- So `simp` transforms `a + 0` into `a` and the goal becomes reflexive.

## Example 3: rewriting with a hypothesis

Statement: from `h : a = b`, prove `a + a = b + b`.

- `rw [h]` tells Lean to replace `a` by `b` wherever that helps in the goal.
- The left-hand side `a + a` becomes `b + b`.
- The goal then reads `b + b = b + b`, which is immediate.

This illustrates the core use of equality: once two expressions are equal, one may be substituted for the other.

## Example 4: combining associativity and simplification

Statement: prove `(a + b) + c + 0 = a + (b + c)`.

- `simp [Nat.add_assoc]` tells Lean to simplify while also allowing the associativity theorem as a rewrite rule.
- First Lean reassociates the sum so that `(a + b) + c` becomes `a + (b + c)`.
- Then it simplifies the trailing `+ 0`.
- The result is exactly the right-hand side.

## Example 5: rewriting the other side of the equality

Statement: prove `a + (b + c) = a + b + c`.

- The right-hand side is parsed as `(a + b) + c`.
- `rw [Nat.add_assoc]` finds that right-hand subexpression and rewrites it to `a + (b + c)`.
- After the rewrite, both sides are the same.

The useful lesson here is that `rw` does not only rewrite the left side of the goal. It searches the goal for a matching expression and rewrites where it applies.
