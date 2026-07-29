import DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean.TheoremStatement
import canonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DimensionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DimensionTheoryAdmittedObject where
  space : DimensionSpace
  dimension : ℕ
  measureTheoreticDynamicalSystem : Prop
  entropyInvariant : Prop
  conclusion : entropyInvariant

structure DimensionEndgameState where
  object : DimensionTheoryAdmittedObject

def DimensionWitnessClosed (O : DimensionTheoryAdmittedObject) : Prop :=
  O.entropyInvariant

end DimensionTheorySmoothDynamicalSystemsFoundationCanonicalLaneLean
end HautevilleHouse