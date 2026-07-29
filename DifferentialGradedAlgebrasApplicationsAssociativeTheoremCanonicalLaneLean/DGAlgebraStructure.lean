import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean

structure DGAlgebra (A : Type u) where
  carrier : Type u
  differential : carrier → carrier
  product : carrier → carrier → carrier
  grading : ℕ → carrier → Prop
  d_squared : ∀ x, differential (differential x) = 0
  derivation : ∀ x y, differential (product x y) = product (differential x) y + product x (differential y)
  associativity : ∀ x y z, product (product x y) z = product x (product y z)
  grading_compatible : ∀ n m x y, grading n x → grading m y → grading (n + m) (product x y)

def DGAlgebraClosed (A : DGAlgebra) : Prop :=
  A.d_squared = True ∧ A.derivation = True ∧ A.associativity = True

end DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean
end HautevilleHouse