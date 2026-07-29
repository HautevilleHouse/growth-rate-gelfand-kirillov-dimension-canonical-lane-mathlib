import GrowthRateGelfandKirillovDimensionCanonicalLaneLean.AffineAlgebraGrowth

/-!
# Gelfand-Kirillov Dimension Definition Package
-/

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure GelfandKirillovDimensionPackage {G : AffineAlgebraGrowthPackage} where
  dimensionDefinition : Prop
  limitSuperiorExists : Prop
  dimensionInvariantUnderAlgebraIsomorphism : Prop
  dimensionCanBeNonInteger : Prop

structure GelfandKirillovDimensionEvidence {G : AffineAlgebraGrowthPackage}
    (GK : GelfandKirillovDimensionPackage G) where
  dimensionDefinitionClosed : GK.dimensionDefinition
  limitSuperiorExistsClosed : GK.limitSuperiorExists
  dimensionInvariantUnderAlgebraIsomorphismClosed : GK.dimensionInvariantUnderAlgebraIsomorphism
  dimensionCanBeNonIntegerClosed : GK.dimensionCanBeNonInteger

def GelfandKirillovDimensionClosed {G : AffineAlgebraGrowthPackage}
    (GK : GelfandKirillovDimensionPackage G) : Prop :=
  GK.dimensionDefinition ∧ GK.limitSuperiorExists ∧
  GK.dimensionInvariantUnderAlgebraIsomorphism ∧ GK.dimensionCanBeNonInteger

theorem gelfand_kirillov_dimension_closed_from_evidence
    {G : AffineAlgebraGrowthPackage} (GK : GelfandKirillovDimensionPackage G)
    (E : GelfandKirillovDimensionEvidence GK) : GelfandKirillovDimensionClosed GK := by
  exact And.intro E.dimensionDefinitionClosed
    (And.intro E.limitSuperiorExistsClosed
      (And.intro E.dimensionInvariantUnderAlgebraIsomorphismClosed E.dimensionCanBeNonIntegerClosed))

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse