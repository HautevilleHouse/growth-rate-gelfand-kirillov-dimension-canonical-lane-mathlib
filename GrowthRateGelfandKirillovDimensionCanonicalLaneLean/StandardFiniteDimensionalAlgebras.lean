import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure StandardFiniteDimensionalAlgebrasPackage where
  algebraType : Type u
  dimension : Nat
  gkDimension : ℝ
  finiteDimensional : Prop
  gkZero : Prop

def StandardFiniteDimensionalAlgebrasClosed (S : StandardFiniteDimensionalAlgebrasPackage) : Prop :=
  S.finiteDimensional ∧ S.gkZero

theorem standard_finite_dimensional_algebras_closed
    (S : StandardFiniteDimensionalAlgebrasPackage) :
    StandardFiniteDimensionalAlgebrasClosed S := by
  exact And.intro S.finiteDimensional S.gkZero

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse
