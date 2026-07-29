import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GrowthRateGelfandKirillovDimension.GKComparison

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimension

structure GKDimensionComputationPackage {A : Type u} {F : GrowthFunctionFamily A}
    {P : PolynomialGrowthCriteria F} {E : ExponentialGrowthCriteria F}
    {C : GKComparisonPackage P E} where
  algebra : A
  computedDimension : Real
  dimensionBoundProof : Prop
  dimensionExactValue : Prop
  dimensionBoundProofTerm : dimensionBoundProof
  dimensionExactValueTerm : dimensionExactValue

structure GKDimensionComputationEvidence {A : Type u} {F : GrowthFunctionFamily A}
    {P : PolynomialGrowthCriteria F} {E : ExponentialGrowthCriteria F}
    {C : GKComparisonPackage P E} (D : GKDimensionComputationPackage C) where
  dimensionBoundProofClosed : D.dimensionBoundProof
  dimensionExactValueClosed : D.dimensionExactValue

def GKDimensionComputationClosed {A : Type u} {F : GrowthFunctionFamily A}
    {P : PolynomialGrowthCriteria F} {E : ExponentialGrowthCriteria F}
    {C : GKComparisonPackage P E} (D : GKDimensionComputationPackage C) : Prop :=
  D.dimensionBoundProof ∧ D.dimensionExactValue

theorem gk_dimension_computation_closed_from_evidence
    {A : Type u} {F : GrowthFunctionFamily A}
    {P : PolynomialGrowthCriteria F} {E : ExponentialGrowthCriteria F}
    {C : GKComparisonPackage P E} (D : GKDimensionComputationPackage C)
    (Ev : GKDimensionComputationEvidence D) : GKDimensionComputationClosed D := by
  exact And.intro Ev.dimensionBoundProofClosed Ev.dimensionExactValueClosed

end GrowthRateGelfandKirillovDimension
end HautevilleHouse