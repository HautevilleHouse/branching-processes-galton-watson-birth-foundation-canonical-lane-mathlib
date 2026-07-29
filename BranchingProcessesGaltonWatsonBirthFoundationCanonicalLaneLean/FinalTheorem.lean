import canonicalLaneMathlib.AdmissibleClass
import BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

def ConstrainedBranchingProcessClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_branching_process_endgame (A : AdmissibleClass) :
    ConstrainedBranchingProcessClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse
