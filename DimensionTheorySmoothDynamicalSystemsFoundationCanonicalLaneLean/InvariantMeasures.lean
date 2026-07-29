import canonicalLaneMathlib.AdmissibleClass

/-!
# Invariant Measures Package

This module defines invariant measures for smooth dynamical systems on compact manifolds,
used as a bridge object in the admissible-class framework.
-/

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure InvariantMeasuresPackage {M : Type u} [TopologicalSpace M] (φ : ℝ → M → M) where
  borelMeasure : Set M → ℝ
  invarianceCondition : ∀ (t : ℝ) (s : Set M), borelMeasure (φ t '' s) = borelMeasure s
  normalization : borelMeasure Set.univ = 1

structure InvariantMeasuresEvidence {M : Type u} [TopologicalSpace M] {φ : ℝ → M → M}
    (P : InvariantMeasuresPackage φ) where
  invarianceClosed : P.invarianceCondition
  normalizationClosed : P.normalization

def InvariantMeasuresClosed {M : Type u} [TopologicalSpace M] {φ : ℝ → M → M}
    (P : InvariantMeasuresPackage φ) : Prop :=
  P.invarianceCondition ∧ P.normalization

theorem invariant_measures_closed_from_evidence {M : Type u} [TopologicalSpace M] {φ : ℝ → M → M}
    (P : InvariantMeasuresPackage φ) (E : InvariantMeasuresEvidence P) : InvariantMeasuresClosed P :=
  And.intro E.invarianceClosed E.normalizationClosed

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse
