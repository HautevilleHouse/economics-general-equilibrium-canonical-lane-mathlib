import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure EdgeworthBoxPackage where
  twoGoodEconomy : Prop
  contractCurve : Prop
  paretoSet : Prop
  initialEndowment : Prop
  coreAllocation : Prop
  edgeworthBoxProved : Prop

structure EdgeworthBoxEvidence (E : EdgeworthBoxPackage) where
  twoGoodEconomyClosed : E.twoGoodEconomy
  contractCurveClosed : E.contractCurve
  paretoSetClosed : E.paretoSet
  initialEndowmentClosed : E.initialEndowment
  coreAllocationClosed : E.coreAllocation
  edgeworthBoxProvedClosed : E.edgeworthBoxProved

def EdgeworthBoxClosed (E : EdgeworthBoxPackage) : Prop :=
  E.twoGoodEconomy ∧ E.contractCurve ∧ E.paretoSet ∧ E.initialEndowment ∧ E.coreAllocation ∧ E.edgeworthBoxProved

theorem edgeworth_box_closed_from_evidence (E : EdgeworthBoxPackage) (Ev : EdgeworthBoxEvidence E) :
    EdgeworthBoxClosed E := by
  exact And.intro Ev.twoGoodEconomyClosed
    (And.intro Ev.contractCurveClosed
      (And.intro Ev.paretoSetClosed
        (And.intro Ev.initialEndowmentClosed
          (And.intro Ev.coreAllocationClosed Ev.edgeworthBoxProvedClosed))))

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse
