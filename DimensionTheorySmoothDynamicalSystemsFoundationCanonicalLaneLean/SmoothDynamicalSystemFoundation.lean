import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

structure DynamicalSystemPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothAtlas : Type v
  smoothStructure : Prop
  flowMap : ℝ × manifold → manifold
  smoothFlow : Prop

structure DynamicalSystemEvidence (G : DynamicalSystemPackage) where
  smoothStructureClosed : G.smoothStructure
  smoothFlowClosed : G.smoothFlow

def DynamicalSystemClosed (G : DynamicalSystemPackage) : Prop :=
  G.smoothStructure ∧ G.smoothFlow

theorem dynamical_system_closed_from_evidence (G : DynamicalSystemPackage) (E : DynamicalSystemEvidence G) : DynamicalSystemClosed G := by
  exact And.intro E.smoothStructureClosed E.smoothFlowClosed

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse