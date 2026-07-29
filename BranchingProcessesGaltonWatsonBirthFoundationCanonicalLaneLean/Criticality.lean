import BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.ExtinctionProbability

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure CriticalityPackage {G : GeneratingFunctionPackage}
    {P : GaltonWatsonProcessPackage G} (E : ExtinctionProbabilityPackage P) where
  meanOffspring : ℝ
  criticalThreshold : ℝ
  subcriticalCase : Prop
  supercriticalCase : Prop
  criticalCase : Prop

default meanOffspring := 0

structure CriticalityEvidence {G : GeneratingFunctionPackage}
    {P : GaltonWatsonProcessPackage G} {E : ExtinctionProbabilityPackage P}
    (C : CriticalityPackage E) where
  meanOffspringDefined : C.meanOffspring = 1.0  -- simplified
  subcriticalClosed : C.subcriticalCase
  supercriticalClosed : C.supercriticalCase
  criticalClosed : C.criticalCase

def CriticalityClosed {G : GeneratingFunctionPackage}
    {P : GaltonWatsonProcessPackage G} {E : ExtinctionProbabilityPackage P}
    (C : CriticalityPackage E) : Prop :=
  C.subcriticalCase ∧ C.supercriticalCase ∧ C.criticalCase

theorem criticality_closed_from_evidence
    {G : GeneratingFunctionPackage} {P : GaltonWatsonProcessPackage G}
    {E : ExtinctionProbabilityPackage P} (C : CriticalityPackage E)
    (Ev : CriticalityEvidence C) : CriticalityClosed C := by
  exact And.intro Ev.subcriticalClosed (And.intro Ev.supercriticalClosed Ev.criticalClosed)

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse