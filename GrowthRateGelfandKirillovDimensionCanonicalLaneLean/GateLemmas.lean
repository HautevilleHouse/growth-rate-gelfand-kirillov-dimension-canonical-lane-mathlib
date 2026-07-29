import GrowthRateGelfandKirillovDimensionCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

def gateClosed (A : GKAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : GKAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse