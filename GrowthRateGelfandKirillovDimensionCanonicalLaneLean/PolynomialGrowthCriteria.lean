import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GrowthRateGelfandKirillovDimension.GrowthFunctions

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimension

structure PolynomialGrowthCriteria {A : Type u} (F : GrowthFunctionFamily A) where
  algebra : A
  degree : Nat
  growthRate : A → (Nat → Nat) → (Nat → Nat)
  polynomialBound : Prop
  leadingCoefficient : Prop
  growthRateDefined : Prop
  polynomialBoundTerm : polynomialBound
  leadingCoefficientTerm : leadingCoefficient
  growthRateDefinedTerm : growthRateDefined

structure PolynomialGrowthEvidence {A : Type u} {F : GrowthFunctionFamily A}
    (C : PolynomialGrowthCriteria F) where
  polynomialBoundClosed : C.polynomialBound
  leadingCoefficientClosed : C.leadingCoefficient
  growthRateDefinedClosed : C.growthRateDefined

def PolynomialGrowthCriteriaClosed {A : Type u} {F : GrowthFunctionFamily A}
    (C : PolynomialGrowthCriteria F) : Prop :=
  C.polynomialBound ∧ C.leadingCoefficient ∧ C.growthRateDefined

theorem polynomial_growth_criteria_closed_from_evidence
    {A : Type u} {F : GrowthFunctionFamily A} (C : PolynomialGrowthCriteria F)
    (E : PolynomialGrowthEvidence C) : PolynomialGrowthCriteriaClosed C := by
  exact And.intro E.polynomialBoundClosed
    (And.intro E.leadingCoefficientClosed E.growthRateDefinedClosed)

end GrowthRateGelfandKirillovDimension
end HautevilleHouse