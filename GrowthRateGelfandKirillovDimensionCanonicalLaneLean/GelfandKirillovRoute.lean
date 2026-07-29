import GrowthRateGelfandKirillovDimensionCanonicalLaneLean.FinalTheorem
import GrowthRateGelfandKirillovDimensionCanonicalLaneLean.GelfandKirillovAnalyticFoundation
import Mathlib.RingTheory.GrowthRate.GelfandKirillovDimension

/-!
# Gelfand-Kirillov Route Layer

This module records the theorem-route obligations that connect the
Gelfand-Kirillov Canonical Lane package to the algebraic growth route:
affine algebra growth, Gelfand-Kirillov dimension, finitely generated algebras,
growth rate comparison, and endpoint classification.

The module binds to Mathlib's Gelfand-Kirillov statement layer where available
and keeps the full analytic development as an explicit carried formalization
obligation.
-/

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

/-- Mathlib's Gelfand-Kirillov dimension statement family. -/
abbrev MathlibGelfandKirillovStatement (A : Type u) [Algebra ℚ A] [FiniteType ℚ A] : ℝ :=
  GelfandKirillovDimension.ofAlgebra A

/--
The Gelfand-Kirillov route obligations needed before the analytic proof route can be
counted as closed inside Lean.
-/
structure GelfandKirillovRouteObligations where
  affineAlgebraGrowth : Prop
  gelfandKirillovDimension : Prop
  finitelyGeneratedAlgebras : Prop
  growthRateComparison : Prop
  endpointClassification : Prop

/-- Closed evidence for each Gelfand-Kirillov route obligation. -/
structure GelfandKirillovRouteEvidence (R : GelfandKirillovRouteObligations) where
  affineAlgebraGrowthClosed : R.affineAlgebraGrowth
  gelfandKirillovDimensionClosed : R.gelfandKirillovDimension
  finitelyGeneratedAlgebrasClosed : R.finitelyGeneratedAlgebras
  growthRateComparisonClosed : R.growthRateComparison
  endpointClassificationClosed : R.endpointClassification

/--
The Gelfand-Kirillov route is closed only when each obligation has closed evidence.
-/
def GelfandKirillovRouteClosed (R : GelfandKirillovRouteObligations) : Prop :=
  R.affineAlgebraGrowth ∧ R.gelfandKirillovDimension ∧
  R.finitelyGeneratedAlgebras ∧ R.growthRateComparison ∧ R.endpointClassification

/--
Projection from the analytic foundation into the Gelfand-Kirillov route obligation set.
-/
def GelfandKirillovAnalyticFoundation.toGelfandKirillovRouteObligations
    (A : GelfandKirillovAnalyticFoundation) : GelfandKirillovRouteObligations :=
  { affineAlgebraGrowth := AffineAlgebraGrowthClosed A.affineAlgebraGrowth
    gelfandKirillovDimension := GelfandKirillovDimensionClosed A.gelfandKirillovDimension
    finitelyGeneratedAlgebras := FinitelyGeneratedAlgebrasClosed A.finitelyGeneratedAlgebras
    growthRateComparison := GrowthRateComparisonClosed A.growthRateComparison
    endpointClassification := EndpointClassificationClosed A.endpoint
  }

/-- The full analytic Gelfand-Kirillov proof remains the explicit formalization payload. -/
def gelfandKirillovAnalyticFormalizationPayload : String :=
  "Affine algebra growth, Gelfand-Kirillov dimension, finitely generated algebras, growth rate comparison, and endpoint classification."

/--
Closed Gelfand-Kirillov route evidence gives the closed Gelfand-Kirillov route proposition.
-/
theorem gelfand_kirillov_route_closed_from_evidence
    (R : GelfandKirillovRouteObligations) (E : GelfandKirillovRouteEvidence R) :
    GelfandKirillovRouteClosed R := by
  exact And.intro E.affineAlgebraGrowthClosed
    (And.intro E.gelfandKirillovDimensionClosed
      (And.intro E.finitelyGeneratedAlgebrasClosed
        (And.intro E.growthRateComparisonClosed E.endpointClassificationClosed)))

/--
Closed Gelfand-Kirillov analytic foundation evidence produces the Gelfand-Kirillov route
obligation evidence used by this module.
-/
def gelfand_kirillov_route_evidence_from_analytic_foundation
    (A : GelfandKirillovAnalyticFoundation) :
    GelfandKirillovRouteEvidence A.toGelfandKirillovRouteObligations :=
  { affineAlgebraGrowthClosed :=
      affine_algebra_growth_closed_from_evidence A.affineAlgebraGrowth A.affineAlgebraGrowthEvidence
    gelfandKirillovDimensionClosed :=
      gelfand_kirillov_dimension_closed_from_evidence A.gelfandKirillovDimension A.gelfandKirillovDimensionEvidence
    finitelyGeneratedAlgebrasClosed :=
      finitely_generated_algebras_closed_from_evidence A.finitelyGeneratedAlgebras A.finitelyGeneratedAlgebrasEvidence
    growthRateComparisonClosed :=
      growth_rate_comparison_closed_from_evidence A.growthRateComparison A.growthRateComparisonEvidence
    endpointClassificationClosed :=
      endpoint_classification_closed_from_evidence A.endpoint A.endpointEvidence
  }

/--
A closed Gelfand-Kirillov analytic foundation closes the Gelfand-Kirillov route obligation set.
-/
theorem gelfand_kirillov_route_closed_from_analytic_foundation
    (A : GelfandKirillovAnalyticFoundation) :
    GelfandKirillovRouteClosed A.toGelfandKirillovRouteObligations := by
  exact gelfand_kirillov_route_closed_from_evidence
    A.toGelfandKirillovRouteObligations
    (gelfand_kirillov_route_evidence_from_analytic_foundation A)

/--
A Gelfand-Kirillov route for an admitted object supplies the algebraic growth route and
also the Canonical Lane bridge/gate closure required by this package.
-/
structure GelfandKirillovCanonicalLaneRoute (A : AdmissibleClass) where
  obligations : GelfandKirillovRouteObligations
  evidence : GelfandKirillovRouteEvidence obligations
  bridgeClosedFromRoute : bridgeClosed A
  gateClosedFromRoute : gateClosed A

/--
The Gelfand-Kirillov route projects into the constrained Gelfand-Kirillov closure once its
route evidence, bridge, and gate are closed.
-/
theorem gelfand_kirillov_route_yields_constrained_gelfand_kirillov_closure
    (A : AdmissibleClass) (R : GelfandKirillovCanonicalLaneRoute A) :
    ConstrainedGelfandKirillovClosure A := by
  exact And.intro R.bridgeClosedFromRoute R.gateClosedFromRoute

/-- The Gelfand-Kirillov route layer imports Mathlib's Gelfand-Kirillov statement family. -/
theorem mathlib_gelfand_kirillov_statement_available
    (A : Type u) [Algebra ℚ A] [FiniteType ℚ A] :
    MathlibGelfandKirillovStatement A = GelfandKirillovDimension.ofAlgebra A := by
  rfl

/-- The analytic payload is carried as a named formalization route. -/
theorem gelfand_kirillov_analytic_payload_named :
    gelfandKirillovAnalyticFormalizationPayload =
      "Affine algebra growth, Gelfand-Kirillov dimension, finitely generated algebras, growth rate comparison, and endpoint classification." := by
  rfl

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse