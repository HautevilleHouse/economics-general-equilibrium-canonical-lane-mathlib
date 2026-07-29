import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure SocialWelfareFunction (agents : ℕ) where
  utilities : Vector (ℝ → ℝ) agents
  aggregation : ℝ → ℝ

structure RepresentativeAgentEvidence (E : ExchangeEconomy) where
  aggregationTheorem : ∃ (F : ℝ → ℝ), ∀ allocations, F (sum utilities) = sum (F ∘ utilities)
  homogeneity : Prop
  convergence : Prop
  proof : aggregationTheorem ∧ homogeneity ∧ convergence

def RepresentativeAgentClosed (E : ExchangeEconomy) (ev : RepresentativeAgentEvidence E) : Prop :=
  ev.aggregationTheorem ∧ ev.homogeneity ∧ ev.convergence

theorem representative_agent_closed_from_evidence (E : ExchangeEconomy) (ev : RepresentativeAgentEvidence E) :
    RepresentativeAgentClosed E ev := by
  exact And.intro ev.aggregationTheorem (And.intro ev.homogeneity ev.convergence)

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse