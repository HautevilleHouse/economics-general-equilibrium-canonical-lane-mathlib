import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure ProductionSet where
  producers : Type u
  productionPlan : producers → Type v
  technologySet : (p : producers) → Set (productionPlan p)
  closedCone : ∀ p, ConvexCone (productionPlan p) (technologySet p)
  freeDisposal : ∀ p, FreeDisposal (productionPlan p) (technologySet p)

structure ProductionSetEvidence (P : ProductionSet) where
  closedConeClosed : ∀ p, ConvexCone (P.productionPlan p) (P.technologySet p)
  freeDisposalClosed : ∀ p, FreeDisposal (P.productionPlan p) (P.technologySet p)

def ProductionSetClosed (P : ProductionSet) : Prop :=
  (∀ p, ConvexCone (P.productionPlan p) (P.technologySet p)) ∧
  (∀ p, FreeDisposal (P.productionPlan p) (P.technologySet p))

theorem production_set_closed_from_evidence (P : ProductionSet) (E : ProductionSetEvidence P) :
    ProductionSetClosed P := by
  exact And.intro E.closedConeClosed E.freeDisposalClosed

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse