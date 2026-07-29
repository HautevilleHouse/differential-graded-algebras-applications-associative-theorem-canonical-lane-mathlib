import canonicalLaneMathlib.AdmissibleClass
import DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.DGAlgebraStructure

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean

structure SpectralSequence where
  pages : ℕ → (ℕ × ℕ → Prop)
  differentials : ℕ → (ℕ × ℕ → Prop)
  convergence : Prop
  page_relationships : ∀ r p q, differentials r (p,q) → pages (r+1) (p,q) → pages r (p,q)

def SpectralSequenceClosed (S : SpectralSequence) : Prop :=
  S.convergence

end DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean
end HautevilleHouse