import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure ErgodicityFoundationPackage {G : DynamicalSystemPackage} where
  invariantMeasureExists : Prop
  ergodicDecomposition : Prop
  individualErgodicTheorem : Prop
  meanErgodicTheorem : Prop

structure ErgodicityFoundationEvidence {G : DynamicalSystemPackage} (E : ErgodicityFoundationPackage G) where
  invariantMeasureExistsClosed : E.invariantMeasureExists
  ergodicDecompositionClosed : E.ergodicDecomposition
  individualErgodicTheoremClosed : E.individualErgodicTheorem
  meanErgodicTheoremClosed : E.meanErgodicTheorem

def ErgodicityFoundationClosed {G : DynamicalSystemPackage} (E : ErgodicityFoundationPackage G) : Prop :=
  E.invariantMeasureExists ∧ E.ergodicDecomposition ∧ E.individualErgodicTheorem ∧ E.meanErgodicTheorem

theorem ergodicity_foundation_closed_from_evidence {G : DynamicalSystemPackage} (E : ErgodicityFoundationPackage G) (Ev : ErgodicityFoundationEvidence E) : ErgodicityFoundationClosed E := by
  exact And.intro Ev.invariantMeasureExistsClosed (And.intro Ev.ergodicDecompositionClosed (And.intro Ev.individualErgodicTheoremClosed Ev.meanErgodicTheoremClosed))

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse