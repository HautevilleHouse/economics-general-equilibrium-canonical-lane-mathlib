import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  EquilibriumWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse
