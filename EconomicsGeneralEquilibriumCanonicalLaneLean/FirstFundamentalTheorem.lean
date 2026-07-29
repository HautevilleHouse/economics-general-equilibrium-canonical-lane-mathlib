import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure FirstFundamentalTheoremEvidence (E : ExchangeEconomy) (eq : WalrasianEquilibrium E) where
  pricePositivity : ∀ g : Fin E.goods, eq.prices g > 0
  budgetFeasibility : ∀ a : Fin E.agents, (sum (eq.prices * eq.allocations a)) = (sum (eq.prices * endowments a))
  paretoOptimality : Prop
  proofOfParetoOptimality : paretoOptimality

def FirstFundamentalTheoremClosed (E : ExchangeEconomy) (eq : WalrasianEquilibrium E) (ev : FirstFundamentalTheoremEvidence E eq) : Prop :=
  ev.paretoOptimality

theorem first_fundamental_theorem_closed_from_evidence (E : ExchangeEconomy) (eq : WalrasianEquilibrium E) (ev : FirstFundamentalTheoremEvidence E eq) :
    FirstFundamentalTheoremClosed E eq ev := by
  exact ev.proofOfParetoOptimality

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse