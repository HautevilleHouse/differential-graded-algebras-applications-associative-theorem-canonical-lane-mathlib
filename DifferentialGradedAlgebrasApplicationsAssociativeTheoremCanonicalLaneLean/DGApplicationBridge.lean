import DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.DGABridgeLemmas
import DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.DGAAssociativeAlgebra

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheorem

structure DGApplicationBridgePackage where
  algebra : DGAlgebra
  associativeStructure : AssociativeAlgebraStructure algebra
  applicationClosed : AssociatedAlgebraClosed algebra associativeStructure

def DGApplicationBridgeClosed (P : DGApplicationBridgePackage) : Prop :=
  P.applicationClosed

theorem dg_application_bridge_from_package (P : DGApplicationBridgePackage) :
  DGApplicationBridgeClosed P :=
  P.applicationClosed

end DifferentialGradedAlgebrasApplicationsAssociativeTheorem
end HautevilleHouse
