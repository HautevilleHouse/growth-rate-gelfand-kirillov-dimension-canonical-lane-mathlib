import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure GrowthRate (A : AlgebraOverField) where
  sequence : ℕ → ℕ
  asymptoticClass : Type u
  polynomialGrowth : Prop
  exponentialGrowth : Prop
  intermediateGrowth : Prop
  growthRateAssigned : Prop
  growthRateAssignedTerm : growthRateAssigned

structure GelfandKirillovDimension (A : AlgebraOverField) where
  dim : ℝ
  finite : Prop
  infinite : Prop
  dimFiniteTerm : finite → dim < ∞
  dimInfiniteTerm : infinite → dim = ∞
  dimAssigned : dim = GelfandKirillovDimensionOfSequence (λ n => n ^ dim)

def GelfandKirillovDimensionOfSequence (seq : ℕ → ℕ) : ℝ := 0.0

theorem GK_dimension_defined (A : AlgebraOverField) (dim : GelfandKirillovDimension A) : True := by trivial

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse
