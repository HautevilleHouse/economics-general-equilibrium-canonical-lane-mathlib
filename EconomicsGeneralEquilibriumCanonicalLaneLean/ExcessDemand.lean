import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure ExcessDemand where
  consumers : Type u
  commodities : Type v
  preference : ConsumerPreferences
  endowment : Endowment
  priceSystem : PriceSystem
  excessDemandFunction : PriceSystem → (commodities → ℝ)
  homogeneity : ∀ p : PriceSystem, ∀ λ : ℝ, λ > 0 → excessDemandFunction p = excessDemandFunction (λ • p)
  walrasLaw : ∀ p : PriceSystem, ∑ k, p.priceVector k * excessDemandFunction p k = 0
  continuity : Continuous excessDemandFunction

structure ExcessDemandEvidence (Z : ExcessDemand) where
  homogeneityClosed : ∀ p : PriceSystem, ∀ λ : ℝ, λ > 0 → Z.excessDemandFunction p = Z.excessDemandFunction (λ • p)
  walrasLawClosed : ∀ p : PriceSystem, ∑ k, p.priceVector k * Z.excessDemandFunction p k = 0
  continuityClosed : Continuous Z.excessDemandFunction

def ExcessDemandClosed (Z : ExcessDemand) : Prop :=
  (∀ p : PriceSystem, ∀ λ : ℝ, λ > 0 → Z.excessDemandFunction p = Z.excessDemandFunction (λ • p)) ∧
  (∀ p : PriceSystem, ∑ k, p.priceVector k * Z.excessDemandFunction p k = 0) ∧
  Continuous Z.excessDemandFunction

theorem excess_demand_closed_from_evidence (Z : ExcessDemand) (E : ExcessDemandEvidence Z) : ExcessDemandClosed Z := by
  exact And.intro E.homogeneityClosed (And.intro E.walrasLawClosed E.continuityClosed)

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse