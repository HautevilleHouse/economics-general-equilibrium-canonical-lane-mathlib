import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.MathlibObjects

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure ArrowDebreuPackage where
  productionSet : Prop
  profitMaximization : Prop
  consumptionSet : Prop
  utilityMaximization : Prop
  competitiveEquilibrium : Prop
  excessDemandZero : Prop
  fixedPointArgument : Prop
  existenceProof : Prop

structure ArrowDebreuEvidence (T : ArrowDebreuPackage) where
  productionSetClosed : T.productionSet
  profitMaximizationClosed : T.profitMaximization
  consumptionSetClosed : T.consumptionSet
  utilityMaximizationClosed : T.utilityMaximization
  competitiveEquilibriumClosed : T.competitiveEquilibrium
  excessDemandZeroClosed : T.excessDemandZero
  fixedPointArgumentClosed : T.fixedPointArgument
  existenceProofClosed : T.existenceProof

def ArrowDebreuClosed (T : ArrowDebreuPackage) : Prop :=
  T.productionSet ∧ T.profitMaximization ∧ T.consumptionSet ∧
  T.utilityMaximization ∧ T.competitiveEquilibrium ∧ T.excessDemandZero ∧
  T.fixedPointArgument ∧ T.existenceProof

theorem arrow_debreu_closed_from_evidence (T : ArrowDebreuPackage) (E : ArrowDebreuEvidence T) : ArrowDebreuClosed T :=
  And.intro E.productionSetClosed
    (And.intro E.profitMaximizationClosed
      (And.intro E.consumptionSetClosed
        (And.intro E.utilityMaximizationClosed
          (And.intro E.competitiveEquilibriumClosed
            (And.intro E.excessDemandZeroClosed
              (And.intro E.fixedPointArgumentClosed E.existenceProofClosed))))))

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse