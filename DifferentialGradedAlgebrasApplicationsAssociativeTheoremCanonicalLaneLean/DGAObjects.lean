import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheorem

structure DGAlgebra where
  carrier : Type u
  degree : ℕ → Type u
  differential : (n : ℕ) → degree n → degree (n+1)
  product : (m n : ℕ) → degree m → degree n → degree (m+n)
  dSquaredZero : ∀ n (x : degree n), differential (n+1) (differential n x) = 0
  leibnizRule : ∀ m n (a : degree m) (b : degree n),
    differential (m+n) (product m n a b) =
    product (m+1) n (differential m a) b +
    (-1)^m · product m (n+1) a (differential n b)
  associativity : ∀ m n p (a : degree m) (b : degree n) (c : degree p),
    product (m+n) p (product m n a b) c = product m (n+p) a (product n p b c)

structure DGAlgebraAdmittedObject where
  dgAlgebra : DGAlgebra
  augmented : Prop
  homologyTrivialInLowDegrees : Prop
  conclusion : augmented ∧ homologyTrivialInLowDegrees

structure DGEndgameState where
  object : DGAlgebraAdmittedObject

def DGWitnessClosed (O : DGAlgebraAdmittedObject) : Prop :=
  O.augmented ∧ O.homologyTrivialInLowDegrees

end DifferentialGradedAlgebrasApplicationsAssociativeTheorem
end HautevilleHouse
