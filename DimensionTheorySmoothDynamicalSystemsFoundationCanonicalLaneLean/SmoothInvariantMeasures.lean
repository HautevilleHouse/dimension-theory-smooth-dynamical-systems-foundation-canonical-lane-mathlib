import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure SmoothInvariantMeasuresPackage {G : DynamicalSystemPackage} where
  absolutelyContinuousInvariant : Prop
  srbMeasure : Prop
  linearResponse : Prop
  physicalMeasure : Prop

structure SmoothInvariantMeasuresEvidence {G : DynamicalSystemPackage} (M : SmoothInvariantMeasuresPackage G) where
  absolutelyContinuousInvariantClosed : M.absolutelyContinuousInvariant
  srbMeasureClosed : M.srbMeasure
  linearResponseClosed : M.linearResponse
  physicalMeasureClosed : M.physicalMeasure

def SmoothInvariantMeasuresClosed {G : DynamicalSystemPackage} (M : SmoothInvariantMeasuresPackage G) : Prop :=
  M.absolutelyContinuousInvariant ∧ M.srbMeasure ∧ M.linearResponse ∧ M.physicalMeasure

theorem smooth_invariant_measures_closed_from_evidence {G : DynamicalSystemPackage} (M : SmoothInvariantMeasuresPackage G) (Ev : SmoothInvariantMeasuresEvidence M) : SmoothInvariantMeasuresClosed M := by
  exact And.intro Ev.absolutelyContinuousInvariantClosed (And.intro Ev.srbMeasureClosed (And.intro Ev.linearResponseClosed Ev.physicalMeasureClosed))

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse