import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.GaltonWatsonProcess

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure ExtinctionProbabilityPackage (P : GaltonWatsonProcess) where
  generatingFunction : ℝ → ℝ
  fixedPointEquation : Prop
  extinctionProbabilityComputed : Prop
  extinctionProbabilityUnique : Prop
  criticalityClassification : Prop

structure ExtinctionProbabilityEvidence {P : GaltonWatsonProcess}
    (E : ExtinctionProbabilityPackage P) where
  generatingFunctionClosed : E.generatingFunction 1 = 1
  fixedPointEquationClosed : E.fixedPointEquation
  extinctionProbabilityComputedClosed : E.extinctionProbabilityComputed
  extinctionProbabilityUniqueClosed : E.extinctionProbabilityUnique
  criticalityClassificationClosed : E.criticalityClassification

def ExtinctionProbabilityClosed {P : GaltonWatsonProcess}
    (E : ExtinctionProbabilityPackage P) : Prop :=
  E.generatingFunction 1 = 1 ∧ E.fixedPointEquation ∧
  E.extinctionProbabilityComputed ∧ E.extinctionProbabilityUnique ∧
  E.criticalityClassification

theorem extinction_probability_closed_from_evidence
    {P : GaltonWatsonProcess} (E : ExtinctionProbabilityPackage P)
    (Ev : ExtinctionProbabilityEvidence E) : ExtinctionProbabilityClosed E := by
  exact And.intro Ev.generatingFunctionClosed
    (And.intro Ev.fixedPointEquationClosed
      (And.intro Ev.extinctionProbabilityComputedClosed
        (And.intro Ev.extinctionProbabilityUniqueClosed
          Ev.criticalityClassificationClosed)))

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse