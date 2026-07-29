import DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.DGAObjects

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheorem

structure AssociativeAlgebraStructure (A : DGAlgebra) where
  unit : (n : ℕ) → (A.degree n) → A.degree n
  unitProduct : ∀ n (x : A.degree n), A.product n 0 x (unit 0) = x
  productUnit : ∀ n (x : A.degree n), A.product 0 n (unit 0) x = x

def AssociatedAlgebraClosed (A : DGAlgebra) (assoc : AssociativeAlgebraStructure A) : Prop :=
  (∀ n (x : A.degree n), A.product n 0 x (assoc.unit 0) = x) ∧
  (∀ n (x : A.degree n), A.product 0 n (assoc.unit 0) x = x)

theorem associative_algebra_closed_from_evidence (A : DGAlgebra) (assoc : AssociativeAlgebraStructure A) :
  AssociatedAlgebraClosed A assoc :=
  And.intro assoc.unitProduct assoc.productUnit

end DifferentialGradedAlgebrasApplicationsAssociativeTheorem
end HautevilleHouse
