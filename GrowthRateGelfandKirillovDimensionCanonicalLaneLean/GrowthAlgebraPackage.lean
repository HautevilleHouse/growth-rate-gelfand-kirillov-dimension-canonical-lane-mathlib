import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure GrowthAlgebraPackage where
  carrierAlgebra : Type u
  generators : List (carrierAlgebra)
  relations : List (carrierAlgebra × carrierAlgebra)
  algebraDefined : Prop
  gradation : Nat -> carrierAlgebra -> Prop
  gradedDimensions : Nat -> Nat
  growthFunction : Nat -> Nat

structure GrowthAlgebraEvidence (G : GrowthAlgebraPackage) where
  algebraDefinedClosed : G.algebraDefined
  gradationClosed : ∀ n, G.gradation n (0 : G.carrierAlgebra)
  gradedDimensionsComputed : ∀ n, G.gradedDimensions n = 0 ? 0 : 1

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse
