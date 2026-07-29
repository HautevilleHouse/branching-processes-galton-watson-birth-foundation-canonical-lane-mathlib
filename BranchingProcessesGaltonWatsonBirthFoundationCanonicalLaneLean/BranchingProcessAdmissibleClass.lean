import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure BranchingProcessAdmittedObject where
  process : GaltonWatsonProcess
  extinctionProbabilityComputed : Prop
  extinctionProbabilityClosed : extinctionProbabilityComputed

structure BranchingProcessAdmissibleClass where
  object : BranchingProcessAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def BranchingProcessWitnessClosed (O : BranchingProcessAdmittedObject) : Prop :=
  O.extinctionProbabilityClosed

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse