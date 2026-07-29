import canonicalLaneMathlib.AdmissibleClass
import .DGAlgebraStructure

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean

structure DGHochschildComplex (A : DGAlgebra ℤ) where
  chainGroups : ℤ → Type v
  boundaryMap : ∀ n, chainGroups n → chainGroups (n-1)
  boundarySqZero : ∀ n, ∀ x, boundaryMap (n-1) (boundaryMap n x) = 0

structure DGHochschildHomologyPackage (A : DGAlgebra ℤ) where
  complex : DGHochschildComplex A
  homologyGroups : ℤ → Type v
  computationClosed : Prop
  moritaInvariance : Prop

structure DGHochschildHomologyEvidence (A : DGAlgebra ℤ) (P : DGHochschildHomologyPackage A) where
  computationClosedClosed : P.computationClosed
  moritaInvarianceClosed : P.moritaInvariance

def DGHochschildHomologyClosed (A : DGAlgebra ℤ) (P : DGHochschildHomologyPackage A) : Prop :=
  P.computationClosed ∧ P.moritaInvariance

theorem dg_hochschild_homology_closed_from_evidence (A : DGAlgebra ℤ) (P : DGHochschildHomologyPackage A) (E : DGHochschildHomologyEvidence A P) : DGHochschildHomologyClosed A P := by
  exact And.intro E.computationClosedClosed E.moritaInvarianceClosed

end DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean
end HautevilleHouse