import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure AdmissibleClass where
  object : EquilibriumAdmittedObject
  marketClearingCondition : Prop
  welfareBounded : Prop
  gateWitness : marketClearingCondition ∨ welfareBounded

def admittedClosure (A : AdmissibleClass) : Prop :=
  EquilibriumWitnessClosed A.object ∧ (A.marketClearingCondition ∨ A.welfareBounded)

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse
