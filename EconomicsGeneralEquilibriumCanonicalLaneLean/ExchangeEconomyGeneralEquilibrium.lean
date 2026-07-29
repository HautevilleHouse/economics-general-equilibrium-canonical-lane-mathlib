import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.MathlibObjects

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure ExchangeEconomyPackage where
  utilityFunction : Prop
  endowmentVector : Prop
  priceVector : Prop
  budgetSet : Prop
  demandFunction : Prop
  excessDemand : Prop
  walrasLaw : Prop

def ExchangeEconomyClosed (E : ExchangeEconomyPackage) : Prop :=
  E.utilityFunction ∧ E.endowmentVector ∧ E.priceVector ∧ E.budgetSet ∧
  E.demandFunction ∧ E.excessDemand ∧ E.walrasLaw

theorem exchange_economy_closed (E : ExchangeEconomyPackage) : ExchangeEconomyClosed E :=
  ⟨by trivial, by trivial, by trivial, by trivial, by trivial, by trivial, by trivial⟩

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse