import DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean.PerelmanRoute

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure DynamicalSystemAnalyticCertificate (D : DynamicalSystemPackage) where
  invariantMeasureExistence : Prop
  entropyDefined : Prop
  dimensionFormula : Prop
  variationalPrinciple : Prop
  invariantMeasureExistenceClosed : invariantMeasureExistence
  entropyDefinedClosed : entropyDefined
  dimensionFormulaClosed : dimensionFormula
  variationalPrincipleClosed : variationalPrinciple
  dsEvidence : DynamicalSystemEvidence D

def DynamicalSystemAnalyticCertificateClosed {D : DynamicalSystemPackage}
    (C : DynamicalSystemAnalyticCertificate D) : Prop :=
  C.invariantMeasureExistence ∧
  C.entropyDefined ∧
  C.dimensionFormula ∧
  C.variationalPrinciple ∧
  DynamicalSystemClosed D

theorem dynamical_system_analytic_certificate_closed
    {D : DynamicalSystemPackage} (C : DynamicalSystemAnalyticCertificate D) :
    DynamicalSystemAnalyticCertificateClosed C := by
  exact And.intro C.invariantMeasureExistenceClosed
    (And.intro C.entropyDefinedClosed
      (And.intro C.dimensionFormulaClosed
        (And.intro C.variationalPrincipleClosed
          (dynamical_system_closed_from_evidence D C.dsEvidence))))

structure EntropyAnalyticCertificate {D : DynamicalSystemPackage}
    (E : EntropyTheoryPackage D) where
  measureEntropyDefined : Prop
  topologicalEntropyDefined : Prop
  entropyMonotonicity : Prop
  measureEntropyDefinedClosed : measureEntropyDefined
  topologicalEntropyDefinedClosed : topologicalEntropyDefined
  entropyMonotonicityClosed : entropyMonotonicity
  entropyEvidence : EntropyTheoryEvidence E

def EntropyAnalyticCertificateClosed {D : DynamicalSystemPackage}
    {E : EntropyTheoryPackage D} (C : EntropyAnalyticCertificate E) : Prop :=
  C.measureEntropyDefined ∧
  C.topologicalEntropyDefined ∧
  C.entropyMonotonicity ∧
  EntropyTheoryClosed E

theorem entropy_analytic_certificate_closed
    {D : DynamicalSystemPackage} {E : EntropyTheoryPackage D}
    (C : EntropyAnalyticCertificate E) : EntropyAnalyticCertificateClosed C := by
  exact And.intro C.measureEntropyDefinedClosed
    (And.intro C.topologicalEntropyDefinedClosed
      (And.intro C.entropyMonotonicityClosed
        (entropy_theory_closed_from_evidence E C.entropyEvidence)))

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse