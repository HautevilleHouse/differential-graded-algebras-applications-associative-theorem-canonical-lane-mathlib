import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheorem

structure DGAlgebraStructure where
  gradedModule : Type u -> Type v
  multiplication : ∀ (p q : ℕ), gradedModule p -> gradedModule q -> gradedModule (p + q)
  differential : ∀ (n : ℕ), gradedModule n -> gradedModule (n + 1)
  associativity : Prop
  leibnizRule : Prop
  differentialSquared : Prop
  associativityTerm : associativity
  leibnizRuleTerm : leibnizRule
  differentialSquaredTerm : differentialSquared

structure DGAlgebraDeformationPackage where
  baseDGAlgebra : DGAlgebraStructure
  deformationParameter : Type
  formalParameter : deformationParameter
  deformedMultiplication : ∀ (p q : ℕ), baseDGAlgebra.gradedModule p -> baseDGAlgebra.gradedModule q -> baseDGAlgebra.gradedModule (p + q)
  deformedDifferential : ∀ (n : ℕ), baseDGAlgebra.gradedModule n -> baseDGAlgebra.gradedModule (n + 1)
  deformationAssociativity : Prop
  deformationLeibniz : Prop
  deformationDifferentialSquared : Prop
  deformationAssociativityTerm : deformationAssociativity
  deformationLeibnizTerm : deformationLeibniz
  deformationDifferentialSquaredTerm : deformationDifferentialSquared

structure DGAlgebraDeformationEvidence (P : DGAlgebraDeformationPackage) where
  deformationAssociativityClosed : P.deformationAssociativity
  deformationLeibnizClosed : P.deformationLeibniz
  deformationDifferentialSquaredClosed : P.deformationDifferentialSquared

def DGAlgebraDeformationClosed (P : DGAlgebraDeformationPackage) : Prop :=
  P.deformationAssociativity ∧ P.deformationLeibniz ∧ P.deformationDifferentialSquared

theorem dg_algebra_deformation_closed_from_evidence
    (P : DGAlgebraDeformationPackage) (E : DGAlgebraDeformationEvidence P) :
    DGAlgebraDeformationClosed P := by
  exact And.intro E.deformationAssociativityClosed
    (And.intro E.deformationLeibnizClosed E.deformationDifferentialSquaredClosed)

end DifferentialGradedAlgebrasApplicationsAssociativeTheorem
end HautevilleHouse