import canonicalLaneMathlib.AdmissibleClass
import BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.BranchingProcess

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure GaltonWatsonEquation where
  generatingFunction : ℝ → ℝ
  fixedPointEquation : Prop
  pgfDefined : ℝ → ℝ
  generatingFunctionAnalytic : Prop

structure GaltonWatsonEquationEvidence (E : GaltonWatsonEquation) where
  fixedPointEquationClosed : E.fixedPointEquation
  generatingFunctionAnalyticClosed : E.generatingFunctionAnalytic
  pgfProperties : ∀ s ∈ Set.Icc (0 : ℝ) 1, E.pgfDefined s = E.generatingFunction s

def GaltonWatsonEquationClosed (E : GaltonWatsonEquation) : Prop :=
  E.fixedPointEquation ∧ E.generatingFunctionAnalytic ∧
  ∀ s ∈ Set.Icc (0 : ℝ) 1, E.pgfDefined s = E.generatingFunction s

theorem galton_watson_equation_closed_from_evidence (E : GaltonWatsonEquation) (Ev : GaltonWatsonEquationEvidence E) :
  GaltonWatsonEquationClosed E := by
  exact And.intro Ev.fixedPointEquationClosed (And.intro Ev.generatingFunctionAnalyticClosed Ev.pgfProperties)

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse