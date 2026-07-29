import GrowthRateGelfandKirillovDimensionCanonicalLaneLean.GelfandKirillovFoundationalTheoremInhabitants

/-!
# Gelfand-Kirillov Deep Analytic Construction

This module refines the foundational inhabitants into a deeper analytic
construction interface. The construction names the affine algebra growth,
Gelfand-Kirillov dimension, finitely generated algebras, growth rate comparison,
and endpoint classification ingredients that feed the already checked
Gelfand-Kirillov route.

The module is intentionally term-level: each analytic construction supplies
Lean inhabitants for its named analytic components and maps them into the
foundational theorem inhabitants used by the route closure.
-/

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure AffineAlgebraGrowthConstruction where
  algebraType : Type u
  generatingSet : Type v
  growthFunction : Nat -> Nat
  growthFunctionDefined : Prop
  submultiplicativeGrowth : Prop
  growthFunctionDefinedTerm : growthFunctionDefined
  submultiplicativeGrowthTerm : submultiplicativeGrowth

def AffineAlgebraGrowthConstruction.toFoundational
    (C : AffineAlgebraGrowthConstruction) : AffineAlgebraGrowthFoundationalInhabitants := {
  growthFunctionExists := C.growthFunctionDefined
  submultiplicative := C.submultiplicativeGrowth
  growthFunctionExistsTerm := C.growthFunctionDefinedTerm
  submultiplicativeTerm := C.submultiplicativeGrowthTerm
}

structure GelfandKirillovDimensionConstruction where
  dimensionDefinition : Prop
  limitSuperiorDefined : Prop
  dimensionInvariantUnderAlgebraIsomorphism : Prop
  dimensionDefinitionTerm : dimensionDefinition
  limitSuperiorDefinedTerm : limitSuperiorDefined
  dimensionInvariantUnderAlgebraIsomorphismTerm : dimensionInvariantUnderAlgebraIsomorphism

def GelfandKirillovDimensionConstruction.toFoundational
    (C : GelfandKirillovDimensionConstruction) : GelfandKirillovDimensionFoundationalInhabitants := {
  dimensionDefined := C.dimensionDefinition
  limitSuperiorDefined := C.limitSuperiorDefined
  invariantUnderIsomorphism := C.dimensionInvariantUnderAlgebraIsomorphism
  dimensionDefinedTerm := C.dimensionDefinitionTerm
  limitSuperiorDefinedTerm := C.limitSuperiorDefinedTerm
  invariantUnderIsomorphismTerm := C.dimensionInvariantUnderAlgebraIsomorphismTerm
}

structure FinitelyGeneratedAlgebrasConstruction where
  finitelyGeneratedCondition : Prop
  finiteGenerationGuaranteesGrowthFunctionDefined : Prop
  examplesOfFiniteAndInfiniteGrowth : Prop
  finitelyGeneratedConditionTerm : finitelyGeneratedCondition
  finiteGenerationGuaranteesGrowthFunctionDefinedTerm : finiteGenerationGuaranteesGrowthFunctionDefined
  examplesOfFiniteAndInfiniteGrowthTerm : examplesOfFiniteAndInfiniteGrowth

def FinitelyGeneratedAlgebrasConstruction.toFoundational
    (C : FinitelyGeneratedAlgebrasConstruction) : FinitelyGeneratedAlgebrasFoundationalInhabitants := {
  finitelyGenerated := C.finitelyGeneratedCondition
  growthFunctionDefined := C.finiteGenerationGuaranteesGrowthFunctionDefined
  examples := C.examplesOfFiniteAndInfiniteGrowth
  finitelyGeneratedTerm := C.finitelyGeneratedConditionTerm
  growthFunctionDefinedTerm := C.finiteGenerationGuaranteesGrowthFunctionDefinedTerm
  examplesTerm := C.examplesOfFiniteAndInfiniteGrowthTerm
}

structure GrowthRateComparisonConstruction where
  growthRateOrderingDefined : Prop
  polynomialVsExponentialGrowth : Prop
  intermediateGrowthPossible : Prop
  growthRateOrderingDefinedTerm : growthRateOrderingDefined
  polynomialVsExponentialGrowthTerm : polynomialVsExponentialGrowth
  intermediateGrowthPossibleTerm : intermediateGrowthPossible

def GrowthRateComparisonConstruction.toFoundational
    (C : GrowthRateComparisonConstruction) : GrowthRateComparisonFoundationalInhabitants := {
  orderingDefined := C.growthRateOrderingDefined
  polynomialVsExponential := C.polynomialVsExponentialGrowth
  intermediateGrowth := C.intermediateGrowthPossible
  orderingDefinedTerm := C.growthRateOrderingDefinedTerm
  polynomialVsExponentialTerm := C.polynomialVsExponentialGrowthTerm
  intermediateGrowthTerm := C.intermediateGrowthPossibleTerm
}

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse