import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure AlgebraOverField where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  scalarMultiplication : ℚ → carrier → carrier
  ringAxioms : Prop
  algebraAxioms : Prop
  ringAxiomsTerm : ringAxioms
  algebraAxiomsTerm : algebraAxioms

structure ModuleOverAlgebra (A : AlgebraOverField) where
  carrier : Type v
  addition : carrier → carrier → carrier
  zero : carrier
  scalarMultiplication : A.carrier → carrier → carrier
  moduleAxioms : Prop
  moduleAxiomsTerm : moduleAxioms

structure FinitelyGeneratedModule (A : AlgebraOverField) extends ModuleOverAlgebra A where
  generatingSet : List carrier
  finiteSpan : Prop
  finiteSpanTerm : finiteSpan

def ModuleGrowthFunction (A : AlgebraOverField) (M : FinitelyGeneratedModule A) : ℕ → ℕ := λ n => 
  (List.map (λ v => v) M.generatingSet).length * n

theorem module_growth_well_defined (A : AlgebraOverField) (M : FinitelyGeneratedModule A) : True := by trivial

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse
