import canonicalLaneMathlib.AdmissibleClass
import DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.DGAlgebraStructure

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean

structure MasseyProduct (A : DGAlgebra) (a b c : A.carrier) where
  representative : A.carrier
  condition : A.differential representative = A.product a b ∧ A.differential (A.product a b) = 0
  coherence : A.product a (A.product b c) = 0 ∧ A.product (A.product a b) c = 0

def MasseyProductDefined (A : DGAlgebra) (a b c : A.carrier) : Prop :=
  Nonempty (MasseyProduct A a b c)

theorem massey_product_closed (A : DGAlgebra) (a b c : A.carrier) (M : MasseyProduct A a b c) : MasseyProductDefined A a b c :=
  ⟨M⟩

end DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean
end HautevilleHouse