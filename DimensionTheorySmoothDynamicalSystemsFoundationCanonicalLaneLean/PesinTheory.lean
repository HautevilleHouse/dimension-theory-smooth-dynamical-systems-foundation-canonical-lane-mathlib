import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean.SmoothDynamicalSystem
import HautevilleHouse.DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean.InvariantMeasure
import HautevilleHouse.DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean.LyapunovExponents
import HautevilleHouse.DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean.HausdorffDimension
import HautevilleHouse.DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean.EntropyPesin

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure PesinTheory (S : SmoothDynamicalSystem) (M : InvariantMeasure S) (L : LyapunovExponents S) (H : HausdorffDimension S) (E : EntropyPesin S M L) where
  stableManifoldTheorem : Prop
  dimensionFormulaByLyapunov : Prop
  ergodicDecomposition : Prop

structure PesinTheoryEvidence {S : SmoothDynamicalSystem} {M : InvariantMeasure S} {L : LyapunovExponents S} {H : HausdorffDimension S} {E : EntropyPesin S M L} (P : PesinTheory S M L H E) where
  stableManifoldTheoremClosed : P.stableManifoldTheorem
  dimensionFormulaByLyapunovClosed : P.dimensionFormulaByLyapunov
  ergodicDecompositionClosed : P.ergodicDecomposition

def PesinTheoryClosed {S : SmoothDynamicalSystem} {M : InvariantMeasure S} {L : LyapunovExponents S} {H : HausdorffDimension S} {E : EntropyPesin S M L} (P : PesinTheory S M L H E) : Prop :=
  P.stableManifoldTheorem ∧ P.dimensionFormulaByLyapunov ∧ P.ergodicDecomposition

theorem pesin_theory_closed_from_evidence
    {S : SmoothDynamicalSystem} {M : InvariantMeasure S} {L : LyapunovExponents S} {H : HausdorffDimension S}
    {E : EntropyPesin S M L} (P : PesinTheory S M L H E) (Ev : PesinTheoryEvidence P) :
    PesinTheoryClosed P := by
  exact And.intro Ev.stableManifoldTheoremClosed
    (And.intro Ev.dimensionFormulaByLyapunovClosed Ev.ergodicDecompositionClosed)

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse