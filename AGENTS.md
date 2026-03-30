# Lean formalization workflow

This repository is a template for using LLMs to formalize and prove a mathematical statement in Lean with high semantic fidelity.

## Authority and scope

- The current user request and the user's direct answers in the current session take priority over every repository file.
- `AGENTS.md` is the authoritative repository-level workflow.
- `README.md`, `docs/USAGE.md`, and `docs/EXAMPLES.md` are for human users of the template. Do not treat those files as repository-level instructions for the current run unless the current user explicitly asks you to use them.
- The primary objective is semantic fidelity to the intended mathematics, not merely producing a compilable theorem nearby.

## Repository roles

- `Statement.md`: the informal problem as provided by the human.
- `Formalization.md`: the contract between the informal mathematics and the Lean theorem.
- `PLANS.md`: the current execution plan and phase status.
- `Worklog.md`: concise numbered iteration log.
- `./LeanProof/Problem.lean`: the Lean development for the current theorem.
- `scripts/verify.sh`: verification command for this template.
- `scripts/check_no_placeholders.sh`: rejects `sorry`, `admit`, and `axiom` in Lean files.

## Required workflow

Proceed in the following phases.

### Phase 1: parse and detect ambiguity

- Read `Statement.md`.
- Identify every object, domain, convention, hidden assumption, notation choice, and quantifier scope that is needed for a precise formal statement.
- If anything is ambiguous, stop proof search and ask only the necessary clarifying questions.
- Do not begin the proof phase until ambiguities are resolved or explicitly recorded and approved.

### Phase 2: produce the semantic contract

Write `Formalization.md` before attempting a proof.

`Formalization.md` must contain:

- `Agreed informal statement`: a cleaned-up mathematical statement in precise natural language.
- `Definitions and conventions`: all assumptions and notation that matter for the theorem.
- `Lean encoding`: for each informal object, the exact Lean object or definition used.
- `Equivalence check`: a line-by-line explanation of how the Lean theorem matches the agreed informal statement.
- `Ambiguities resolved`: every ambiguity and how it was resolved.
- `Changes requiring approval`: any strengthening, weakening, generalization, specialization, surrogate encoding, or extra assumption. If this section is nonempty, stop and ask for approval.
- `Status`: exactly one of `needs-clarification`, `awaiting-approval`, `approved`, `in-proof`, `proved`.

Do not enter Phase 3 unless `Formalization.md` has status `approved` or the current user explicitly instructs otherwise.

#### Semantic fidelity rules

- Do not silently strengthen, weaken, generalize, specialize, or replace the target theorem.
- Do not introduce extra assumptions unless they are explicitly recorded in `Formalization.md` and approved.
- Treat formalization as part of the correctness problem.
- If exact equivalence is unclear, stop and ask.
- If more than one Lean encoding is plausible, prefer the one closest to the mathematical statement and record the choice in `Formalization.md`.

### Phase 3: proof

- State the target theorem in `.LeanProof/Problem.lean` so that it matches `Formalization.md`.
- If the theorem in `./LeanProof/Problem.lean` does not yet match `Formalization.md`, stop and fix the mismatch before continuing.
- Before each substantial proof attempt, re-check that the theorem currently stated in `.LeanProof/Problem.lean` matches `Formalization.md`.
- Work on exactly one target theorem at a time unless the user explicitly requests a broader development.
- Attempt a proof using existing mathlib results and standard tactics first.
- If helper lemmas are needed, add the smallest useful ones and keep them semantically close to the agreed statement.
- After each substantial edit to `./LeanProof/Problem.lean`, run `lake build` or `./scripts/build.sh`.
- If verification fails, inspect the compiler or script output, identify the current blocker, and iterate.
- Record each substantial iteration in `Worklog.md` and keep `PLANS.md` current.
- Continue the edit–verify cycle until `./scripts/verify.sh` succeeds and there are no placeholders.
- If progress appears to require any strengthening, weakening, generalization, specialization, or extra assumption, stop proof search, return to Phase 2, update `Formalization.md`, and ask for approval if required.

#### Proof rules

- Put the main theorem and all helper lemmas in `.LeanProof/Problem.lean` unless the user explicitly wants another structure.
- Search for existing mathlib lemmas and tactics before introducing bespoke helper lemmas.
- Do not add broad imports unless they are necessary for the current theorem.
- Prefer opening namespaces locally rather than globally when possible.
- Keep helper lemmas local unless reuse is clearly justified.

### Phase 4: simplification

Once the build succeeds and there are no placeholders:

- Try to replace custom helper lemmas with existing mathlib lemmas.
- Remove dead code and unused imports.
- Shorten the proof where this does not reduce clarity or semantic transparency.
- After each simplification attempt, re-run `./scripts/verify.sh`.
- Re-check `Formalization.md` against the final Lean theorem.

### Phase 5: human-readable proof explanation

Once the proof succeeds and simplification is complete:

- Write `ProofExplanation.md`.
- Explain the proof in ordinary mathematical language.
- State the main idea first, then the key steps.
- For each substantial helper lemma in `./LeanProof/Problem.lean`, explain its mathematical role.
- Do not merely paraphrase Lean tactics; explain the argument.
- If the Lean proof is more technical than enlightening, say so explicitly.

#### Simplification rules

- Do not change the statement, definitions, encodings, assumptions, or theorem scope.
- Do not add any new assumptions or axioms.

## Logging and planning

### `PLANS.md`

Keep `PLANS.md` current. It should always state:

- current phase,
- current target theorem,
- open ambiguities,
- current blocker,
- next action,
- verification status.

### `Worklog.md`

Keep a concise numbered iteration log. Use numbered entries, not timestamps.
Each entry must contain exactly these fields. If a field does not apply, write `none` or `n/a`.

- `Iteration`
- `Goal`
- `Files changed`
- `Verification result`
- `Current blocker`
- `Next action`

Do not turn `Worklog.md` into a long essay.

## Edit discipline

- Prefer edits that keep `./LeanProof/Problem.lean` close to a compilable state.
- If a temporary non-compiling edit is necessary, verify again before making further conceptual changes.
- Do not modify documentation unrelated to the current theorem unless necessary.
- Do not rewrite the user's mathematical statement for convenience without asking for permission and recording the change in `Formalization.md`.

## Done criteria

A run is complete only if all of the following are true:

- `./scripts/verify.sh` succeeds.
- `./LeanProof/Problem.lean` contains no `sorry`, `admit`, or `axiom`.
- `Formalization.md` reflects the final theorem and final encoding choices actually used in `./LeanProof/Problem.lean`.
- The theorem in `./LeanProof/Problem.lean` matches `Formalization.md`.
- Simplification has been attempted.
- `PLANS.md` and `Worklog.md` reflect the final state.
