# Formalization

## Status

`needs-clarification`

Allowed values: `needs-clarification`, `awaiting-approval`, `approved`, `in-proof`, `proved`.

---

## Agreed informal statement

Write the target theorem in precise natural language.

Template:

- **Statement:** [precise mathematical statement]
- **Scope:** [exact setting, domains, ambient structures, finiteness assumptions, etc.]
- **Conclusion:** [exact claim to be proved]
- **Excluded interpretations:** [nearby but incorrect readings that are not intended]

---

## Definitions and conventions

List every assumption, convention, and notation choice that matters for the meaning of the theorem.

Template:

1. **Objects and domains**
   - [object 1]&#58; [definition / type / ambient space]
   - [object 2]&#58; [definition / type / ambient space]

2. **Standing assumptions**
   - [assumption 1]
   - [assumption 2]

3. **Notation**
   - `[symbol / notation]` means [meaning]
   - `[symbol / notation]` means [meaning]

4. **Conventions**
   - [equality convention / coercion convention / indexing convention / orientation convention / finiteness convention / choice of representatives / etc.]

5. **Hidden assumptions made explicit**
   - [assumption that was implicit in the original statement]
   - [assumption that was implicit in the original statement]

---

## Lean encoding

For each informal object, record the exact Lean encoding that will be used.

| Informal object | Intended mathematical meaning | Lean object / definition | Reason this encoding is appropriate |
|---|---|---|---|
| [object 1] | [meaning] | `[Lean name / type / structure]` | [why this matches] |
| [object 2] | [meaning] | `[Lean name / type / structure]` | [why this matches] |
| [predicate / property] | [meaning] | `[Lean predicate / theorem / class]` | [why this matches] |

If several Lean encodings are plausible, record the alternatives here and explain why the chosen one is closest to the intended mathematics.

---

## Equivalence check

Explain line by line how the Lean theorem matches the agreed informal statement.

Template:

1. **Informal assumptions**
   - Informal assumption: [text]
   - Lean representation: `[Lean hypothesis / binder / typeclass assumption]`
   - Match assessment: [exact / conventional but equivalent]
   - Explanation: [why the Lean version captures exactly this assumption]

2. **Informal objects**
   - Informal object: [text]
   - Lean representation: `[Lean term / type / definition]`
   - Match assessment: [exact / conventional but equivalent]
   - Explanation: [why this is the same object mathematically]

3. **Conclusion**
   - Informal conclusion: [text]
   - Lean representation: `[Lean conclusion]`
   - Match assessment: [exact / conventional but equivalent]
   - Explanation: [why the Lean conclusion is the same claim]

4. **Overall theorem**
   - Lean theorem statement:
     ```lean
     -- paste the current target theorem statement from ./LeanProof/LeanProof/Problem.lean here
     ```
   - Overall equivalence assessment: [exact / not yet exact]
   - Remaining mismatch, if any: [describe precisely, or write `none`]

---

## Ambiguities resolved

Record every ambiguity found in `Statement.md` and how it was resolved.

Template:

1. **Ambiguity:** [text]
   - **Resolution:** [chosen interpretation]
   - **Basis:** [user answer / standard convention / explicitly recorded assumption]
   - **Effect on formalization:** [what changed in Lean or in the statement]

2. **Ambiguity:** [text]
   - **Resolution:** [chosen interpretation]
   - **Basis:** [user answer / standard convention / explicitly recorded assumption]
   - **Effect on formalization:** [what changed in Lean or in the statement]

If there are unresolved ambiguities, list them here and keep `Status` as `needs-clarification`.

---

## Changes requiring approval

List any change that is not a purely faithful transcription of the intended mathematics.

Examples include:
- strengthening,
- weakening,
- generalization,
- specialization,
- surrogate encoding,
- extra assumption.

Template:

- `none`

Or, if nonempty:

1. **Type of change:** [strengthening / weakening / generalization / specialization / surrogate encoding / extra assumption]
   - **Original intent:** [text]
   - **Proposed formalized version:** [text]
   - **Reason this arose:** [why exact transcription was difficult or impossible]
   - **Mathematical effect:** [what changes semantically]
   - **Approval needed:** yes

If this section is nonempty, set `Status` to `awaiting-approval` and do not enter the proof phase unless the user explicitly instructs otherwise.

---

## Current target theorem in Lean

Keep this synchronized with `./LeanProof/LeanProof/Problem.lean`.

```lean
-- paste the current target theorem statement exactly as it appears in ./LeanProof/LeanProof/Problem.lean
