import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

class GKGrowthClassification (P : GrowthRateGKPackage) where
  growthRateInteger : ∃ (d : ℕ), P.growthRate = (d : ℝ)
  classificationPoly : polynomialGrowth P (Nat.floor P.growthRate)
  classificationExp : exponentialGrowth P → P.growthRate = ∞

structure ClassificationEvidence {P : GrowthRateGKPackage} (C : GKGrowthClassification P) where
  growthRateIntegerClosed : C.growthRateInteger
  classificationPolyClosed : C.classificationPoly

def ClassificationClosed {P : GrowthRateGKPackage} (C : GKGrowthClassification P) : Prop :=
  C.growthRateInteger ∧ C.classificationPoly

theorem classification_closed_from_evidence {P : GrowthRateGKPackage} (C : GKGrowthClassification P) (E : ClassificationEvidence C) : ClassificationClosed C := by
  exact And.intro E.growthRateIntegerClosed E.classificationPolyClosed

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse
