import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheorem

structure MinimalModelData where
  algebra : DGAlgebraStructure
  minimalityCondition : Prop
  freenessCondition : Prop
  quasiIsomorphismToAlgebra : DGAlgebraStructure
  quasiIsomorphism : ∀ (n : ℕ), quasiIsomorphismToAlgebra.gradedModule n -> algebra.gradedModule n
  minimalityConditionTerm : minimalityCondition
  freenessConditionTerm : freenessCondition

structure MinimalModelPackage where
  data : MinimalModelData
  minimalModelExists : Prop
  uniqueUpToIsomorphism : Prop
  minimalModelExistsTerm : minimalModelExists
  uniqueUpToIsomorphismTerm : uniqueUpToIsomorphism

structure MinimalModelEvidence (P : MinimalModelPackage) where
  minimalModelExistsClosed : P.minimalModelExists
  uniqueUpToIsomorphismClosed : P.uniqueUpToIsomorphism

def MinimalModelClosed (P : MinimalModelPackage) : Prop :=
  P.minimalModelExists ∧ P.uniqueUpToIsomorphism

theorem minimal_model_closed_from_evidence
    (P : MinimalModelPackage) (E : MinimalModelEvidence P) : MinimalModelClosed P := by
  exact And.intro E.minimalModelExistsClosed E.uniqueUpToIsomorphismClosed

end DifferentialGradedAlgebrasApplicationsAssociativeTheorem
end HautevilleHouse