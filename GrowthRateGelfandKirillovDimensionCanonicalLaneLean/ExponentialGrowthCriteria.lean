import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GrowthRateGelfandKirillovDimension.GrowthFunctions

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimension

structure ExponentialGrowthCriteria {A : Type u} (F : GrowthFunctionFamily A) where
  algebra : A
  baseFunction : Nat → Nat
  exponentialBound : Prop
  growthRateExponential : Prop
  baseFunctionDefined : Prop
  exponentialBoundTerm : exponentialBound
  growthRateExponentialTerm : growthRateExponential
  baseFunctionDefinedTerm : baseFunctionDefined

structure ExponentialGrowthEvidence {A : Type u} {F : GrowthFunctionFamily A}
    (C : ExponentialGrowthCriteria F) where
  exponentialBoundClosed : C.exponentialBound
  growthRateExponentialClosed : C.growthRateExponential
  baseFunctionDefinedClosed : C.baseFunctionDefined

def ExponentialGrowthCriteriaClosed {A : Type u} {F : GrowthFunctionFamily A}
    (C : ExponentialGrowthCriteria F) : Prop :=
  C.exponentialBound ∧ C.growthRateExponential ∧ C.baseFunctionDefined

theorem exponential_growth_criteria_closed_from_evidence
    {A : Type u} {F : GrowthFunctionFamily A} (C : ExponentialGrowthCriteria F)
    (E : ExponentialGrowthEvidence C) : ExponentialGrowthCriteriaClosed C := by
  exact And.intro E.exponentialBoundClosed
    (And.intro E.growthRateExponentialClosed E.baseFunctionDefinedClosed)

end GrowthRateGelfandKirillovDimension
end HautevilleHouse