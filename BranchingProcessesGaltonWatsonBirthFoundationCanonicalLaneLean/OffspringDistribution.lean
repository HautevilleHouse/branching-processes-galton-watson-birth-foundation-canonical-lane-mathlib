import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.GaltonWatsonObject

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure OffspringDistributionPackage where
  distribution : ℕ → ℝ
  nonnegative : ∀ n, distribution n ≥ 0
  sumToOne : ∑' n, distribution n = 1
  mean : ℝ
  finiteMean : mean < ∞

structure OffspringDistributionEvidence (O : OffspringDistributionPackage) where
  nonnegativeClosed : O.nonnegative
  sumToOneClosed : O.sumToOne
  finiteMeanClosed : O.finiteMean

def OffspringDistributionClosed (O : OffspringDistributionPackage) : Prop :=
  O.nonnegative ∧ O.sumToOne ∧ O.finiteMean

theorem offspring_distribution_closed_from_evidence (O : OffspringDistributionPackage)
    (E : OffspringDistributionEvidence O) : OffspringDistributionClosed O := by
  exact And.intro E.nonnegativeClosed (And.intro E.sumToOneClosed E.finiteMeanClosed)

end HautevilleHouse.BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean