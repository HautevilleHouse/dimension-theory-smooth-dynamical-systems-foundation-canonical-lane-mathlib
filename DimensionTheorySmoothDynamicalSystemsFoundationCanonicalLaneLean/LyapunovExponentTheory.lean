import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure LyapunovExponentTheoryPackage {G : DynamicalSystemPackage} where
  multiplicateCocycle : Prop
  osledetsTheorem : Prop
  lyapunovExponentDefined : Prop
  stableUnstableManifolds : Prop

structure LyapunovExponentTheoryEvidence {G : DynamicalSystemPackage} (L : LyapunovExponentTheoryPackage G) where
  multiplicateCocycleClosed : L.multiplicateCocycle
  osledetsTheoremClosed : L.osledetsTheorem
  lyapunovExponentDefinedClosed : L.lyapunovExponentDefined
  stableUnstableManifoldsClosed : L.stableUnstableManifolds

def LyapunovExponentTheoryClosed {G : DynamicalSystemPackage} (L : LyapunovExponentTheoryPackage G) : Prop :=
  L.multiplicateCocycle ∧ L.osledetsTheorem ∧ L.lyapunovExponentDefined ∧ L.stableUnstableManifolds

theorem lyapunov_exponent_theory_closed_from_evidence {G : DynamicalSystemPackage} (L : LyapunovExponentTheoryPackage G) (Ev : LyapunovExponentTheoryEvidence L) : LyapunovExponentTheoryClosed L := by
  exact And.intro Ev.multiplicateCocycleClosed (And.intro Ev.osledetsTheoremClosed (And.intro Ev.lyapunovExponentDefinedClosed Ev.stableUnstableManifoldsClosed))

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse