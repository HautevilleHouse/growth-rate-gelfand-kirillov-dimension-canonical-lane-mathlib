import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GrowthRateGelfandKirillovDimension.GelfandKirillovDimension

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimension

structure GrowthFunctionFamily {A : Type u} where
  algebras : List A
  growthFunction : A → (Nat → Nat)
  growthComparison : A → A → Prop
  polynomialGrowth : A → Prop
  exponentialGrowth : A → Prop
  polynomialGrowthTerm : polynomialGrowth
  exponentialGrowthTerm : exponentialGrowth

structure GrowthFunctionEvidence {A : Type u} (F : GrowthFunctionFamily A) where
  polynomialGrowthClosed : F.polynomialGrowth
  exponentialGrowthClosed : F.exponentialGrowth

def GrowthFunctionFamilyClosed {A : Type u} (F : GrowthFunctionFamily A) : Prop :=
  F.polynomialGrowth ∧ F.exponentialGrowth

theorem growth_function_family_closed_from_evidence
    {A : Type u} (F : GrowthFunctionFamily A) (E : GrowthFunctionEvidence F) :
    GrowthFunctionFamilyClosed F := by
  exact And.intro E.polynomialGrowthClosed E.exponentialGrowthClosed

end GrowthRateGelfandKirillovDimension
end HautevilleHouse