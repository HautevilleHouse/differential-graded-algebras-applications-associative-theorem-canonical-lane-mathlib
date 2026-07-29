import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.AssociativeAlgebra

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean

structure DifferentialGradedAlgebraPackage (A : AssociativeAlgebraPackage) where
  grading : ℕ → Set A.carrier
  differential : A.carrier → A.carrier
  diffLinear : ∀ x y : A.carrier, differential (A.addition x y) = A.addition (differential x) (differential y)
  diffSq : ∀ x : A.carrier, differential (differential x) = A.zero
  gradedMul : ∀ a b : A.carrier, ∀ i j : ℕ, a ∈ grading i → b ∈ grading j →
    A.multiplication a b ∈ grading (i + j)
  gradedDiff : ∀ a : A.carrier, ∀ i : ℕ, a ∈ grading i → differential a ∈ grading (i + 1)
  gradedDiffSq : ∀ a : A.carrier, ∀ i : ℕ, a ∈ grading i → differential (differential a) = A.zero

structure DifferentialGradedAlgebraEvidence {A : AssociativeAlgebraPackage}
    (D : DifferentialGradedAlgebraPackage A) where
  diffLinearClosed : D.diffLinear
  diffSqClosed : D.diffSq
  gradedMulClosed : D.gradedMul
  gradedDiffClosed : D.gradedDiff
  gradedDiffSqClosed : D.gradedDiffSq

def DifferentialGradedAlgebraClosed {A : AssociativeAlgebraPackage}
    (D : DifferentialGradedAlgebraPackage A) : Prop :=
  D.diffLinear ∧ D.diffSq ∧ D.gradedMul ∧ D.gradedDiff ∧ D.gradedDiffSq

theorem differential_graded_algebra_closed_from_evidence {A : AssociativeAlgebraPackage}
    (D : DifferentialGradedAlgebraPackage A) (E : DifferentialGradedAlgebraEvidence D) :
    DifferentialGradedAlgebraClosed D := by
  exact And.intro E.diffLinearClosed
    (And.intro E.diffSqClosed
      (And.intro E.gradedMulClosed
        (And.intro E.gradedDiffClosed E.gradedDiffSqClosed)))

end DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean
end HautevilleHouse