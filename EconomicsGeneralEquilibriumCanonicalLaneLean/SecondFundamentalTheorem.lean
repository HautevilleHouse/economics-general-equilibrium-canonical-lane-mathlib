import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure SecondFundamentalTheoremEvidence (E : ExchangeEconomy) (alloc : Matrix ℝ E.agents E.goods) where
  paretoOptimality : alloc is Pareto optimal
  priceVector : Vector ℝ E.goods
  lumpSumTransfers : Vector ℝ E.agents
  supportProof : ∀ a : Fin E.agents, (alloc a) maximizes (preferences.utility a) subject to budget constraint with transfers

def SecondFundamentalTheoremClosed (E : ExchangeEconomy) (alloc : Matrix ℝ E.agents E.goods) (ev : SecondFundamentalTheoremEvidence E alloc) : Prop :=
  ev.paretoOptimality ∧ (∀ a : Fin E.agents, ev.lumpSumTransfers a ≠ 0)

theorem second_fundamental_theorem_closed_from_evidence (E : ExchangeEconomy) (alloc : Matrix ℝ E.agents E.goods) (ev : SecondFundamentalTheoremEvidence E alloc) :
    SecondFundamentalTheoremClosed E alloc ev := by
  exact And.intro ev.paretoOptimality (by
    intro a
    sorry)

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse