import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.GaltonWatsonProcess

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure CriticalityClassificationPackage {P : GaltonWatsonProcess} where
  meanComparison : Prop
  subcriticalCondition : Prop
  criticalCondition : Prop
  supercriticalCondition : Prop
  extinctionEvent : Prop

structure CriticalityClassificationEvidence {P : GaltonWatsonProcess}
    (C : CriticalityClassificationPackage P) where
  meanComparisonClosed : C.meanComparison
  subcriticalConditionClosed : C.subcriticalCondition
  criticalConditionClosed : C.criticalCondition
  supercriticalConditionClosed : C.supercriticalCondition
  extinctionEventClosed : C.extinctionEvent

def CriticalityClassificationClosed {P : GaltonWatsonProcess}
    (C : CriticalityClassificationPackage P) : Prop :=
  C.meanComparison ∧ C.subcriticalCondition ∧
  C.criticalCondition ∧ C.supercriticalCondition ∧
  C.extinctionEvent

theorem criticality_classification_closed_from_evidence
    {P : GaltonWatsonProcess} (C : CriticalityClassificationPackage P)
    (Ev : CriticalityClassificationEvidence C) : CriticalityClassificationClosed C := by
  exact And.intro Ev.meanComparisonClosed
    (And.intro Ev.subcriticalConditionClosed
      (And.intro Ev.criticalConditionClosed
        (And.intro Ev.supercriticalConditionClosed
          Ev.extinctionEventClosed)))

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse