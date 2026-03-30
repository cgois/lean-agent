# Lean Proof Assistant

This is an AI assistant to create proofs of math statements in both Lean and natural language.

The idea is that __Lean serves as a verifier for the work of the agent__, to keep it from hallucinating.

The end result is a __natural language proof that can be verified by a human with no knowledge of Lean__.

(This README is for humans. The assistant workflow is defined in `AGENTS.md`.)

## Installation

To use this template you must have an AI assistant and a Lean installation configured.

### Lean

You need a working [Lean installation](https://lean-lang.org/install/manual/) that can be used from the terminal.

After installation, check that Lean works in your project by running from the Lean project root:

```bash
cd LeanProof && lake build
```

### AI assistant

Whatever assistant you use, it should be able to:

- read and edit files in this repository,
- run terminal commands in the repository root,
- run Lean/Lake commands such as `cd LeanProof && lake build`,
- inspect compiler output and iterate on errors.

#### Recommended assistants

- [Codex](https://developers.openai.com/codex/cli)
- [Claude](https://code.claude.com/docs/en/quickstart)
- [Leanstral](https://mistral.ai/news/leanstral)

(You may want to install the agent in a separate user, a container or a virtual machine.)

## Usage

For each new theorem, it is usually best to start from a fresh Git branch or a fresh copy of the template.

In normal use, you only need to edit `Statement.md`.
The other working files are mainly produced and maintained by the assistant during the formalization and proof process.

To start working on a theorem:

1. Write your mathematical statement in `Statement.md`. Be as precise as possible.
2. Start the assistant in the repository directory with:

```bash
codex "Read AGENTS.md and Statement.md and follow the specified workflow."
```

The assistant will ask clarification questions if the statement is ambiguous.
Once you agree on the statement, review `Formalization.md` carefully and approve it.

After approval, the assistant should continue by working on `./LeanProof/LeanProof/Problem.lean`.
If the process is interrupted, you can restart it by asking the assistant to inspect the current files and continue from the current state.

When the assistant finishes, you should:

- check that `cd LeanProof && lake build` succeeds,
- review `Formalization.md` to make sure it still matches the intended theorem,
- review the human-readable proof explanation in `ProofExplanation.md` and ask the assistant to improve it if needed.

An example run is provided in the branch `example`.

### Notes

- Do not start proof search if the statement is still ambiguous.
- Review `Formalization.md` carefully: the most serious mistakes usually happen there, not in Lean syntax.
- For nontrivial work, it is often better to keep one main theorem per branch or repository.

### Example statements

*A good statement:*

```text
Let f : α → β and g : β → γ be injective functions.
Prove that g ∘ f is injective.
```

- the ambient objects are explicit,
- the hypotheses are explicit,
- the target claim is explicit.

*An ambiguous statement:*

```text
Prove that the closure of a convex set is convex.
```

- closure in which topology?
- are we working in a real topological vector space, normed space, or something else?

### File structure

You can check progress by inspecting the following files which will be updated by the agent as needed:

- `Statement.md`: your theorem in ordinary mathematical language
- `ProofExplanation.md`: a natural language version of the proof created after the Lean formalization
- `Formalization.md`: the precise contract between the mathematics and the Lean statement
- `./LeanProof/LeanProof/Problem.lean`: the Lean code
- `PLANS.md`: short status and next-step file
- `Worklog.md`: concise iteration log
- `AGENTS.md`: workflow rules for the assistant

## Acknowledgments

This builds on ideas coming from discussions with Jukka Suomela.
