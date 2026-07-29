import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure GKDimensionalDefinitenessPackage where
  algebraType : Type u
  growthFunction : Nat -> Nat
  gkDimension : ℝ
  limitSupExists : Prop
  limitInfExists : Prop
  finiteGenerators : Prop

structure GKDimensionalDefinitenessEvidence (D : GKDimensionalDefinitenessPackage) where
  limitSupExistsClosed : D.limitSupExists
  limitInfExistsClosed : D.limitInfExists
  finiteGeneratorsClosed : D.finiteGenerators

def GKDimensionalDefinitenessClosed (D : GKDimensionalDefinitenessPackage) : Prop :=
  D.limitSupExists ∧ D.limitInfExists ∧ D.finiteGenerators

theorem gk_dimensional_definiteness_closed_from_evidence
    (D : GKDimensionalDefinitenessPackage)
    (E : GKDimensionalDefinitenessEvidence D) :
    GKDimensionalDefinitenessClosed D := by
  exact And.intro E.limitSupExistsClosed
    (And.intro E.limitInfExistsClosed E.finiteGeneratorsClosed)

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse
