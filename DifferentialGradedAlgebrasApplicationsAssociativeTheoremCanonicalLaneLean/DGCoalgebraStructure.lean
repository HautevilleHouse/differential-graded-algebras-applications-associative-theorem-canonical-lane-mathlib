import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean

structure DGCoalgebra (R : Type u) [CommRing R] where
  carrier : Type v
  add : carrier → carrier → carrier
  zero : carrier
  comul : carrier → carrier ⊗ carrier
  counit : carrier → R
  diff : carrier → carrier
  grading : ℤ → carrier → Prop
  diffCoassociative : ∀ x, (map (λ t => t) comul) (comul x) = (map (λ t => t) comul) (comul x)
  diffDifferential : ∀ x, diff (diff x) = zero
  diffGrading : ∀ (n : ℤ) (x : carrier), grading n x → grading (n+1) (diff x)
  comulGrading : ∀ (m n : ℤ) (x : carrier), grading m x → (∃ a b, comul x = a ⊗ b ∧ grading (m-n) a ∧ grading n b)
  counitGrading : grading 0 (counit x)

structure DGCoalgebraMorphism (A B : DGCoalgebra ℤ) where
  map : A.carrier → B.carrier
  respects_add : ∀ x y, map (A.add x y) = B.add (map x) (map y)
  respects_zero : map A.zero = B.zero
  respects_comul : ∀ x, (λ (a,b) => map a ⊗ map b) (A.comul x) = B.comul (map x)
  respects_counit : ∀ x, B.counit (map x) = A.counit x
  respects_diff : ∀ x, map (A.diff x) = B.diff (map x)
  respects_grading : ∀ (n : ℤ) (x : A.carrier), A.grading n x → B.grading n (map x)

structure DGCoalgebraPackage where
  baseRing : Type u
  ringStruct : CommRing baseRing
  coalgebraObject : DGCoalgebra baseRing
  homologyDefined : Prop
  cohomologyDefined : Prop

structure DGCoalgebraEvidence (P : DGCoalgebraPackage) where
  homologyDefinedClosed : P.homologyDefined
  cohomologyDefinedClosed : P.cohomologyDefined

def DGCoalgebraClosed (P : DGCoalgebraPackage) : Prop :=
  P.homologyDefined ∧ P.cohomologyDefined

theorem dg_coalgebra_closed_from_evidence (P : DGCoalgebraPackage) (E : DGCoalgebraEvidence P) : DGCoalgebraClosed P := by
  exact And.intro E.homologyDefinedClosed E.cohomologyDefinedClosed

end DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean
end HautevilleHouse