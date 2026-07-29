import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.GaltonWatsonProcess

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure ExtinctionPackage (G : GaltonWatsonProcess) where
  generatingFunctionFixedPoint : ℚ
  extinctionProbabilityEqual : G.extinctionProbability = generatingFunctionFixedPoint
  criticalCase : Prop
  subcriticalCase : Prop
  supercriticalCase : Prop
  generatingFunctionFixedPointTerm : generatingFunctionFixedPoint = 1
  criticalCaseTerm : criticalCase
  subcriticalCaseTerm : subcriticalCase
  supercriticalCaseTerm : supercriticalCase

structure ExtinctionEvidence {G : GaltonWatsonProcess} (P : ExtinctionPackage G) where
  generatingFunctionFixedPointClosed : P.generatingFunctionFixedPoint = 1
  extinctionProbabilityEqualClosed : P.extinctionProbabilityEqual
  criticalCaseClosed : P.criticalCase
  subcriticalCaseClosed : P.subcriticalCase
  supercriticalCaseClosed : P.supercriticalCase

def ExtinctionClosed {G : GaltonWatsonProcess} (P : ExtinctionPackage G) : Prop :=
  P.generatingFunctionFixedPoint = 1 ∧ P.extinctionProbabilityEqual ∧
  P.criticalCase ∧ P.subcriticalCase ∧ P.supercriticalCase

theorem extinction_closed_from_evidence {G : GaltonWatsonProcess}
    (P : ExtinctionPackage G) (E : ExtinctionEvidence P) : ExtinctionClosed P := by
  exact And.intro E.generatingFunctionFixedPointClosed
    (And.intro E.extinctionProbabilityEqualClosed
      (And.intro E.criticalCaseClosed
        (And.intro E.subcriticalCaseClosed E.supercriticalCaseClosed)))

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse
