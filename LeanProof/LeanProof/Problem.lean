import Mathlib.Logic.Function.Basic

/-!
Main Lean development for the current theorem.
This file is kept aligned with `../../Formalization.md`.
-/

theorem injective_comp {α β γ : Type*} {f : α → β} {g : β → γ}
    (hf : Function.Injective f) (hg : Function.Injective g) :
    Function.Injective (g ∘ f) := by
  exact Function.Injective.comp hg hf
