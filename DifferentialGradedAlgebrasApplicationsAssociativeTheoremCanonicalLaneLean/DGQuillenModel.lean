import canonicalLaneMathlib.AdmissibleClass
import .DGAlgebraStructure

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean

structure DGQuillenModel (A : DGAlgebra ℤ) where
  cofibrantReplacement : DGAlgebra ℤ
  quasiIsomorphism : DGAlgebraMorphism cofibrantReplacement A
  fibrationStructure : Prop

structure DGQuillenModelPackage (A : DGAlgebra ℤ) where
  quillenModel : DGQuillenModel A
  modelCategory : Prop
  homotopyCategoryFormed : Prop

structure DGQuillenModelEvidence (A : DGAlgebra ℤ) (P : DGQuillenModelPackage A) where
  modelCategoryClosed : P.modelCategory
  homotopyCategoryFormedClosed : P.homotopyCategoryFormed

def DGQuillenModelClosed (A : DGAlgebra ℤ) (P : DGQuillenModelPackage A) : Prop :=
  P.modelCategory ∧ P.homotopyCategoryFormed

theorem dg_quillen_model_closed_from_evidence (A : DGAlgebra ℤ) (P : DGQuillenModelPackage A) (E : DGQuillenModelEvidence A P) : DGQuillenModelClosed A P := by
  exact And.intro E.modelCategoryClosed E.homotopyCategoryFormedClosed

end DifferentialGradedAlgebrasApplicationsAssociativeTheoremCanonicalLaneLean
end HautevilleHouse