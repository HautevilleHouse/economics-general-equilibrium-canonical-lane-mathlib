import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure Endowment where
  consumers : Type u
  commodities : Type v
  initialEndowment : consumers → commodities → ℝ
  totalEndowmentFinite : ∑ c in Set.univ, (∑ k, initialEndowment c k) < ∞
  nonnegativeEndowment : ∀ c k, initialEndowment c k ≥ 0

structure EndowmentEvidence (E : Endowment) where
  totalEndowmentFiniteClosed : ∑ c in Set.univ, (∑ k, E.initialEndowment c k) < ∞
  nonnegativeEndowmentClosed : ∀ c k, E.initialEndowment c k ≥ 0

def EndowmentClosed (E : Endowment) : Prop :=
  (∑ c in Set.univ, (∑ k, E.initialEndowment c k) < ∞) ∧
  (∀ c k, E.initialEndowment c k ≥ 0)

theorem endowment_closed_from_evidence (E : Endowment) (Ev : EndowmentEvidence E) : EndowmentClosed E := by
  exact And.intro Ev.totalEndowmentFiniteClosed Ev.nonnegativeEndowmentClosed

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse