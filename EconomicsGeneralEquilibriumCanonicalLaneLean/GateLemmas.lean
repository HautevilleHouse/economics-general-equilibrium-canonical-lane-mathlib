import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.marketClearingCondition ∨ A.welfareBounded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse
