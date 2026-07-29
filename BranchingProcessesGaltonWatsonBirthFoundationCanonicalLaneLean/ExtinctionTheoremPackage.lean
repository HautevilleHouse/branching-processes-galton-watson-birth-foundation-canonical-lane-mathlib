import HautevilleHouse.BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.GaltonWatsonObjects

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure ExtinctionTheoremPackage where
  meanOffspring : ℝ
  extinctionProb : ℝ
  fixedPointEquation : extinctionProb = (meanOffspring ≤ 1).ite 1 0
  criticalCase : Prop
  subcriticalCase : Prop
  supercriticalCase : Prop
  fixedPointProof : extinctionProb = 1 → meanOffspring ≤ 1

structure ExtinctionTheoremEvidence (P : ExtinctionTheoremPackage) where
  meanOffspringClosed : P.meanOffspring ∈ ℝ
  extinctionProbClosed : P.extinctionProb ∈ ℝ
  fixedPointEquationClosed : P.fixedPointEquation
  criticalCaseClosed : P.criticalCase ∨ P.subcriticalCase ∨ P.supercriticalCase
  fixedPointProofClosed : P.fixedPointProof

def ExtinctionTheoremClosed (P : ExtinctionTheoremPackage) : Prop :=
  P.fixedPointEquation ∧ (P.criticalCase ∨ P.subcriticalCase ∨ P.supercriticalCase)

theorem extinction_theorem_closed_from_evidence (P : ExtinctionTheoremPackage)
    (E : ExtinctionTheoremEvidence P) : ExtinctionTheoremClosed P := by
  exact And.intro E.fixedPointEquationClosed E.criticalCaseClosed

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse
