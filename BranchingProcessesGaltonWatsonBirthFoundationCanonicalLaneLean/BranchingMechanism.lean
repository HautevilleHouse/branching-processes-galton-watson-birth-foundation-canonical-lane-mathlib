import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.GaltonWatsonProcess

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure BranchingMechanismPackage {P : GaltonWatsonProcess} where
  offspringDistributionGiven : Prop
  independenceAssumptions : Prop
  reproductionMeanFinite : Prop
  varianceFiniteIfSupercritical : Prop
  immigrationComponent : Prop

structure BranchingMechanismEvidence {P : GaltonWatsonProcess}
    (M : BranchingMechanismPackage P) where
  offspringDistributionGivenClosed : M.offspringDistributionGiven
  independenceAssumptionsClosed : M.independenceAssumptions
  reproductionMeanFiniteClosed : M.reproductionMeanFinite
  varianceFiniteIfSupercriticalClosed : M.varianceFiniteIfSupercritical
  immigrationComponentClosed : M.immigrationComponent

def BranchingMechanismClosed {P : GaltonWatsonProcess}
    (M : BranchingMechanismPackage P) : Prop :=
  M.offspringDistributionGiven ∧ M.independenceAssumptions ∧
  M.reproductionMeanFinite ∧ M.varianceFiniteIfSupercritical ∧
  M.immigrationComponent

theorem branching_mechanism_closed_from_evidence
    {P : GaltonWatsonProcess} (M : BranchingMechanismPackage P)
    (Ev : BranchingMechanismEvidence M) : BranchingMechanismClosed M := by
  exact And.intro Ev.offspringDistributionGivenClosed
    (And.intro Ev.independenceAssumptionsClosed
      (And.intro Ev.reproductionMeanFiniteClosed
        (And.intro Ev.varianceFiniteIfSupercriticalClosed
          Ev.immigrationComponentClosed)))

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse