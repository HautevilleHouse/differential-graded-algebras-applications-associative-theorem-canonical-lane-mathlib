import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheorem

structure FormalityData where
  sourceDGAlgebra : DGAlgebraStructure
  targetDGAlgebra : DGAlgebraStructure
  quasiIsomorphismChain : ℕ -> DGAlgebraStructure
  stepQuasiIsomorphism : ∀ (n : ℕ), quasiIsomorphismChain n -> quasiIsomorphismChain (n + 1)
  endQuasiIsomorphism : quasiIsomorphismChain 0 -> quasiIsomorphismChain (someN : ℕ)
  formalityCondition : Prop
  formalityConditionTerm : formalityCondition

structure FormalityPackage where
  data : FormalityData
  sourceFormal : Prop
  targetFormal : Prop
  formalityTheorem : Prop
  sourceFormalTerm : sourceFormal
  targetFormalTerm : targetFormal
  formalityTheoremTerm : formalityTheorem

structure FormalityEvidence (P : FormalityPackage) where
  sourceFormalClosed : P.sourceFormal
  targetFormalClosed : P.targetFormal
  formalityTheoremClosed : P.formalityTheorem

def FormalityClosed (P : FormalityPackage) : Prop :=
  P.sourceFormal ∧ P.targetFormal ∧ P.formalityTheorem

theorem formality_closed_from_evidence
    (P : FormalityPackage) (E : FormalityEvidence P) : FormalityClosed P := by
  exact And.intro E.sourceFormalClosed
    (And.intro E.targetFormalClosed E.formalityTheoremClosed)

end DifferentialGradedAlgebrasApplicationsAssociativeTheorem
end HautevilleHouse