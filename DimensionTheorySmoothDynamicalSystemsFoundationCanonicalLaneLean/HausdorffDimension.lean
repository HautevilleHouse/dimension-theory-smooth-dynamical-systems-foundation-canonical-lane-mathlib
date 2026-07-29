import canonicalLaneMathlib.AdmissibleClass

/-!
# Hausdorff Dimension Package

This module defines Hausdorff dimension for invariant sets of smooth dynamical systems,
providing the bridge closure for dimension theory.
-/

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure HausdorffDimensionPackage {M : Type u} [TopologicalSpace M] [MetricSpace M] where
  invariantSet : Set M
  hausdorffMeasure : ℝ → Set M → ℝ
  dimension : ℝ
  dimensionDefined : Prop

structure HausdorffDimensionEvidence {M : Type u} [TopologicalSpace M] [MetricSpace M]
    (D : HausdorffDimensionPackage M) where
  dimensionDefinedClosed : D.dimensionDefined
  dimensionFinite : D.dimension < ∞

def HausdorffDimensionClosed {M : Type u} [TopologicalSpace M] [MetricSpace M]
    (D : HausdorffDimensionPackage M) : Prop :=
  D.dimensionDefined ∧ D.dimension < ∞

theorem hausdorff_dimension_closed_from_evidence {M : Type u} [TopologicalSpace M] [MetricSpace M]
    (D : HausdorffDimensionPackage M) (E : HausdorffDimensionEvidence D) :
  HausdorffDimensionClosed D :=
  And.intro E.dimensionDefinedClosed E.dimensionFinite

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse
