import GrowthRateGelfandKirillovDimensionCanonicalLaneLean.GelfandKirillovAnalyticEvidenceTerms

/-!
# Gelfand-Kirillov Foundational Theorem Inhabitants

This module gives the term-level interface for the foundational analytic theorem
inhabitants. A complete Gelfand-Kirillov analytic formalization supplies these records;
the records then construct the analytic certificates, route evidence, endpoint
statement, and constrained Gelfand-Kirillov closure route.
-/

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure AffineAlgebraGrowthFoundationalInhabitants where
  growthFunctionExists : Prop
  submultiplicative : Prop
  growthFunctionExistsTerm : growthFunctionExists
  submultiplicativeTerm : submultiplicative

structure GelfandKirillovDimensionFoundationalInhabitants where
  dimensionDefined : Prop
  limitSuperiorDefined : Prop
  invariantUnderIsomorphism : Prop
  dimensionDefinedTerm : dimensionDefined
  limitSuperiorDefinedTerm : limitSuperiorDefined
  invariantUnderIsomorphismTerm : invariantUnderIsomorphism

structure FinitelyGeneratedAlgebrasFoundationalInhabitants where
  finitelyGenerated : Prop
  growthFunctionDefined : Prop
  examples : Prop
  finitelyGeneratedTerm : finitelyGenerated
  growthFunctionDefinedTerm : growthFunctionDefined
  examplesTerm : examples

structure GrowthRateComparisonFoundationalInhabitants where
  orderingDefined : Prop
  polynomialVsExponential : Prop
  intermediateGrowth : Prop
  orderingDefinedTerm : orderingDefined
  polynomialVsExponentialTerm : polynomialVsExponential
  intermediateGrowthTerm : intermediateGrowth

structure EndpointFoundationalInhabitants where
  classificationMatchesMathlib : Prop
  endpointStatementsResolved : Prop
  classificationMatchesMathlibTerm : classificationMatchesMathlib
  endpointStatementsResolvedTerm : endpointStatementsResolved

structure GelfandKirillovFoundationalTheoremInhabitants where
  affineAlgebraGrowth : AffineAlgebraGrowthFoundationalInhabitants
  gelfandKirillovDimension : GelfandKirillovDimensionFoundationalInhabitants
  finitelyGeneratedAlgebras : FinitelyGeneratedAlgebrasFoundationalInhabitants
  growthRateComparison : GrowthRateComparisonFoundationalInhabitants
  endpoint : EndpointFoundationalInhabitants

def GelfandKirillovFoundationalTheoremInhabitants.toAnalyticProofCertificate
    (A : GelfandKirillovAnalyticFoundation) (T : GelfandKirillovFoundationalTheoremInhabitants) :
    GelfandKirillovAnalyticProofCertificate A := {
  affineAlgebraGrowth := {
    growthFunctionExists := T.affineAlgebraGrowth.growthFunctionExists
    submultiplicative := T.affineAlgebraGrowth.submultiplicative
    growthFunctionExistsClosed := T.affineAlgebraGrowth.growthFunctionExistsTerm
    submultiplicativeClosed := T.affineAlgebraGrowth.submultiplicativeTerm
    affineAlgebraGrowthEvidence := A.affineAlgebraGrowthEvidence
  }
  gelfandKirillovDimension := {
    dimensionDefined := T.gelfandKirillovDimension.dimensionDefined
    limitSuperiorDefined := T.gelfandKirillovDimension.limitSuperiorDefined
    invariantUnderIsomorphism := T.gelfandKirillovDimension.invariantUnderIsomorphism
    dimensionDefinedClosed := T.gelfandKirillovDimension.dimensionDefinedTerm
    limitSuperiorDefinedClosed := T.gelfandKirillovDimension.limitSuperiorDefinedTerm
    invariantUnderIsomorphismClosed := T.gelfandKirillovDimension.invariantUnderIsomorphismTerm
    gelfandKirillovDimensionEvidence := A.gelfandKirillovDimensionEvidence
  }
  finitelyGeneratedAlgebras := {
    finitelyGenerated := T.finitelyGeneratedAlgebras.finitelyGenerated
    growthFunctionDefined := T.finitelyGeneratedAlgebras.growthFunctionDefined
    examples := T.finitelyGeneratedAlgebras.examples
    finitelyGeneratedClosed := T.finitelyGeneratedAlgebras.finitelyGeneratedTerm
    growthFunctionDefinedClosed := T.finitelyGeneratedAlgebras.growthFunctionDefinedTerm
    examplesClosed := T.finitelyGeneratedAlgebras.examplesTerm
    finitelyGeneratedAlgebrasEvidence := A.finitelyGeneratedAlgebrasEvidence
  }
  growthRateComparison := {
    orderingDefined := T.growthRateComparison.orderingDefined
    polynomialVsExponential := T.growthRateComparison.polynomialVsExponential
    intermediateGrowth := T.growthRateComparison.intermediateGrowth
    orderingDefinedClosed := T.growthRateComparison.orderingDefinedTerm
    polynomialVsExponentialClosed := T.growthRateComparison.polynomialVsExponentialTerm
    intermediateGrowthClosed := T.growthRateComparison.intermediateGrowthTerm
    growthRateComparisonEvidence := A.growthRateComparisonEvidence
  }
  endpoint := {
    classificationMatchesMathlib := T.endpoint.classificationMatchesMathlib
    endpointStatementsResolved := T.endpoint.endpointStatementsResolved
    classificationMatchesMathlibClosed := T.endpoint.classificationMatchesMathlibTerm
    endpointStatementsResolvedClosed := T.endpoint.endpointStatementsResolvedTerm
    endpointEvidence := A.endpointEvidence
  }
}

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse