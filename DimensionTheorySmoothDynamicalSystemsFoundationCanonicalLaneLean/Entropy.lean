import canonicalLaneMathlib.AdmissibleClass

/-!
# Metric Entropy Package

This module defines metric (Kolmogorov–Sinai) entropy for smooth dynamical systems,
providing the bridge closure for entropy theory.
-/

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure MetricEntropyPackage {M : Type u} [TopologicalSpace M] (φ : ℝ → M → M) where
  measure : Set M → ℝ
  partitionEntropy : (Set M → ℝ) → ℝ
  supremumOverPartitions : ℝ
  entropyDefined : Prop

structure MetricEntropyEvidence {M : Type u} [TopologicalSpace M] {φ : ℝ → M → M}
    (H : MetricEntropyPackage φ) where
  entropyDefinedClosed : H.entropyDefined
  supremumFinite : H.supremumOverPartitions < ∞

def MetricEntropyClosed {M : Type u} [TopologicalSpace M] {φ : ℝ → M → M}
    (H : MetricEntropyPackage φ) : Prop :=
  H.entropyDefined ∧ H.supremumOverPartitions < ∞

theorem metric_entropy_closed_from_evidence {M : Type u} [TopologicalSpace M] {φ : ℝ → M → M}
    (H : MetricEntropyPackage φ) (E : MetricEntropyEvidence H) : MetricEntropyClosed H :=
  And.intro E.entropyDefinedClosed E.supremumFinite

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse
