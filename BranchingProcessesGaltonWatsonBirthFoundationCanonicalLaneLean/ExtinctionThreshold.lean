import canonicalLaneMathlib.AdmissibleClass
import BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.BranchingProcess

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure ExtinctionThreshold where
  criticalValue : ℝ
  subcriticalCondition : Prop
  supercriticalCondition : Prop
  extinctionProbabilityFormula : ℝ → ℝ

structure ExtinctionThresholdEvidence (T : ExtinctionThreshold) where
  criticalValueNonneg : T.criticalValue ≥ 0
  subcriticalConditionClosed : T.subcriticalCondition
  supercriticalConditionClosed : T.supercriticalCondition
  formulaValid : ∀ (x : ℝ), T.extinctionProbabilityFormula x ∈ Set.Icc (0 : ℝ) 1

def ExtinctionThresholdClosed (T : ExtinctionThreshold) : Prop :=
  T.criticalValue ≥ 0 ∧ T.subcriticalCondition ∧ T.supercriticalCondition ∧
  ∀ (x : ℝ), T.extinctionProbabilityFormula x ∈ Set.Icc (0 : ℝ) 1

theorem extinction_threshold_closed_from_evidence (T : ExtinctionThreshold) (E : ExtinctionThresholdEvidence T) :
  ExtinctionThresholdClosed T := by
  exact And.intro E.criticalValueNonneg (And.intro E.subcriticalConditionClosed (And.intro E.supercriticalConditionClosed E.formulaValid))

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse