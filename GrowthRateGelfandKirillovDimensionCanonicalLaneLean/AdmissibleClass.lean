import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure GelfandKirillovAdmittedObject where
  algebra : Type u
  algebraType : Algebra ℂ algebra
  finitelyGenerated : Prop
  growthFunction : ℕ → ℕ
  gkDimension : ℝ
  dimensionDefinedByGrowth : limsup (fun n => log (growthFunction n) / log (n : ℝ)) = gkDimension
  conclusion : GKAdmissible

structure GKAdmissibleClass where
  object : GelfandKirillovAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def GKAdmittedClosure (A : GKAdmissibleClass) : Prop :=
  GKWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse