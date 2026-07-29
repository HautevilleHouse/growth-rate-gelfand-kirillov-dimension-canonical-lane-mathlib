import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure TensorProductGrowthPackage where
  algebraA : Type u
  algebraB : Type v
  tensorProduct : Type w
  gkAlgebraA : ℝ
  gkAlgebraB : ℝ
  gkTensorProduct : ℝ
  additivityProperty : Prop
  growthFunctionA : Nat -> Nat
  growthFunctionB : Nat -> Nat
  growthFunctionTensor : Nat -> Nat

structure TensorProductGrowthEvidence (T : TensorProductGrowthPackage) where
  additivityPropertyClosed : T.additivityProperty
  growthTensorBoundClosed : ∀ n, T.growthFunctionTensor n ≤ T.growthFunctionA n * T.growthFunctionB n

def TensorProductGrowthClosed (T : TensorProductGrowthPackage) : Prop :=
  T.additivityProperty ∧ (∀ n, T.growthFunctionTensor n ≤ T.growthFunctionA n * T.growthFunctionB n)

theorem tensor_product_growth_closed_from_evidence
    (T : TensorProductGrowthPackage)
    (E : TensorProductGrowthEvidence T) :
    TensorProductGrowthClosed T := by
  exact And.intro E.additivityPropertyClosed E.growthTensorBoundClosed

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse
