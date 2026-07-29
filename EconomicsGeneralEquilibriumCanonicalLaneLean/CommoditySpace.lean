import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure CommoditySpacePackage where
  Commodity : Type
  Price : Type
  Consumer : Type
  Producer : Type
  CommodityBundle : Type
  preference : Consumer -> CommodityBundle -> CommodityBundle -> Prop
  productionSet : Producer -> Set CommodityBundle
  initialEndowment : Consumer -> CommodityBundle
  commoditySpaceFiniteDimensional : Prop
  preferenceContinuous : Prop
  productionSetClosed : Prop

def CommoditySpaceClosed (C : CommoditySpacePackage) : Prop :=
  C.commoditySpaceFiniteDimensional ∧ C.preferenceContinuous ∧ C.productionSetClosed

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse
