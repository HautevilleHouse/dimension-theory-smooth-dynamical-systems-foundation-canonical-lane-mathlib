import DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean.EntropyTheory

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure NoncollapsingPackage {D : DynamicalSystemPackage}
    {E : EntropyTheoryPackage D} (Epkg : NoncollapsingDataPackage E) where
  scaleInvariantMeasureBound : Prop
  curvatureScaleControl : Prop
  blowupLimitNoncollapsed : Prop

structure NoncollapsingEvidence {D : DynamicalSystemPackage}
    {E : EntropyTheoryPackage D} {Epkg : NoncollapsingDataPackage E}
    (N : NoncollapsingPackage Epkg) where
  scaleInvariantMeasureBoundClosed : N.scaleInvariantMeasureBound
  curvatureScaleControlClosed : N.curvatureScaleControl
  blowupLimitNoncollapsedClosed : N.blowupLimitNoncollapsed

def NoncollapsingClosed {D : DynamicalSystemPackage}
    {E : EntropyTheoryPackage D} {Epkg : NoncollapsingDataPackage E}
    (N : NoncollapsingPackage Epkg) : Prop :=
  N.scaleInvariantMeasureBound ∧ N.curvatureScaleControl ∧ N.blowupLimitNoncollapsed

theorem noncollapsing_closed_from_evidence
    {D : DynamicalSystemPackage} {E : EntropyTheoryPackage D}
    {Epkg : NoncollapsingDataPackage E} (N : NoncollapsingPackage Epkg)
    (E2 : NoncollapsingEvidence N) : NoncollapsingClosed N := by
  exact And.intro E2.scaleInvariantMeasureBoundClosed
    (And.intro E2.curvatureScaleControlClosed E2.blowupLimitNoncollapsedClosed)

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse