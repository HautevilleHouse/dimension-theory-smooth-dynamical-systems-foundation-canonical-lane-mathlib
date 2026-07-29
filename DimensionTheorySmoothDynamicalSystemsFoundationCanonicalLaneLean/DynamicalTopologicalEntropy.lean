import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure DynamicalTopologicalEntropyPackage {G : DynamicalSystemPackage} where
  entropyDefined : Prop
  variationalPrinciple : Prop
  entropyUpperSemicontinuous : Prop
  entropyInvariantUnderConjugation : Prop

structure DynamicalTopologicalEntropyEvidence {G : DynamicalSystemPackage} (E : DynamicalTopologicalEntropyPackage G) where
  entropyDefinedClosed : E.entropyDefined
  variationalPrincipleClosed : E.variationalPrinciple
  entropyUpperSemicontinuousClosed : E.entropyUpperSemicontinuous
  entropyInvariantUnderConjugationClosed : E.entropyInvariantUnderConjugation

def DynamicalTopologicalEntropyClosed {G : DynamicalSystemPackage} (E : DynamicalTopologicalEntropyPackage G) : Prop :=
  E.entropyDefined ∧ E.variationalPrinciple ∧ E.entropyUpperSemicontinuous ∧ E.entropyInvariantUnderConjugation

theorem dynamical_topological_entropy_closed_from_evidence {G : DynamicalSystemPackage} (E : DynamicalTopologicalEntropyPackage G) (Ev : DynamicalTopologicalEntropyEvidence E) : DynamicalTopologicalEntropyClosed E := by
  exact And.intro Ev.entropyDefinedClosed (And.intro Ev.variationalPrincipleClosed (And.intro Ev.entropyUpperSemicontinuousClosed Ev.entropyInvariantUnderConjugationClosed))

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse