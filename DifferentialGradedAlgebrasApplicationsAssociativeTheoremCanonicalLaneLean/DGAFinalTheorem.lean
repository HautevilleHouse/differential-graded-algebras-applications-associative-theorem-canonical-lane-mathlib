import canonicalLaneMathlib.AdmissibleClass
import DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.DGABridgeLemmas
import DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.DGAGateLemmas

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheorem

def ConstrainedDGAClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dga_endgame (A : AdmissibleClass) : ConstrainedDGAClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DifferentialGradedAlgebrasApplicationsAssociativeTheorem
end HautevilleHouse
