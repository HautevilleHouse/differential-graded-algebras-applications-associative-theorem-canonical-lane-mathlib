import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheorem

structure HochschildComplex (A : DGAlgebraStructure) where
  cochains : ℕ -> Type u
  coboundary : ∀ (n : ℕ), cochains n -> cochains (n + 1)
  cupProduct : ∀ (p q : ℕ), cochains p -> cochains q -> cochains (p + q)
  gerstenhaberBracket : ∀ (p q : ℕ), cochains p -> cochains q -> cochains (p + q - 1)
  differentialSquared : Prop
  cupProductAssociative : Prop
  gradedCommutative : Prop
  leibnizRule : Prop
  differentialSquaredTerm : differentialSquared
  cupProductAssociativeTerm : cupProductAssociative
  gradedCommutativeTerm : gradedCommutative
  leibnizRuleTerm : leibnizRule

structure HochschildCohomologyPackage (A : DGAlgebraStructure) where
  complex : HochschildComplex A
  cohomologyGroups : ℕ -> Type u
  productInduced : ∀ (p q : ℕ), cohomologyGroups p -> cohomologyGroups q -> cohomologyGroups (p + q)
  bracketInduced : ∀ (p q : ℕ), cohomologyGroups p -> cohomologyGroups q -> cohomologyGroups (p + q - 1)
  productWellDefined : Prop
  bracketWellDefined : Prop
  productWellDefinedTerm : productWellDefined
  bracketWellDefinedTerm : bracketWellDefined

structure HochschildCohomologyEvidence {A : DGAlgebraStructure}
    (P : HochschildCohomologyPackage A) where
  productWellDefinedClosed : P.productWellDefined
  bracketWellDefinedClosed : P.bracketWellDefined

def HochschildCohomologyClosed {A : DGAlgebraStructure}
    (P : HochschildCohomologyPackage A) : Prop :=
  P.productWellDefined ∧ P.bracketWellDefined

theorem hochschild_cohomology_closed_from_evidence
    {A : DGAlgebraStructure} (P : HochschildCohomologyPackage A)
    (E : HochschildCohomologyEvidence P) : HochschildCohomologyClosed P := by
  exact And.intro E.productWellDefinedClosed E.bracketWellDefinedClosed

end DifferentialGradedAlgebrasApplicationsAssociativeTheorem
end HautevilleHouse