import canonicalLaneMathlib.AdmissibleClass

/-!
# Lyapunov Exponents Package

This module defines Lyapunov exponents for smooth dynamical systems, providing the
bridge closure for exponential growth rates along orbits.
-/

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure LyapunovExponentsPackage {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    (φ : ℝ → M → M) where
  cocycle : M → ℝ → LinearMap ℝ (TangentSpace M) (TangentSpace M)
  osledecTheorem : Prop
  spectrumDefined : Prop
  measurability : Prop

structure LyapunovExponentsEvidence {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {φ : ℝ → M → M} (L : LyapunovExponentsPackage φ) where
  osledecClosed : L.osledecTheorem
  spectrumClosed : L.spectrumDefined
  measurabilityClosed : L.measurability

def LyapunovExponentsClosed {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {φ : ℝ → M → M} (L : LyapunovExponentsPackage φ) : Prop :=
  L.osledecTheorem ∧ L.spectrumDefined ∧ L.measurability

theorem lyapunov_exponents_closed_from_evidence {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {φ : ℝ → M → M} (L : LyapunovExponentsPackage φ) (E : LyapunovExponentsEvidence L) :
  LyapunovExponentsClosed L :=
  And.intro E.osledecClosed (And.intro E.spectrumClosed E.measurabilityClosed)

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse
