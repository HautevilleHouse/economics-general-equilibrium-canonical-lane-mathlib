import EconomicsGeneralEquilibriumCanonicalLaneLean.WelfareTheorems

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure ExistenceEquilibriumPackage {C : CommoditySpacePackage}
    (E : ArrowDebreuEquilibriumPackage C) where
  excessDemandContinuity : Prop
  walrasLaw : Prop
  fixedPointArgument : Prop
  priceNormalization : Prop
  equilibriumExists : Prop

structure ExistenceEquilibriumEvidence {C : CommoditySpacePackage}
    {E : ArrowDebreuEquilibriumPackage C} (X : ExistenceEquilibriumPackage E) where
  excessDemandContinuityClosed : X.excessDemandContinuity
  walrasLawClosed : X.walrasLaw
  fixedPointArgumentClosed : X.fixedPointArgument
  priceNormalizationClosed : X.priceNormalization
  equilibriumExistsClosed : X.equilibriumExists

def ExistenceEquilibriumClosed {C : CommoditySpacePackage}
    {E : ArrowDebreuEquilibriumPackage C} (X : ExistenceEquilibriumPackage E) : Prop :=
  X.excessDemandContinuity ∧ X.walrasLaw ∧ X.fixedPointArgument ∧ X.priceNormalization ∧ X.equilibriumExists

theorem existence_equilibrium_closed_from_evidence
    {C : CommoditySpacePackage} {E : ArrowDebreuEquilibriumPackage C}
    (X : ExistenceEquilibriumPackage E) (Ev : ExistenceEquilibriumEvidence X) :
    ExistenceEquilibriumClosed X := by
  exact And.intro Ev.excessDemandContinuityClosed
    (And.intro Ev.walrasLawClosed
      (And.intro Ev.fixedPointArgumentClosed
        (And.intro Ev.priceNormalizationClosed Ev.equilibriumExistsClosed)))

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse
