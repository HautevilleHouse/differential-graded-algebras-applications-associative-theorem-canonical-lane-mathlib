import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.DifferentialGradedAlgebra

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean

structure CohomologyPackage {A : AssociativeAlgebraPackage}
    (D : DifferentialGradedAlgebraPackage A) where
  cocycle : ℕ → Set A.carrier
  cocycleDef : ∀ i : ℕ, cocycle i = {x : A.carrier | D.differential x = A.zero ∧ x ∈ D.grading i}
  coboundary : ℕ → Set A.carrier
  coboundaryDef : ∀ i : ℕ, coboundary i = {x : A.carrier | ∃ y : A.carrier, D.differential y = x ∧ y ∈ D.grading (i-1)}
  cohomology : ℕ → Set (Set A.carrier)
  cohomologyDef : ∀ i : ℕ, cohomology i = {s : Set A.carrier | ∃ x : A.carrier, x ∈ cocycle i ∧ s = {y : A.carrier | A.addition (A.addition x (A.zero)) y = A.zero} }  -- quotient by coboundary

structure CohomologyEvidence {A : AssociativeAlgebraPackage}
    {D : DifferentialGradedAlgebraPackage A} (C : CohomologyPackage D) where
  cocycleDefClosed : C.cocycleDef
  coboundaryDefClosed : C.coboundaryDef
  cohomologyDefClosed : C.cohomologyDef

def CohomologyClosed {A : AssociativeAlgebraPackage}
    {D : DifferentialGradedAlgebraPackage A} (C : CohomologyPackage D) : Prop :=
  C.cocycleDef ∧ C.coboundaryDef ∧ C.cohomologyDef

theorem cohomology_closed_from_evidence {A : AssociativeAlgebraPackage}
    {D : DifferentialGradedAlgebraPackage A} (C : CohomologyPackage D)
    (E : CohomologyEvidence C) : CohomologyClosed C := by
  exact And.intro E.cocycleDefClosed (And.intro E.coboundaryDefClosed E.cohomologyDefClosed)

end DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean
end HautevilleHouse