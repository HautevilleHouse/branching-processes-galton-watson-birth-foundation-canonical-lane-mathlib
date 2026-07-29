import HautevilleHouse.BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean.ExtinctionTheoremPackage

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure BranchingProcessAnalyticCertificate (P : ExtinctionTheoremPackage) where
  fixedPointProof : Prop
  criticalCaseProof : Prop
  subcriticalCaseProof : Prop
  supercriticalCaseProof : Prop
  fixedPointProofClosed : fixedPointProof
  criticalCaseProofClosed : criticalCaseProof
  subcriticalCaseProofClosed : subcriticalCaseProof
  supercriticalCaseProofClosed : supercriticalCaseProof
  extinctionEvidence : ExtinctionTheoremEvidence P

def BranchingProcessAnalyticCertificateClosed {P : ExtinctionTheoremPackage}
    (C : BranchingProcessAnalyticCertificate P) : Prop :=
  C.fixedPointProof ∧ C.criticalCaseProof ∧ C.subcriticalCaseProof ∧ C.supercriticalCaseProof

theorem branching_process_analytic_certificate_closed {P : ExtinctionTheoremPackage}
    (C : BranchingProcessAnalyticCertificate P) :
    BranchingProcessAnalyticCertificateClosed C := by
  exact And.intro C.fixedPointProofClosed
    (And.intro C.criticalCaseProofClosed
      (And.intro C.subcriticalCaseProofClosed C.supercriticalCaseProofClosed))

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse
