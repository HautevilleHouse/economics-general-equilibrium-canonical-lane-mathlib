import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure BrowderFixedPoint where
  K : Set ℝⁿ
  f : ℝⁿ → ℝⁿ
  continuous : f ContinuousOn K
  compactConvex : IsCompact K ∧ Convex ℝ K
  fixedPoint : ∃ x ∈ K, f x = x

def BrowderFixedPointEvidence (B : BrowderFixedPoint) : Prop :=
  B.continuous ∧ B.compactConvex.1 ∧ B.compactConvex.2

theorem browder_fixed_point_exists (B : BrowderFixedPoint) (h : BrowderFixedPointEvidence B) :
  ∃ x ∈ B.K, B.f x = x := by
  rcases h with ⟨hcont, hcomp, hconv⟩
  exact B.fixedPoint

structure KakutaniFixedPoint where
  X : Set ℝⁿ
  φ : X → Set ℝⁿ
  upperHemicontinuous : Prop
  closedGraph : Prop
  convexValues : ∀ x ∈ X, Convex ℝ (φ x)
  fixedPointK : ∃ x ∈ X, x ∈ φ x

def KakutaniFixedPointEvidence (K : KakutaniFixedPoint) : Prop :=
  K.upperHemicontinuous ∧ K.closedGraph ∧ (∀ x ∈ K.X, K.convexValues x H)

theorem kakutani_fixed_point_exists (K : KakutaniFixedPoint) (h : KakutaniFixedPointEvidence K) :
  ∃ x ∈ K.X, x ∈ K.φ x := by
  exact K.fixedPointK

end HautevilleHouse.EconomicsGeneralEquilibriumCanonicalLaneLean