import canonicalLaneMathlib.AdmissibleClass
import .DGAlgebraStructure
import .DGCoalgebraStructure
import .DGHochschildHomology
import .DGQuillenModel

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean

structure DGAssociativeTheoremPackage where
  algebra : DGAlgebraPackage
  coalgebra : DGCoalgebraPackage
  hochschildHomology : DGHochschildHomologyPackage algebra.algebraObject
  quillenModel : DGQuillenModelPackage algebra.algebraObject
  associativeTheoremStatement : Prop
  associativeTheoremProof : Prop

structure DGAssociativeTheoremEvidence (P : DGAssociativeTheoremPackage) where
  algebraClosed : DGAlgebraClosed P.algebra
  coalgebraClosed : DGCoalgebraClosed P.coalgebra
  hochschildHomologyClosed : DGHochschildHomologyClosed P.algebra.algebraObject P.hochschildHomology
  quillenModelClosed : DGQuillenModelClosed P.algebra.algebraObject P.quillenModel
  associativeTheoremStatementClosed : P.associativeTheoremStatement
  associativeTheoremProofClosed : P.associativeTheoremProof

def DGAssociativeTheoremClosed (P : DGAssociativeTheoremPackage) : Prop :=
  DGAlgebraClosed P.algebra ∧ DGCoalgebraClosed P.coalgebra ∧
  DGHochschildHomologyClosed P.algebra.algebraObject P.hochschildHomology ∧
  DGQuillenModelClosed P.algebra.algebraObject P.quillenModel ∧
  P.associativeTheoremStatement ∧ P.associativeTheoremProof

theorem dg_associative_theorem_closed_from_evidence (P : DGAssociativeTheoremPackage) (E : DGAssociativeTheoremEvidence P) : DGAssociativeTheoremClosed P := by
  exact And.intro E.algebraClosed
    (And.intro E.coalgebraClosed
      (And.intro E.hochschildHomologyClosed
        (And.intro E.quillenModelClosed
          (And.intro E.associativeTheoremStatementClosed E.associativeTheoremProofClosed))))

end DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean
end HautevilleHouse