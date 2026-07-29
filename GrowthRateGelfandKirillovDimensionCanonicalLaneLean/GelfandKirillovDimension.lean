import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimension

structure GelfandKirillovDimensionPackage where
  algebra : Type u
  generatingVectorSpace : Type v
  growthFunction : Nat → Nat
  gkDimension : Real
  growthFunctionAdmissible : Prop
  gkDimensionDefined : Prop
  growthFunctionAdmissibleTerm : growthFunctionAdmissible
  gkDimensionDefinedTerm : gkDimensionDefined

structure GelfandKirillovDimensionEvidence (G : GelfandKirillovDimensionPackage) where
  growthFunctionAdmissibleClosed : G.growthFunctionAdmissible
  gkDimensionDefinedClosed : G.gkDimensionDefined

def GelfandKirillovDimensionClosed (G : GelfandKirillovDimensionPackage) : Prop :=
  G.growthFunctionAdmissible ∧ G.gkDimensionDefined

theorem gelfand_kirillov_dimension_closed_from_evidence
    (G : GelfandKirillovDimensionPackage) (E : GelfandKirillovDimensionEvidence G) :
    GelfandKirillovDimensionClosed G := by
  exact And.intro E.growthFunctionAdmissibleClosed E.gkDimensionDefinedClosed

end GrowthRateGelfandKirillovDimension
end HautevilleHouse