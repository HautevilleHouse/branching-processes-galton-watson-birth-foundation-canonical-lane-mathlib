import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure AdmittedObject where
  branchingProcess : BranchingProcess
  extinctionThreshold : ExtinctionThreshold
  galtonWatsonEquation : GaltonWatsonEquation
  generationCount : GenerationCount
  kestenStigum : KestenStigumTheorem

def AdmittedObject.closure (O : AdmittedObject) : Prop :=
  BranchingProcessClosed O.branchingProcess ∧
  ExtinctionThresholdClosed O.extinctionThreshold ∧
  GaltonWatsonEquationClosed O.galtonWatsonEquation ∧
  GenerationCountClosed O.generationCount ∧
  KestenStigumClosed O.kestenStigum

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse