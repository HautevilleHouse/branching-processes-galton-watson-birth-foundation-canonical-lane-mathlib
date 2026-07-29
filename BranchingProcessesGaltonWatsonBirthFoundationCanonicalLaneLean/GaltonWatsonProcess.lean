import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure Generation where
  size : ℕ
  individuals : ℕ → Type

offspringDistribution : ℕ → ℕ → ℝ
set_option linter.unusedVariables false
def offspringDistribution (n : ℕ) (k : ℕ) : ℝ :=
  if n = 0 then (if k = 0 then 1 else 0) else (if k = 0 then 0 else 0.5)

structure GaltonWatsonBranchingProcess where
  initialSize : ℕ
  offspringLaw : ℕ → ℕ → ℝ
  generationSequence : ℕ → Generation
  independenceAssumption : Prop
  extinctionProbability : ℕ → ℝ
  meanOffspring : Prop
  varianceFinite : Prop
  extinctionTime : ℕ → Prop
  extinctionCertain : Prop
  survivalProbability : ℕ → ℝ

structure GaltonWatsonEvidence (G : GaltonWatsonBranchingProcess) where
  independenceAssumptionClosed : G.independenceAssumption
  extinctionProbabilityClosed : G.extinctionProbability 0 = 0
  meanOffspringClosed : G.meanOffspring
  varianceFiniteClosed : G.varianceFinite
  extinctionTimeClosed : G.extinctionTime 0
  extinctionCertainClosed : G.extinctionCertain
  survivalProbabilityClosed : G.survivalProbability 0 = 1

def GaltonWatsonClosed (G : GaltonWatsonBranchingProcess) : Prop :=
  G.independenceAssumption ∧
  G.extinctionProbability 0 = 0 ∧
  G.meanOffspring ∧
  G.varianceFinite ∧
  G.extinctionTime 0 ∧
  G.extinctionCertain ∧
  G.survivalProbability 0 = 1

theorem galton_watson_closed_from_evidence (G : GaltonWatsonBranchingProcess)
    (E : GaltonWatsonEvidence G) : GaltonWatsonClosed G := by
  exact And.intro E.independenceAssumptionClosed
    (And.intro E.extinctionProbabilityClosed
      (And.intro E.meanOffspringClosed
        (And.intro E.varianceFiniteClosed
          (And.intro E.extinctionTimeClosed
            (And.intro E.extinctionCertainClosed E.survivalProbabilityClosed)))))

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse
