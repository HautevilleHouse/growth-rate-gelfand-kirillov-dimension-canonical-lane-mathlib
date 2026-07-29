import GrowthRateGelfandKirillovDimensionCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

def bridgeClosed (A : GKAdmissibleClass) : Prop :=
  GKWitnessClosed A.object

theorem bridge_from_admissible_class (A : GKAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse