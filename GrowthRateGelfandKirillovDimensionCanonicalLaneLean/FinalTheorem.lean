import GrowthRateGelfandKirillovDimensionCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

def ConstrainedGKClosure (A : GKAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_gk_endgame (A : GKAdmissibleClass) :
    ConstrainedGKClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse