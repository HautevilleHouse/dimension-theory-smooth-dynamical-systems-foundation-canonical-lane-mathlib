import DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean.PerelmanAnalyticProof

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure DynamicalSystemEvidenceTerms {D : DynamicalSystemPackage}
    (C : DynamicalSystemAnalyticCertificate D) where
  invariantMeasureExistence : C.invariantMeasureExistence
  entropyDefined : C.entropyDefined
  dimensionFormula : C.dimensionFormula
  variationalPrinciple : C.variationalPrinciple
  dsClosed : DynamicalSystemClosed D

def DynamicalSystemAnalyticCertificate.evidenceTerms {D : DynamicalSystemPackage}
    (C : DynamicalSystemAnalyticCertificate D) : DynamicalSystemEvidenceTerms C :=
  invariantMeasureExistence := C.invariantMeasureExistenceClosed
  entropyDefined := C.entropyDefinedClosed
  dimensionFormula := C.dimensionFormulaClosed
  variationalPrinciple := C.variationalPrincipleClosed
  dsClosed := dynamical_system_closed_from_evidence D C.dsEvidence

structure EntropyEvidenceTerms {D : DynamicalSystemPackage}
    {E : EntropyTheoryPackage D} (C : EntropyAnalyticCertificate E) where
  measureEntropyDefined : C.measureEntropyDefined
  topologicalEntropyDefined : C.topologicalEntropyDefined
  entropyMonotonicity : C.entropyMonotonicity
  entropyClosed : EntropyTheoryClosed E

def EntropyAnalyticCertificate.evidenceTerms {D : DynamicalSystemPackage}
    {E : EntropyTheoryPackage D} (C : EntropyAnalyticCertificate E) :
    EntropyEvidenceTerms C :=
  measureEntropyDefined := C.measureEntropyDefinedClosed
  topologicalEntropyDefined := C.topologicalEntropyDefinedClosed
  entropyMonotonicity := C.entropyMonotonicityClosed
  entropyClosed := entropy_theory_closed_from_evidence E C.entropyEvidence

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse