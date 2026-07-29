import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean.SmoothDynamicalSystem

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure InvariantMeasure (S : SmoothDynamicalSystem) where
  measure : Type u
  measurableSpace : Prop
  invarianceProperty : Prop
  ergodicComponent : Prop

structure InvariantMeasureEvidence {S : SmoothDynamicalSystem} (M : InvariantMeasure S) where
  measurableSpaceClosed : M.measurableSpace
  invariancePropertyClosed : M.invarianceProperty
  ergodicComponentClosed : M.ergodicComponent

def InvariantMeasureClosed {S : SmoothDynamicalSystem} (M : InvariantMeasure S) : Prop :=
  M.measurableSpace ∧ M.invarianceProperty ∧ M.ergodicComponent

theorem invariant_measure_closed_from_evidence
    {S : SmoothDynamicalSystem} (M : InvariantMeasure S) (E : InvariantMeasureEvidence M) :
    InvariantMeasureClosed M := by
  exact And.intro E.measurableSpaceClosed
    (And.intro E.invariancePropertyClosed E.ergodicComponentClosed)

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse