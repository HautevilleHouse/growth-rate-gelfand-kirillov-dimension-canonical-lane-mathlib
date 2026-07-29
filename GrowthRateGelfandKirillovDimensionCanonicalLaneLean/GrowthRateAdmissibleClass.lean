import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GrowthRateGelfandKirillovDimensionCanonicalLaneLean.AlgebrasAndModules
import HautevilleHouse.GrowthRateGelfandKirillovDimensionCanonicalLaneLean.GrowthRateDefinition
import HautevilleHouse.GrowthRateGelfandKirillovDimensionCanonicalLaneLean.WedgeProductAndGrowth

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

open Set

structure AdmittedGrowthAlgebra where
  algebra : AlgebraOverField
  filtration : FilteredAlgebra algebra
  gkDimension : GelfandKirillovDimension algebra
  growthRate : GrowthRate algebra
  growthRatePolynomial : growthRate.polynomialGrowth
  gkFinite : gkDimension.finite

def AdmittedGrowthAlgebraWitnessClosed (A : AdmittedGrowthAlgebra) : Prop :=
  A.gkFinite ∧ A.growthRatePolynomial

theorem bridge_from_admitted_growth_algebra (A : AdmittedGrowthAlgebra) : 
  bridgeClosed { object := A, endpointSatisfied := A.gkFinite, remainderRecorded := True, gateWitness := Or.inl A.gkFinite } := by
  trivial

theorem gate_from_admitted_growth_algebra (A : AdmittedGrowthAlgebra) : 
  gateClosed { object := A, endpointSatisfied := A.gkFinite, remainderRecorded := True, gateWitness := Or.inl A.gkFinite } := by
  exact Or.inl A.gkFinite

theorem growth_rate_endgame (A : AdmittedGrowthAlgebra) : ConstrainedGrowthRateClosure { object := A, endpointSatisfied := A.gkFinite, remainderRecorded := True, gateWitness := Or.inl A.gkFinite } := by
  refine And.intro (bridge_from_admitted_growth_algebra A) (gate_from_admitted_growth_algebra A)

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse
