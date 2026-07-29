import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure EquilibriumSpace where
  goods : Type
  prices : Type
  preferences : Type
  endowments : Type
  topology : TopologicalSpace goods

structure EquilibriumAdmittedObject where
  space : EquilibriumSpace
  competitiveEquilibrium : Prop
  paretoOptimal : Prop
  conclusion : competitiveEquilibrium ∧ paretoOptimal

def EquilibriumWitnessClosed (O : EquilibriumAdmittedObject) : Prop :=
  O.competitiveEquilibrium ∧ O.paretoOptimal

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse
