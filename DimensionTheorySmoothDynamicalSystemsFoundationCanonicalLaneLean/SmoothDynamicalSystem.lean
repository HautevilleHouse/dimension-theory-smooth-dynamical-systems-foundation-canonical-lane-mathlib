import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure SmoothDynamicalSystem where
  stateSpace : Type u
  timeDomain : Type v
  flow : stateSpace → timeDomain → stateSpace
  flowSmooth : Prop
  flowGroupProperty : Prop
  stateSpaceSmooth : Prop

structure SmoothDynamicalSystemEvidence (S : SmoothDynamicalSystem) where
  flowSmoothClosed : S.flowSmooth
  flowGroupPropertyClosed : S.flowGroupProperty
  stateSpaceSmoothClosed : S.stateSpaceSmooth

def SmoothDynamicalSystemClosed (S : SmoothDynamicalSystem) : Prop :=
  S.flowSmooth ∧ S.flowGroupProperty ∧ S.stateSpaceSmooth

theorem smooth_dynamical_system_closed_from_evidence
    (S : SmoothDynamicalSystem) (E : SmoothDynamicalSystemEvidence S) :
    SmoothDynamicalSystemClosed S := by
  exact And.intro E.flowSmoothClosed
    (And.intro E.flowGroupPropertyClosed E.stateSpaceSmoothClosed)

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse