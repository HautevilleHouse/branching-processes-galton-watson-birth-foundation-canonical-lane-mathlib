import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.GaltonWatsonObject
import HautevilleHouse.BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.OffspringDistribution

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure BranchingProcessEvolutionPackage (O : OffspringDistributionPackage) where
  generations : ℕ → ℕ                           -- population size at each generation
  initialCondition : generations 0 = 1
  recursion : ∀ n, generations (n+1) = sum over individuals of offspring counts according to O.distribution
  independence : Prop                          -- all individuals reproduce independently

structure BranchingProcessEvolutionEvidence {O : OffspringDistributionPackage}
    (Evo : BranchingProcessEvolutionPackage O) where
  initialConditionClosed : Evo.initialCondition
  recursionClosed : Evo.recursion
  independenceClosed : Evo.independence

def BranchingProcessEvolutionClosed {O : OffspringDistributionPackage}
    (Evo : BranchingProcessEvolutionPackage O) : Prop :=
  Evo.initialCondition ∧ Evo.recursion ∧ Evo.independence

theorem branching_process_evolution_closed_from_evidence {O : OffspringDistributionPackage}
    (Evo : BranchingProcessEvolutionPackage O) (E : BranchingProcessEvolutionEvidence Evo) :
    BranchingProcessEvolutionClosed Evo := by
  exact And.intro E.initialConditionClosed (And.intro E.recursionClosed E.independenceClosed)

end HautevilleHouse.BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean