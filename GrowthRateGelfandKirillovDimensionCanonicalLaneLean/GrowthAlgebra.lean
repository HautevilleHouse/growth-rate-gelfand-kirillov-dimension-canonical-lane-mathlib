import GrowthRateGelfandKirillovDimensionCanonicalLaneLean.AdmissibleClass

/-!
# Growth Algebra Package
-/

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure GrowthAlgebraPackage (A : GKAdmissibleClass) where
  finitelyGenerated : Prop
  growthFunctionDefined : Prop
  gkDimensionExists : Prop
  growthFunction : ℕ → ℕ
  gkDimension : ℝ
  growthFunctionCalculated : ∀ n, growthFunction n = dim (A.object.algebra) n
  dimensionLimit : limsup (fun n => log (growthFunction n) / log (n : ℝ)) = gkDimension

structure GrowthAlgebraEvidence (A : GKAdmissibleClass) (P : GrowthAlgebraPackage A) where
  finitelyGeneratedClosed : P.finitelyGenerated
  growthFunctionDefinedClosed : P.growthFunctionDefined
  gkDimensionExistsClosed : P.gkDimensionExists

def GrowthAlgebraClosed (A : GKAdmissibleClass) (P : GrowthAlgebraPackage A) : Prop :=
  P.finitelyGenerated ∧ P.growthFunctionDefined ∧ P.gkDimensionExists

theorem growth_algebra_closed_from_evidence (A : GKAdmissibleClass) (P : GrowthAlgebraPackage A) (E : GrowthAlgebraEvidence A P) :
    GrowthAlgebraClosed A P := by
  exact And.intro E.finitelyGeneratedClosed (And.intro E.growthFunctionDefinedClosed E.gkDimensionExistsClosed)

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse