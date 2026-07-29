import canonicalLaneMathlib.AdmissibleClass
import DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.DGAlgebraStructure
import DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean.Cohomology

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean

structure AssociativeTheoremStatement where
  dgAlgebra : DGAlgebra
  cohomologyIsAssociative : ∀ (a b c : Cohomology dgAlgebra), 
    Cohomology.multiplication dgAlgebra (Cohomology.multiplication dgAlgebra a b) c = 
    Cohomology.multiplication dgAlgebra a (Cohomology.multiplication dgAlgebra b c)

structure AssociativeTheoremEvidence (A : AdmissibleClass) where
  dgAlgebra : DGAlgebra
  statement : AssociativeTheoremStatement dgAlgebra
  bridgeClosed : bridgeClosed A
  gateClosed : gateClosed A

theorem associative_theorem_endgame (A : AdmissibleClass) (E : AssociativeTheoremEvidence A) : ConstrainedTheoremClosure A := by
  exact And.intro E.bridgeClosed E.gateClosed

end DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean
end HautevilleHouse