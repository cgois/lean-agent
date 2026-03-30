# Proof explanation

## Statement

If `f : α → β` and `g : β → γ` are injective functions, then their composite `g ∘ f : α → γ` is injective.

## Main idea

To show `g ∘ f` is injective, assume `(g ∘ f) x = (g ∘ f) y`. Since `g` is injective, this implies `f x = f y`. Since `f` is injective, this further implies `x = y`.

## Proof structure

1. Start from an equality of outputs under the composite function.
2. Cancel `g` using injectivity of `g`.
3. Cancel `f` using injectivity of `f`.

## Key lemmas and their role

- **`Function.Injective.comp`**: this mathlib lemma states exactly that the composition of injective functions is injective, so it encapsulates the whole argument directly.

## Proof in ordinary language

Take any `x, y : α` and suppose that `g (f x) = g (f y)`. Because `g` is injective, applying the definition of injectivity gives `f x = f y`. Because `f` is injective, applying injectivity again gives `x = y`. This proves that equal outputs under `g ∘ f` come from equal inputs, so `g ∘ f` is injective.

## Relation to the Lean development

- Main theorem in Lean: `injective_comp`
- Important helper lemmas: none
- Parts of the Lean proof that are technically convenient rather than mathematically illuminating: the final Lean proof is a one-line application of `Function.Injective.comp`, which packages the argument above.

## Caveats

- none
