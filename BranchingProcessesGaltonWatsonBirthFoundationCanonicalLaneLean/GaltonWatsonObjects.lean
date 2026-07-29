import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure OffspringDistribution where
  support : Finset ℕ
  probs : ℕ → ℝ
  nonneg : ∀ k, probs k ≥ 0
  sum_one : (∑ k in support, probs k) = 1

structure GaltonWatsonProcess where
  offspring : OffspringDistribution
  generationSizes : ℕ → ℕ → ℝ  -- indexed by time and state?
  initialSize : ℕ
  branchingRule : ℕ → ℝ  -- probability generating function?

structure ExtinctionProbability where
  value : ℝ
  isLeastFixedPoint : Prop

structure GaltonWatsonAdmittedObject where
  dist : OffspringDistribution
  process : GaltonWatsonProcess
  extinction : ExtinctionProbability
  conclusion : Prop  -- e.g., extinction probability is 1 if mean ≤ 1

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse
