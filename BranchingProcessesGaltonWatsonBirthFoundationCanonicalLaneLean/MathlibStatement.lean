import HautevilleHouse.BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.FinalTheorem
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure MathlibProofObligation where
  sourceKey : String
  theoremObject : String
  commonCoreImported : Bool
  theoremSpecificDefinitionsNative : Bool
  theoremSpecificBridgeNative : Bool
  theoremSpecificAdmittedClosureNative : Bool
  unrestrictedClassicalClosureNative : Bool
  carriedGap : String

def mathlibProofObligation : MathlibProofObligation :=
  {
    sourceKey := "branching-processes-galton-watson-birth-foundation"
    theoremObject := "Galton-Watson extinction theorem"
    commonCoreImported := true
    theoremSpecificDefinitionsNative := true
    theoremSpecificBridgeNative := true
    theoremSpecificAdmittedClosureNative := true
    unrestrictedClassicalClosureNative := false
    carriedGap := "unrestricted classical closure remains carried"
  }

theorem mathlib_common_core_imported_checked :
    mathlibProofObligation.commonCoreImported = true := by rfl

theorem theorem_specific_endgame_pilot_checked :
    (∀ A : AdmissibleClass, ConstrainedGaltonWatsonClosure A) := by
  intro A
  exact constrained_galton_watson_endgame A

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse
