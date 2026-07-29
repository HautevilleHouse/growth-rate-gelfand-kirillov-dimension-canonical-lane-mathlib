import GrowthRateGelfandKirillovDimensionCanonicalLaneLean.GrowthAlgebra

/-!
# Dimension Classification Package
-/

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure DimensionClassificationPackage (A : GKAdmissibleClass) (P : GrowthAlgebraPackage A) where
  gkDimension : ℝ
  dimensionIsNonnegative : gkDimension ≥ 0
  dimensionIsIntegerIfFinite : (∃ d : ℕ, gkDimension = (d : ℝ)) ∨ gkDimension = ∞
  growthRateIsPolynomial : (gkDimension < ∞) → (growthFunction P) ∈ O(n^(gkDimension))
  growthRateIsExponential : (gkDimension = ∞) → (growthFunction P) ∉ O(exp(n^ϵ))

structure DimensionClassificationEvidence (A : GKAdmissibleClass) (P : GrowthAlgebraPackage A) (C : DimensionClassificationPackage A P) where
  gkDimensionClosed : C.gkDimension = P.gkDimension
  dimensionIsNonnegativeClosed : C.dimensionIsNonnegative
  dimensionIsIntegerIfFiniteClosed : C.dimensionIsIntegerIfFinite

def DimensionClassificationClosed (A : GKAdmissibleClass) (P : GrowthAlgebraPackage A) (C : DimensionClassificationPackage A P) : Prop :=
  C.gkDimension = P.gkDimension ∧ C.dimensionIsNonnegative ∧ C.dimensionIsIntegerIfFinite

theorem dimension_classification_closed_from_evidence (A : GKAdmissibleClass) (P : GrowthAlgebraPackage A) (C : DimensionClassificationPackage A P) (E : DimensionClassificationEvidence A P C) :
    DimensionClassificationClosed A P C := by
  exact And.intro E.gkDimensionClosed (And.intro E.dimensionIsNonnegativeClosed E.dimensionIsIntegerIfFiniteClosed)

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse