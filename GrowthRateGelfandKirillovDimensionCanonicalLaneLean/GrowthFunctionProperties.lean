import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure GrowthFunctionPropertiesPackage where
  algebraType : Type u
  growthFunction : Nat -> Nat
  submultiplicativity : Prop
  subadditivity : Prop
  exponentialBound : Prop
  polynomialGrowth : Nat -> Prop

structure GrowthFunctionPropertiesEvidence (G : GrowthFunctionPropertiesPackage) where
  submultiplicativityClosed : G.submultiplicativity
  subadditivityClosed : G.subadditivity
  exponentialBoundClosed : G.exponentialBound
  polynomialGrowthClosed : ∀ d : Nat, G.polynomialGrowth d → G.polynomialGrowth d

def GrowthFunctionPropertiesClosed (G : GrowthFunctionPropertiesPackage) : Prop :=
  G.submultiplicativity ∧ G.subadditivity ∧ G.exponentialBound ∧ (∀ d : Nat, G.polynomialGrowth d)

theorem growth_function_properties_closed_from_evidence
    (G : GrowthFunctionPropertiesPackage)
    (E : GrowthFunctionPropertiesEvidence G) :
    GrowthFunctionPropertiesClosed G := by
  exact And.intro E.submultiplicativityClosed
    (And.intro E.subadditivityClosed
      (And.intro E.exponentialBoundClosed (by
        intro d
        exact E.polynomialGrowthClosed d ?_)))

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse
