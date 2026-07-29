import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure PreferenceRelation (A : Type u) where
  carrier : A → A → Prop
  completeness : ∀ x y : A, carrier x y ∨ carrier y x
  transitivity : ∀ x y z : A, carrier x y → carrier y z → carrier x z

structure UtilityFunction (A : Type u) (pref : PreferenceRelation A) where
  u : A → ℝ
  representation : ∀ x y : A, pref.carrier x y ↔ u x ≥ u y

structure AgentPreferencesPackage where
  AgentType : Type u
  consumptionSet : AgentType → Type v
  preference : (a : AgentType) → PreferenceRelation (consumptionSet a)
  utility : (a : AgentType) → UtilityFunction (consumptionSet a) (preference a)

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse