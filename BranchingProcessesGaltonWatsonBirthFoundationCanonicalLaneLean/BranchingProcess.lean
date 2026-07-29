import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure BranchingProcess where
  populationSize : ℕ
  offspringDistribution : ℕ → ℕ
  extinctionProbability : ℝ
  meanOffspring : ℝ
  varianceOffspring : ℝ

structure BranchingProcessEvidence (P : BranchingProcess) where
  finiteMean : P.meanOffspring < ∞
  finiteVariance : P.varianceOffspring < ∞
  extinctionProbabilityClosed : P.extinctionProbability ∈ Set.Icc (0 : ℝ) 1

def BranchingProcessClosed (P : BranchingProcess) : Prop :=
  P.meanOffspring < ∞ ∧ P.varianceOffspring < ∞ ∧ P.extinctionProbability ∈ Set.Icc (0 : ℝ) 1

theorem branching_process_closed_from_evidence (P : BranchingProcess) (E : BranchingProcessEvidence P) :
  BranchingProcessClosed P := by
  exact And.intro E.finiteMean (And.intro E.finiteVariance E.extinctionProbabilityClosed)

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse