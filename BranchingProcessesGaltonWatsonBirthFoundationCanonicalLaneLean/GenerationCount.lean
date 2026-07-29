import canonicalLaneMathlib.AdmissibleClass
import BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.BranchingProcess

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure GenerationCount where
  initialPopulation : ℕ
  maxGenerations : ℕ
  survivalProbability : ℝ
  extinctionTimeDistribution : ℕ → ℝ

structure GenerationCountEvidence (G : GenerationCount) where
  initialPositive : G.initialPopulation ≥ 1
  maxGenerationsFinite : G.maxGenerations < ∞
  survivalProbabilityClosed : G.survivalProbability ∈ Set.Icc (0 : ℝ) 1
  extinctionTimeSumTo : ∑' n, G.extinctionTimeDistribution n = 1

def GenerationCountClosed (G : GenerationCount) : Prop :=
  G.initialPopulation ≥ 1 ∧ G.maxGenerations < ∞ ∧ G.survivalProbability ∈ Set.Icc (0 : ℝ) 1 ∧
  ∑' n, G.extinctionTimeDistribution n = 1

theorem generation_count_closed_from_evidence (G : GenerationCount) (E : GenerationCountEvidence G) :
  GenerationCountClosed G := by
  exact And.intro E.initialPositive (And.intro E.maxGenerationsFinite (And.intro E.survivalProbabilityClosed E.extinctionTimeSumTo))

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse