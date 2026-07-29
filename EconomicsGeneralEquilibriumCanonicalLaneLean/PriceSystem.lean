import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure PriceSystem where
  commodities : Type u
  priceVector : commodities → ℝ
  nonnegativePrices : ∀ k, priceVector k ≥ 0
  notAllZero : ∃ k, priceVector k ≠ 0

structure PriceSystemEvidence (P : PriceSystem) where
  nonnegativePricesClosed : ∀ k, P.priceVector k ≥ 0
  notAllZeroClosed : ∃ k, P.priceVector k ≠ 0

def PriceSystemClosed (P : PriceSystem) : Prop :=
  (∀ k, P.priceVector k ≥ 0) ∧ (∃ k, P.priceVector k ≠ 0)

theorem price_system_closed_from_evidence (P : PriceSystem) (E : PriceSystemEvidence P) : PriceSystemClosed P := by
  exact And.intro E.nonnegativePricesClosed E.notAllZeroClosed

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse