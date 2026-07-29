import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure GeneratingFunction where
  domain : ℕ → ℝ
  coefficients : ℕ → ℝ
  convergenceRadius : ℝ
  generatingFunctionEq : ∀ s, |s| < convergenceRadius → domain s = ∑' n, coefficients n * s ^ n

structure GeneratingFunctionEvidence (G : GeneratingFunction) where
  convergenceRadiusPositive : G.convergenceRadius > 0
  generatingFunctionEqClosed : ∀ s, |s| < G.convergenceRadius → G.domain s = ∑' n, G.coefficients n * s ^ n

def GeneratingFunctionClosed (G : GeneratingFunction) : Prop :=
  G.convergenceRadius > 0 ∧ ∀ s, |s| < G.convergenceRadius → G.domain s = ∑' n, G.coefficients n * s ^ n

theorem generating_function_closed_from_evidence (G : GeneratingFunction)
    (Ev : GeneratingFunctionEvidence G) : GeneratingFunctionClosed G := by
  exact And.intro Ev.convergenceRadiusPositive Ev.generatingFunctionEqClosed

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse
