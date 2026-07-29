import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  AdmittedObject A ∧ A.endpointSatisfied

theorem bridge_from_admissible_class (A : AdmissibleClass) :
  bridgeClosed A := by
  exact And.intro A.object A.endpointSatisfied

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse