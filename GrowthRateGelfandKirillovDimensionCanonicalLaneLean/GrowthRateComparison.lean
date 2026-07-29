import GrowthRateGelfandKirillovDimensionCanonicalLaneLean.FinitelyGeneratedAlgebras

/-!
# Growth Rate Comparison Package
-/

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure GrowthRateComparisonPackage {G : AffineAlgebraGrowthPackage}
    {F : FinitelyGeneratedAlgebrasPackage G} where
  rateOrderingExists : Prop
  polynomialGrowthCharacterized : Prop
  exponentialGrowthCharacterized : Prop
  intermediateGrowthPossibility : Prop

structure GrowthRateComparisonEvidence {G : AffineAlgebraGrowthPackage}
    {F : FinitelyGeneratedAlgebrasPackage G}
    (R : GrowthRateComparisonPackage F) where
  rateOrderingExistsClosed : R.rateOrderingExists
  polynomialGrowthCharacterizedClosed : R.polynomialGrowthCharacterized
  exponentialGrowthCharacterizedClosed : R.exponentialGrowthCharacterized
  intermediateGrowthPossibilityClosed : R.intermediateGrowthPossibility

def GrowthRateComparisonClosed {G : AffineAlgebraGrowthPackage}
    {F : FinitelyGeneratedAlgebrasPackage G}
    (R : GrowthRateComparisonPackage F) : Prop :=
  R.rateOrderingExists ∧ R.polynomialGrowthCharacterized ∧
  R.exponentialGrowthCharacterized ∧ R.intermediateGrowthPossibility

theorem growth_rate_comparison_closed_from_evidence
    {G : AffineAlgebraGrowthPackage} {F : FinitelyGeneratedAlgebrasPackage G}
    (R : GrowthRateComparisonPackage F) (E : GrowthRateComparisonEvidence R) :
    GrowthRateComparisonClosed R := by
  exact And.intro E.rateOrderingExistsClosed
    (And.intro E.polynomialGrowthCharacterizedClosed
      (And.intro E.exponentialGrowthCharacterizedClosed E.intermediateGrowthPossibilityClosed))

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse