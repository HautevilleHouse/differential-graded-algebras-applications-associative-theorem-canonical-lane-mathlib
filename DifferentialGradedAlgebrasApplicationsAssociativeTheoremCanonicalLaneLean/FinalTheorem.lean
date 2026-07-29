import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.AssociativeTheoremBridge

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean

def ConstrainedDGAClosure (DG : DGAdmissibleClass) : Prop :=
  bridgeClosed DG ∧ gateClosed DG

theorem constrained_dga_endgame (DG : DGAdmissibleClass) :
    ConstrainedDGAClosure DG := by
  exact And.intro (bridge_from_admissible_class DG) (gate_from_admissible_class DG)

end DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean
end HautevilleHouse