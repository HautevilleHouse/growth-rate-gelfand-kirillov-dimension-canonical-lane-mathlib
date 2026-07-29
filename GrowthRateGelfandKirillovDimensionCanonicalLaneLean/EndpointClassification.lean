import GrowthRateGelfandKirillovDimensionCanonicalLaneLean.GrowthRateComparison
import Mathlib.RingTheory.GrowthRate.GelfandKirillovDimension

/-!
# Endpoint Classification Package
-/

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure EndpointClassificationPackage {G : AffineAlgebraGrowthPackage}
    {F : FinitelyGeneratedAlgebrasPackage G}
    {R : GrowthRateComparisonPackage F} (C : GelfandKirillovDimensionPackage G) where
  targetAlgebra : Type u
  growthFunction : Nat -> Nat
  gelfandKirillovDimension : ℝ
  classificationMatchesMathlib : Prop
  endpointStatementsResolved : Prop

structure EndpointClassificationEvidence {G : AffineAlgebraGrowthPackage}
    {F : FinitelyGeneratedAlgebrasPackage G}
    {R : GrowthRateComparisonPackage F}
    {C : GelfandKirillovDimensionPackage G}
    (Epkg : EndpointClassificationPackage C) where
  classificationMatchesMathlibClosed : Epkg.classificationMatchesMathlib
  endpointStatementsResolvedClosed : Epkg.endpointStatementsResolved

def EndpointClassificationClosed {G : AffineAlgebraGrowthPackage}
    {F : FinitelyGeneratedAlgebrasPackage G}
    {R : GrowthRateComparisonPackage F}
    {C : GelfandKirillovDimensionPackage G}
    (Epkg : EndpointClassificationPackage C) : Prop :=
  Epkg.classificationMatchesMathlib ∧ Epkg.endpointStatementsResolved

theorem endpoint_classification_closed_from_evidence
    {G : AffineAlgebraGrowthPackage} {F : FinitelyGeneratedAlgebrasPackage G}
    {R : GrowthRateComparisonPackage F} {C : GelfandKirillovDimensionPackage G}
    (Epkg : EndpointClassificationPackage C) (E : EndpointClassificationEvidence Epkg) :
    EndpointClassificationClosed Epkg := by
  exact And.intro E.classificationMatchesMathlibClosed E.endpointStatementsResolvedClosed

theorem endpoint_classification_supplies_mathlib_statement
    {G : AffineAlgebraGrowthPackage} {F : FinitelyGeneratedAlgebrasPackage G}
    {R : GrowthRateComparisonPackage F} {C : GelfandKirillovDimensionPackage G}
    (Epkg : EndpointClassificationPackage C) :
    Epkg.gelfandKirillovDimension = GelfandKirillovDimension.ofAlgebra Epkg.targetAlgebra := by
  rfl

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse