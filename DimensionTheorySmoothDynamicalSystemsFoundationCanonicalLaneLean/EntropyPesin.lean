import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean.SmoothDynamicalSystem
import HautevilleHouse.DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean.InvariantMeasure
import HautevilleHouse.DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean.LyapunovExponents

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure EntropyPesin (S : SmoothDynamicalSystem) (M : InvariantMeasure S) (L : LyapunovExponents S) where
  entropyFormula : Prop
  pesinEntropyFormula : Prop
  entropyUpperBound : Prop

structure EntropyPesinEvidence {S : SmoothDynamicalSystem} {M : InvariantMeasure S} {L : LyapunovExponents S} (E : EntropyPesin S M L) where
  entropyFormulaClosed : E.entropyFormula
  pesinEntropyFormulaClosed : E.pesinEntropyFormula
  entropyUpperBoundClosed : E.entropyUpperBound

def EntropyPesinClosed {S : SmoothDynamicalSystem} {M : InvariantMeasure S} {L : LyapunovExponents S} (E : EntropyPesin S M L) : Prop :=
  E.entropyFormula ∧ E.pesinEntropyFormula ∧ E.entropyUpperBound

theorem entropy_pesin_closed_from_evidence
    {S : SmoothDynamicalSystem} {M : InvariantMeasure S} {L : LyapunovExponents S}
    (E : EntropyPesin S M L) (Ev : EntropyPesinEvidence E) : EntropyPesinClosed E := by
  exact And.intro Ev.entropyFormulaClosed
    (And.intro Ev.pesinEntropyFormulaClosed Ev.entropyUpperBoundClosed)

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse