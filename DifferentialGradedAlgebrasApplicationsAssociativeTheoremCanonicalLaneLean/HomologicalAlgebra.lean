import canonicalLaneMathlib.AdmissibleClass
import DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.DGAlgebraStructure

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean

structure ChainComplex (V : Type u) [AddCommGroup V] where
  objects : ℕ → V
  boundaries : ℕ → V
  cycles : ℕ → V
  differential_map : ℕ → (V → V)
  chain_condition : ∀ n, differential_map n ∘ differential_map (n+1) = 0

def HomologyGroup (C : ChainComplex V) (n : ℕ) : Prop :=
  C.cycles n / C.boundaries n

def ChainComplexClosed (C : ChainComplex V) : Prop :=
  C.chain_condition = True

end DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean
end HautevilleHouse