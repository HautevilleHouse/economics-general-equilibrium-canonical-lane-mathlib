import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure WalrasianEconomy where
  commodities : ℕ
  consumers : ℕ
  endowments : Fin consumers → ℝ^commodities
  demands : Fin consumers → ℝ^commodities → ℝ^commodities
  prices : ℝ^commodities

def WalrasLaw (W : WalrasianEconomy) : Prop :=
  (∑ i, W.demands i W.prices) • W.prices = (∑ i, W.endowments i) • W.prices

structure WalrasLawEvidence (W : WalrasianEconomy) where
  budgetConstraints : ∀ i : Fin W.consumers, (W.demands i W.prices) • W.prices = (W.endowments i) • W.prices

theorem walras_law_holds (W : WalrasianEconomy) (h : WalrasLawEvidence W) : WalrasLaw W := by
  dsimp [WalrasLaw]
  calc
    (∑ i, W.demands i W.prices) • W.prices = ∑ i, (W.demands i W.prices • W.prices) := by
      rw [Finset.sum_smul]
    _ = ∑ i, (W.endowments i • W.prices) := by
      simp [h.budgetConstraints]
    _ = (∑ i, W.endowments i) • W.prices := by symm; exact Finset.sum_smul.symm

end HautevilleHouse.EconomicsGeneralEquilibriumCanonicalLaneLean