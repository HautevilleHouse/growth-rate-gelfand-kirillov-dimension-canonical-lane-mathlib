import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure GrowthRateGKPackage where
  algebra : Type u
  generatingSubspace : Type v
  growthFunction : Nat → Nat
  growthRate : ℝ
  isFiniteDimensional : Prop
  growthFunctionMonotone : Prop
  growthRateFinite : Prop

structure GrowthRateGKEvidence (P : GrowthRateGKPackage) where
  isFiniteDimensionalClosed : P.isFiniteDimensional
  growthFunctionMonotoneClosed : P.growthFunctionMonotone
  growthRateFiniteClosed : P.growthRateFinite

def GrowthRateGKClosed (P : GrowthRateGKPackage) : Prop :=
  P.isFiniteDimensional ∧ P.growthFunctionMonotone ∧ P.growthRateFinite

theorem growth_rate_gk_closed_from_evidence (P : GrowthRateGKPackage) (E : GrowthRateGKEvidence P) : GrowthRateGKClosed P := by
  exact And.intro E.isFiniteDimensionalClosed (And.intro E.growthFunctionMonotoneClosed E.growthRateFiniteClosed)

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse
