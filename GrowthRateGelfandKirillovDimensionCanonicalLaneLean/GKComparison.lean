import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GrowthRateGelfandKirillovDimension.PolynomialGrowthCriteria
import HautevilleHouse.GrowthRateGelfandKirillovDimension.ExponentialGrowthCriteria

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimension

structure GKComparisonPackage {A : Type u} {F : GrowthFunctionFamily A}
    (P : PolynomialGrowthCriteria F) (E : ExponentialGrowthCriteria F) where
  polynomialGrowth : A
  exponentialGrowth : A
  polynomialGrowthGK : Real
  exponentialGrowthGK : Real
  comparisonInequality : Prop
  gkDimensionBound : Prop
  comparisonInequalityTerm : comparisonInequality
  gkDimensionBoundTerm : gkDimensionBound

structure GKComparisonEvidence {A : Type u} {F : GrowthFunctionFamily A}
    {P : PolynomialGrowthCriteria F} {E : ExponentialGrowthCriteria F}
    (C : GKComparisonPackage P E) where
  comparisonInequalityClosed : C.comparisonInequality
  gkDimensionBoundClosed : C.gkDimensionBound

def GKComparisonClosed {A : Type u} {F : GrowthFunctionFamily A}
    {P : PolynomialGrowthCriteria F} {E : ExponentialGrowthCriteria F}
    (C : GKComparisonPackage P E) : Prop :=
  C.comparisonInequality ∧ C.gkDimensionBound

theorem gk_comparison_closed_from_evidence
    {A : Type u} {F : GrowthFunctionFamily A}
    {P : PolynomialGrowthCriteria F} {E : ExponentialGrowthCriteria F}
    (C : GKComparisonPackage P E) (Ev : GKComparisonEvidence C) :
    GKComparisonClosed C := by
  exact And.intro Ev.comparisonInequalityClosed Ev.gkDimensionBoundClosed

end GrowthRateGelfandKirillovDimension
end HautevilleHouse