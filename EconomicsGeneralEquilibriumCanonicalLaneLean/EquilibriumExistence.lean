import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure EquilibriumExistencePackage where
  excessDemandFunction : Prop
  fixedPointExistence : Prop
  priceNormalization : Prop
  excessDemandContinuity : Prop
  walrasLaw : Prop
  existenceProved : Prop

structure EquilibriumExistenceEvidence (E : EquilibriumExistencePackage) where
  excessDemandFunctionClosed : E.excessDemandFunction
  fixedPointExistenceClosed : E.fixedPointExistence
  priceNormalizationClosed : E.priceNormalization
  excessDemandContinuityClosed : E.excessDemandContinuity
  walrasLawClosed : E.walrasLaw
  existenceProvedClosed : E.existenceProved

def EquilibriumExistenceClosed (E : EquilibriumExistencePackage) : Prop :=
  E.excessDemandFunction ∧ E.fixedPointExistence ∧ E.priceNormalization ∧ E.excessDemandContinuity ∧ E.walrasLaw ∧ E.existenceProved

theorem equilibrium_existence_closed_from_evidence (E : EquilibriumExistencePackage) (Ev : EquilibriumExistenceEvidence E) :
    EquilibriumExistenceClosed E := by
  exact And.intro Ev.excessDemandFunctionClosed
    (And.intro Ev.fixedPointExistenceClosed
      (And.intro Ev.priceNormalizationClosed
        (And.intro Ev.excessDemandContinuityClosed
          (And.intro Ev.walrasLawClosed Ev.existenceProvedClosed))))

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse
