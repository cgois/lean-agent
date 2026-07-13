# Workflow

- Your goal is to prove the mathematical theorem in Statement.md completely.
- Assume, for this purpose, that a proof exists.
- Proceed according to instructions below, without skipping any phase.
- Do not even think of returning before *all* phases below have been completed.
- Public search may be used for literature background.
- Use `Worklog.md` to a *telegraphic* log of progress and the current status in case you need to backtrack.

## Phase 1: Formalize Statement.md

- Read `Statement.md` and identify every object needed for a precise formal statement.
- Write the statement as a Lean theorem in `./LeanProof/LeanProof/Problem.lean`.
- Do not silently weaken, specialize or replace the target theorem.

## Phase 2: Proof search

- Find a hand proof (unformalized) of the statement.
- Begin by generating a *diverse* set of approaches with substantially different formulations.
- Explore each approach *independently* (so that they do not converge to the same reduction).
- Maintain a registry of approaches in `HandProof.md`. 
- If an approach hits a dead end or a theorem-strength reduction, mark it as blocked and move on.
- A reduction or a partial proof are not acceptable.
- When you find a complete proof, register it in `HandProof.md` and move to the next phase.

## Phase 3: Lean formalization

- Formalize the hand proof in `./LeanProof/LeanProof/Problem.lean`.
- Use `mathlib` definitions, proofs and tactics; only write new ones if absolutely necessary.
- Do not overengineer or overly abstract the proof: the simplest and shorter the better. 
- Split the proof into verifiable steps and plan the formalization steps in advance.
- Focus on the critical steps first; build scaffolding only once the crucial parts stand.
- When the proof compiles with no `sorry`, `admit` or forbidden `axioms`, move to the next phase.

## Phase 4: Natural language proof

- Write the proof in `Proof.tex`.

This file should contain the sections:

- "Statement": state the main theorem that was proven.
- "Overview": explain the structure of the proof, stating important lemmas used and their role.
- "Proof": Complete proofs for each statement.
- "Discussion": Any important remarks (generalizations, related literature etc.)

Rules:

- The proofs and definitions must be self-contained and verifiable without the Lean code.
- Explain all arguments using standard mathematical presentation and consistent notation.
- Do not write from context, write from the formalization.
- Do not merely paraphrase Lean tactics; explain the argument in detail.
- Use standard terminology, any new jargon must be explained explicitly.
- Theorems from the literature can be stated without proof but must be referenced.