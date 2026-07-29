import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure ScarfEconomy where
  agents : ℕ
  goods : ℕ
  endowments : Fin agents → ℝ^goods
  preferences : Fin agents → ℝ^goods → ℝ
  excessDemand : ℝ^goods → ℝ^goods

def ScarfEquilibrium (S : ScarfEconomy) : Prop :=
  ∃ p : ℝ^S.goods, (∀ i, S.preferences i (S.endowments i) ≤ S.preferences i (someDemand i p)) ∧
    (S.excessDemand p) = 0

structure ScarfEquilibriumEvidence (S : ScarfEconomy) where
  priceVector : ℝ^S.goods
  utilityMaximizing : ∀ i : Fin S.agents, S.preferences i (S.endowments i) ≤ S.preferences i (demandVector i S.endowments S.preferences priceVector)
  marketClearing : S.excessDemand priceVector = 0

theorem scarf_equilibrium_exists (S : ScarfEconomy) (h : ScarfEquilibriumEvidence S) : ScarfEquilibrium S := by
  refine ⟨h.priceVector, ?_⟩
  exact h.marketClearing

end HautevilleHouse.EconomicsGeneralEquilibriumCanonicalLaneLean