# Proof assistant

This is an AI assistant to prove mathematical theorems.

The idea is that __Lean serves as a verifier for the work of the agent__, to keep it from hallucinating.

The end result is a __natural language proof that can be verified by a human with no knowledge of Lean__.

(This README is for humans. The assistant workflow is defined in `AGENTS.md`.)

## Installation

To use this template you must have an AI assistant and a Lean installation configured.

### Lean

You need a working [Lean installation](https://lean-lang.org/install/manual/) that can be used from the terminal.

After installation, check that Lean works in your project by running from the Lean project root:

```bash
cd LeanProof
lake build
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

1. Start from a fresh clone of this repository.
2. Write the statement to be proven in `Statement.md`, specify all definitions unambiguously.
3. Start the assistant in the repository directory with e.g.:

```bash
codex "Read AGENTS.md and follow the specified workflow."
```

When the assistant finishes, you will have:

- A natural language proof written in `Proof.tex`.
- The Lean formalization in `./LeanProof/LeanProof/Problem.lean`.

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

You can check progress by inspecting `Worklog.md` and `HandProof.md`.

## Acknowledgments

This builds on ideas coming from several sources, including discussions with Jukka Suomela, the prompt for ["A Proof of the Cycle Double Cover Conjecture"](https://cdn.openai.com/pdf/04d1d1e4-bc75-476a-97cf-49055cd98d31/cdc_prompt.pdf), and ["Advancing Mathematics Research with AI-Driven Formal Proof Search"](https://arxiv.org/html/2605.22763v1).
