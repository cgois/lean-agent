# Formalization

## Status

`proved`

Allowed values: `needs-clarification`, `awaiting-approval`, `approved`, `in-proof`, `proved`.

---

## Agreed informal statement

- **Statement:** Let `f : α → β` and `g : β → γ` be injective functions between arbitrary types.
- **Scope:** `α`, `β`, and `γ` are arbitrary types, with no algebraic, order, finiteness, or nonemptiness assumptions.
- **Conclusion:** The composite function `g ∘ f : α → γ` is injective.
- **Excluded interpretations:** This is not a statement about surjectivity, bijectivity, or any stronger structure on the types.

---

## Definitions and conventions

1. **Objects and domains**
   - `α`, `β`, `γ`: arbitrary types.
   - `f`: a function from `α` to `β`.
   - `g`: a function from `β` to `γ`.

2. **Standing assumptions**
   - `f` is injective.
   - `g` is injective.

3. **Notation**
   - `g ∘ f` means function composition, so `(g ∘ f) x = g (f x)`.
   - `Function.Injective h` means `∀ ⦃x y⦄, h x = h y → x = y`.

4. **Conventions**
   - Equality is ordinary equality in the relevant type.
   - No extensionality principle beyond standard function application is needed.

5. **Hidden assumptions made explicit**
   - The statement quantifies universally over all inputs `x y : α`.
   - The theorem uses the standard convention that composition associates as a new function `α → γ`.

---

## Lean encoding

| Informal object | Intended mathematical meaning | Lean object / definition | Reason this encoding is appropriate |
|---|---|---|---|
| `α`, `β`, `γ` | arbitrary domains/codomain | `α β γ : Type*` | The statement is about arbitrary types with no extra structure. |
| `f` | function from `α` to `β` | `f : α → β` | Exact transcription of the informal function. |
| `g` | function from `β` to `γ` | `g : β → γ` | Exact transcription of the informal function. |
| “`f` is injective” | distinct inputs give distinct outputs | `Function.Injective f` | This is mathlib’s standard injectivity predicate. |
| “`g` is injective” | distinct inputs give distinct outputs | `Function.Injective g` | Same predicate for `g`. |
| “`g ∘ f` is injective” | the composite is injective | `Function.Injective (g ∘ f)` | Exact Lean expression for injectivity of the composite. |

The chosen encoding is the closest direct transcription of the mathematical statement; no surrogate encoding is needed.

---

## Equivalence check

1. **Informal assumptions**
   - Informal assumption: `f : α → β` is injective.
   - Lean representation: `(hf : Function.Injective f)`
   - Match assessment: exact
   - Explanation: This binder asserts exactly the usual definition of injectivity for `f`.
   - Informal assumption: `g : β → γ` is injective.
   - Lean representation: `(hg : Function.Injective g)`
   - Match assessment: exact
   - Explanation: This is the same injectivity condition for `g`.

2. **Informal objects**
   - Informal object: the functions `f` and `g`.
   - Lean representation: `{f : α → β} {g : β → γ}`
   - Match assessment: exact
   - Explanation: These are precisely functions with the stated domains and codomains.
   - Informal object: the composition `g ∘ f`.
   - Lean representation: `(g ∘ f)`
   - Match assessment: exact
   - Explanation: Lean’s composition notation matches the standard mathematical composition.

3. **Conclusion**
   - Informal conclusion: `g ∘ f` is injective.
   - Lean representation: `Function.Injective (g ∘ f)`
   - Match assessment: exact
   - Explanation: This states exactly that equality of composite outputs forces equality of inputs.

4. **Overall theorem**
   - Lean theorem statement:
     ```lean
     theorem injective_comp {α β γ : Type*} {f : α → β} {g : β → γ}
         (hf : Function.Injective f) (hg : Function.Injective g) :
         Function.Injective (g ∘ f) := by
       exact Function.Injective.comp hg hf
     ```
   - Overall equivalence assessment: exact
   - Remaining mismatch, if any: none

---

## Ambiguities resolved

1. **Ambiguity:** Whether the statement requires any structure on `α`, `β`, or `γ`.
   - **Resolution:** Treat all three as arbitrary types.
   - **Basis:** The informal statement mentions only functions and injectivity.
   - **Effect on formalization:** The theorem is quantified over `Type*` with no extra assumptions.

2. **Ambiguity:** Whether `g ∘ f` uses standard function composition order.
   - **Resolution:** Use the conventional meaning `(g ∘ f) x = g (f x)`.
   - **Basis:** Standard mathematical notation and Lean notation agree here.
   - **Effect on formalization:** The conclusion is `Function.Injective (g ∘ f)`.

There are no unresolved ambiguities.

---

## Changes requiring approval

- `none`

---

## Current target theorem in Lean

Keep this synchronized with `./LeanProof/LeanProof/Problem.lean`.

```lean
theorem injective_comp {α β γ : Type*} {f : α → β} {g : β → γ}
    (hf : Function.Injective f) (hg : Function.Injective g) :
    Function.Injective (g ∘ f) := by
  exact Function.Injective.comp hg hf
```
