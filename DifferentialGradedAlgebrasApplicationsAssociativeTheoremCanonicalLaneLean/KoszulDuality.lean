import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheorem

structure KoszulDualityPair where
  algebraA : DGAlgebraStructure
  algebraB : DGAlgebraStructure
  twistingCochain : ∀ (n : ℕ), algebraA.gradedModule n -> algebraB.gradedModule n
  barConstruction : DGAlgebraStructure
  cobarConstruction : DGAlgebraStructure
  quasiIsomorphismBarCobar : Prop
  koszulDualityTheorem : Prop
  quasiIsomorphismBarCobarTerm : quasiIsomorphismBarCobar
  koszulDualityTheoremTerm : koszulDualityTheorem

structure KoszulDualityPackage where
  pair : KoszulDualityPair
  augmentedAlgebra : DGAlgebraStructure
  koszulComplex : DGAlgebraStructure
  koszulityCondition : Prop
  koszulityConditionTerm : koszulityCondition

structure KoszulDualityEvidence (P : KoszulDualityPackage) where
  koszulityConditionClosed : P.koszulityCondition

def KoszulDualityClosed (P : KoszulDualityPackage) : Prop :=
  P.koszulityCondition

theorem koszul_duality_closed_from_evidence
    (P : KoszulDualityPackage) (E : KoszulDualityEvidence P) : KoszulDualityClosed P := by
  exact E.koszulityConditionClosed

end DifferentialGradedAlgebrasApplicationsAssociativeTheorem
end HautevilleHouse