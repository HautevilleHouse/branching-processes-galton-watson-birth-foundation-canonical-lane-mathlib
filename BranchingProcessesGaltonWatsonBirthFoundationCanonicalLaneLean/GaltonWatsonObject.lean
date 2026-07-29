import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure PopulationState where
  generation : ℕ
  size : ℕ

structure GaltonWatsonObject where
  offspringDistribution : ℕ → ℝ                     -- probability mass function on ℕ
  initialSize : ℕ
  extinctionCriterion : Prop
  criticalType : String                             -- "subcritical", "critical", "supercritical"
  conclusion : extinctionCriterion

def GaltonWatsonWitnessClosed (O : GaltonWatsonObject) : Prop :=
  O.extinctionCriterion

end HautevilleHouse.BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean