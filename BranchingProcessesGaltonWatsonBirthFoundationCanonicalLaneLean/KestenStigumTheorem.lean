import canonicalLaneMathlib.AdmissibleClass
import BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.BranchingProcess

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure KestenStigumTheorem where
  survivalCondition : Prop
  martingaleConvergence : Prop
  offspringMeanCondition : ℝ
  survivalProbabilityFormula : ℝ

structure KestenStigumEvidence (K : KestenStigumTheorem) where
  survivalConditionClosed : K.survivalCondition
  martingaleConvergenceClosed : K.martingaleConvergence
  offspringMeanConditionClosed : K.offspringMeanCondition > 1
  survivalProbabilityFormulaClosed : K.survivalProbabilityFormula = 1 - 1 / K.offspringMeanCondition

def KestenStigumClosed (K : KestenStigumTheorem) : Prop :=
  K.survivalCondition ∧ K.martingaleConvergence ∧ K.offspringMeanCondition > 1 ∧
  K.survivalProbabilityFormula = 1 - 1 / K.offspringMeanCondition

theorem kesten_stigum_closed_from_evidence (K : KestenStigumTheorem) (E : KestenStigumEvidence K) :
  KestenStigumClosed K := by
  exact And.intro E.survivalConditionClosed (And.intro E.martingaleConvergenceClosed (And.intro E.offspringMeanConditionClosed E.survivalProbabilityFormulaClosed))

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse