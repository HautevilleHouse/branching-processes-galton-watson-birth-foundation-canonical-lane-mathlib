import HautevilleHouse.BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.BranchingProcessAnalyticProof

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure BranchingProcessAnalyticEvidenceTerms {P : ExtinctionTheoremPackage}
    (C : BranchingProcessAnalyticCertificate P) where
  fixedPointProofTerm : C.fixedPointProof
  criticalCaseProofTerm : C.criticalCaseProof
  subcriticalCaseProofTerm : C.subcriticalCaseProof
  supercriticalCaseProofTerm : C.supercriticalCaseProof
  extinctionTheoremClosed : ExtinctionTheoremClosed P

def BranchingProcessAnalyticCertificate.evidenceTerms {P : ExtinctionTheoremPackage}
    (C : BranchingProcessAnalyticCertificate P) : BranchingProcessAnalyticEvidenceTerms C :=
  {
    fixedPointProofTerm := C.fixedPointProofClosed
    criticalCaseProofTerm := C.criticalCaseProofClosed
    subcriticalCaseProofTerm := C.subcriticalCaseProofClosed
    supercriticalCaseProofTerm := C.supercriticalCaseProofClosed
    extinctionTheoremClosed := extinction_theorem_closed_from_evidence P C.extinctionEvidence
  }

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse
