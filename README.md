# Lean Proof Assistant Example

This is an example usage of the template in the `main` branch, where the agent proves the simple statement:

```text
Let f : α → β and g : β → γ be injective functions.
Prove that g ∘ f is injective.
```

You can check the result by inspecting files below. With the exception of `Statement.md`, they were generated with no intervention by the agent:

- `Statement.md`: the theorem to be proven, written in ordinary mathematical language
- `ProofExplanation.md`: a proof in natural language extracted after the Lean formalization
- `Formalization.md`: the precise contract between the mathematics and the Lean statement
- `./LeanProof/LeanProof/Problem.lean`: the Lean code
- `PLANS.md`: short status and next-step file
- `Worklog.md`: concise iteration log
- `AGENTS.md`: workflow rules for the assistant
