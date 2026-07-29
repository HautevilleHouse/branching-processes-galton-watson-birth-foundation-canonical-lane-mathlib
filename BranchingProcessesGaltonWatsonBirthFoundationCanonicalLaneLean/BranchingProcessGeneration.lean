import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.GaltonWatsonProcess

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure BranchingProcessGenerationPackage {G : GaltonWatsonProcess} where
  generationSize : Nat → ℕ
  initialGeneration : ℕ
  recursionRelation : ∀ (n : ℕ), generationSize (n+1) = G.offspringDistribution (generationSize n)
  finiteTimeExtinction : Prop
  populationExplosion : Prop

structure BranchingProcessGenerationEvidence {G : GaltonWatsonProcess}
    (P : BranchingProcessGenerationPackage G) where
  recursionRelationClosed : ∀ (n : ℕ), P.generationSize (n+1) = G.offspringDistribution (P.generationSize n)
  finiteTimeExtinctionClosed : P.finiteTimeExtinction
  populationExplosionClosed : P.populationExplosion

def BranchingProcessGenerationClosed {G : GaltonWatsonProcess}
    (P : BranchingProcessGenerationPackage G) : Prop :=
  (∀ (n : ℕ), P.generationSize (n+1) = G.offspringDistribution (P.generationSize n)) ∧
  P.finiteTimeExtinction ∧ P.populationExplosion

theorem branching_process_generation_closed_from_evidence {G : GaltonWatsonProcess}
    (P : BranchingProcessGenerationPackage G) (E : BranchingProcessGenerationEvidence P) :
    BranchingProcessGenerationClosed P := by
  exact And.intro E.recursionRelationClosed
    (And.intro E.finiteTimeExtinctionClosed E.populationExplosionClosed)

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse
