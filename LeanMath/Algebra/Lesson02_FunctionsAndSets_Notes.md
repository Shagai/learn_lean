# Algebra 2 Notes: functions and sets

This companion note explains the proofs in [Lesson02_FunctionsAndSets.lean](/Users/jorge/Projects/math/lean4/LeanMath/Algebra/Lesson02_FunctionsAndSets.lean). The main shift is that proofs about sets are often proofs about elements.

## Example 1: function composition

Statement: prove `(g ∘ f) x = g (f x)`.

- Function composition is defined so that `(g ∘ f) x` means exactly `g (f x)`.
- Because this is true by definition, `rfl` closes the goal immediately.

This is a good first reminder that some proofs are just unfolding a definition.

## Example 2: swapping the order in an intersection

Statement: prove `A ∩ B ⊆ B ∩ A`.

- To prove a subset relation, `intro x hx` picks an arbitrary element `x` and assumes `hx : x ∈ A ∩ B`.
- Membership in `A ∩ B` means two things at once: `x ∈ A` and `x ∈ B`.
- Lean stores those as `hx.1` and `hx.2`.
- The goal is `x ∈ B ∩ A`, so we must provide the pair of proofs in the opposite order.
- `exact ⟨hx.2, hx.1⟩` does exactly that.

This is the set-theoretic version of swapping a conjunction.

## Example 3: one set-builder subset inside another

Statement: prove `{n : Nat | n < 3} ⊆ {n : Nat | n < 5}`.

- `intro n hn` fixes an arbitrary natural number `n` with `hn : n < 3`.
- To show `n < 5`, it is enough to combine `n < 3` with the concrete inequality `3 < 5`.
- `have h35 : 3 < 5 := by decide` asks Lean to decide the finite arithmetic fact `3 < 5`.
- `exact lt_trans hn h35` uses transitivity of `<` to conclude `n < 5`.

This proof is a clean example of mixing a general theorem, `lt_trans`, with a small concrete fact, `3 < 5`.

## Example 4: preimages preserve inclusion

Statement: if `A ⊆ B`, prove `f ⁻¹' A ⊆ f ⁻¹' B`.

- `intro x hx` fixes an arbitrary real number `x` and assumes `hx : x ∈ f ⁻¹' A`.
- By definition of preimage, `hx` means `f x ∈ A`.
- The hypothesis `hAB : A ⊆ B` turns any proof of membership in `A` into a proof of membership in `B`.
- So `exact hAB hx` proves `f x ∈ B`, which is exactly `x ∈ f ⁻¹' B`.

The lesson is that many set proofs become straightforward once you translate inclusion into an elementwise statement.
