import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

def exponentialGrowth (P : GrowthRateGKPackage) : Prop :=
  ∀ (C : ℕ) (k : ℕ), ∃ (n : ℕ), P.growthFunction n > C * (n ^ k)

def polynomialGrowth (P : GrowthRateGKPackage) (d : ℕ) : Prop :=
  ∃ (C : ℕ), ∀ (n : ℕ), P.growthFunction n ≤ C * (n ^ d)

structure GrowthComparison where
  algebra : GrowthRateGKPackage
  exponentialBound : exponentialGrowth algebra
  polynomialBound : polynomialGrowth algebra 0

theorem growth_comparison_exponential_gt_polynomial (P : GrowthRateGKPackage) (hExp : exponentialGrowth P) (hPoly : polynomialGrowth P 0) : False := by
  sorry

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse
