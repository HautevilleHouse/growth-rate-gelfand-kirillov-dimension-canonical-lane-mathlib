import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrowthRateGelfandKirillovDimensionCanonicalLaneLean

structure FilteredAlgebra (A : AlgebraOverField) where
  filtration : ℕ → Set A.carrier
  filtrationProperties : Prop
  filtrationPropertiesTerm : filtrationProperties

def AssociatedGradedAlgebra (A : AlgebraOverField) (F : FilteredAlgebra A) : AlgebraOverField := A

def GrowthFunctionFromFiltration (A : AlgebraOverField) (F : FilteredAlgebra A) : ℕ → ℕ := λ n => 
  Set.ncard (F.filtration n)

theorem wedge_product_growth (A : AlgebraOverField) (F : FilteredAlgebra A) (n : ℕ) : 
  GrowthFunctionFromFiltration A F n ≤ (Set.ncard (A.carrier)) ^ n := by
  sorry

theorem GK_dimension_via_wedge_product (A : AlgebraOverField) (F : FilteredAlgebra A) : 
  (∃ d : ℕ, ∀ n, GrowthFunctionFromFiltration A F n ≤ n ^ d) ↔ 
  ∃ dim : GelfandKirillovDimension A, dim.finite := by
  constructor
  · intro h
    obtain ⟨d, hd⟩ := h
    refine ⟨{ dim := (d : ℝ), finite := True, infinite := False, 
      dimFiniteTerm := λ _ => by norm_num, dimInfiniteTerm := λ h => False.elim h, 
      dimAssigned := ?_ }, True.intro⟩
    simp [GelfandKirillovDimensionOfSequence]
  · intro h
    obtain ⟨dim, hdim⟩ := h
    refine ⟨⌈dim.dim⌉, λ n => ?_⟩
    sorry

end GrowthRateGelfandKirillovDimensionCanonicalLaneLean
end HautevilleHouse
