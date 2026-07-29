import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsGeneralEquilibriumCanonicalLaneLean

structure ConsumerPreferences where
  consumers : Type u
  consumptionSet : consumers → Type v
  preferenceRelation : (c : consumers) → consumptionSet c → consumptionSet c → Prop
  completeness : ∀ c x y, preferenceRelation c x y ∨ preferenceRelation c y x
  transitivity : ∀ c x y z, preferenceRelation c x y → preferenceRelation c y z → preferenceRelation c x z
  continuity : ∀ c, Continuous (preferenceRelation c)
  strictConvexity : ∀ c x y z, preferenceRelation c x z → preferenceRelation c y z → x ≠ y →
    (∀ t : ℝ, t > 0 → t < 1 → preferenceRelation c (t • x + (1 - t) • y) z)

structure ConsumerPreferencesEvidence (P : ConsumerPreferences) where
  completenessClosed : ∀ c x y, P.preferenceRelation c x y ∨ P.preferenceRelation c y x
  transitivityClosed : ∀ c x y z, P.preferenceRelation c x y → P.preferenceRelation c y z → P.preferenceRelation c x z
  continuityClosed : ∀ c, Continuous (P.preferenceRelation c)
  strictConvexityClosed : ∀ c x y z, P.preferenceRelation c x z → P.preferenceRelation c y z → x ≠ y →
    (∀ t : ℝ, t > 0 → t < 1 → P.preferenceRelation c (t • x + (1 - t) • y) z)

def ConsumerPreferencesClosed (P : ConsumerPreferences) : Prop :=
  (∀ c x y, P.preferenceRelation c x y ∨ P.preferenceRelation c y x) ∧
  (∀ c x y z, P.preferenceRelation c x y → P.preferenceRelation c y z → P.preferenceRelation c x z) ∧
  (∀ c, Continuous (P.preferenceRelation c)) ∧
  (∀ c x y z, P.preferenceRelation c x z → P.preferenceRelation c y z → x ≠ y →
    (∀ t : ℝ, t > 0 → t < 1 → P.preferenceRelation c (t • x + (1 - t) • y) z))

theorem consumer_preferences_closed_from_evidence (P : ConsumerPreferences) (E : ConsumerPreferencesEvidence P) :
    ConsumerPreferencesClosed P := by
  exact And.intro E.completenessClosed (And.intro E.transitivityClosed (And.intro E.continuityClosed E.strictConvexityClosed))

end EconomicsGeneralEquilibriumCanonicalLaneLean
end HautevilleHouse