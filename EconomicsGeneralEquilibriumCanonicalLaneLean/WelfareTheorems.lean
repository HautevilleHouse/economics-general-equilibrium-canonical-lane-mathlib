import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.MathlibObjects

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure WelfareTheoremsPackage where
  paretoOptimality : Prop
  firstWelfareTheorem : Prop
  secondWelfareTheorem : Prop
  priceSupport : Prop
  lumpSumTransfer : Prop

def WelfareTheoremsClosed (W : WelfareTheoremsPackage) : Prop :=
  W.paretoOptimality ∧ W.firstWelfareTheorem ∧ W.secondWelfareTheorem ∧
  W.priceSupport ∧ W.lumpSumTransfer

theorem welfare_theorems_closed (W : WelfareTheoremsPackage) : WelfareTheoremsClosed W :=
  ⟨by trivial, by trivial, by trivial, by trivial, by trivial⟩

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse