import EconomicsGeneralEquilibriumCanonicalLaneLean.CommoditySpace

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure ArrowDebreuEquilibriumPackage (C : CommoditySpacePackage) where
  priceSystem : C.Price -> ℝ
  allocation : C.Consumer -> C.CommodityBundle
  marketClearing : Prop
  utilityMaximization : Prop
  profitMaximization : Prop
  equilibriumConditions : Prop

structure ArrowDebreuEquilibriumEvidence {C : CommoditySpacePackage}
    (E : ArrowDebreuEquilibriumPackage C) where
  marketClearingClosed : E.marketClearing
  utilityMaximizationClosed : E.utilityMaximization
  profitMaximizationClosed : E.profitMaximization
  equilibriumConditionsClosed : E.equilibriumConditions

def ArrowDebreuEquilibriumClosed {C : CommoditySpacePackage}
    (E : ArrowDebreuEquilibriumPackage C) : Prop :=
  E.marketClearing ∧ E.utilityMaximization ∧ E.profitMaximization ∧ E.equilibriumConditions

theorem arrow_debreu_equilibrium_closed_from_evidence
    {C : CommoditySpacePackage} (E : ArrowDebreuEquilibriumPackage C)
    (Ev : ArrowDebreuEquilibriumEvidence E) : ArrowDebreuEquilibriumClosed E := by
  exact And.intro Ev.marketClearingClosed
    (And.intro Ev.utilityMaximizationClosed
      (And.intro Ev.profitMaximizationClosed Ev.equilibriumConditionsClosed))

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse
