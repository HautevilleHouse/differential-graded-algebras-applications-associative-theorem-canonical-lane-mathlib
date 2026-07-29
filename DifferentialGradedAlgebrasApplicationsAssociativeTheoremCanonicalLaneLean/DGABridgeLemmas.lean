import canonicalLaneMathlib.AdmissibleClass
import DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.DGAObjects

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheorem

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DGWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end DifferentialGradedAlgebrasApplicationsAssociativeTheorem
end HautevilleHouse
