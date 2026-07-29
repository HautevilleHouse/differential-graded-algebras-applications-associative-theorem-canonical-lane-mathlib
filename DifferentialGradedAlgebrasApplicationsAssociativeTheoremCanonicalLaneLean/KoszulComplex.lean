import canonicalLaneMathlib.AdmissibleClass
import DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.DGAlgebraStructure
import DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.HomologicalAlgebra

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean

structure KoszulComplex (R : Type u) [CommRing R] (x : R) where
  chain_complex : ChainComplex R
  differential_operator : ℕ → (R → R)
  acyclicity : ∀ n, HomologyGroup chain_complex n

def KoszulComplexClosed (K : KoszulComplex R x) : Prop :=
  K.acyclicity = True

end DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean
end HautevilleHouse