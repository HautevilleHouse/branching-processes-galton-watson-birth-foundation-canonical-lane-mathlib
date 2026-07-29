import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure GeneratingFunction (p : GaltonWatsonProcess) where
  powerSeries : ℕ → ℝ
  radiusOfConvergence : ℝ
  seriesConverges : ∀ s : ℝ, |s| < radiusOfConvergence → ∃ sum : ℝ, sum = ∑' n, powerSeries n * s^n
  extinctionFixedPoint : (∑' n, powerSeries n * (extinctionProb p)^n) = extinctionProb p

def GeneratingFunctionClosed (p : GaltonWatsonProcess) (g : GeneratingFunction p) : Prop :=
  g.seriesConverges ∧ g.extinctionFixedPoint

theorem generating_function_closed (p : GaltonWatsonProcess) (g : GeneratingFunction p) : GeneratingFunctionClosed p g := by
  exact And.intro g.seriesConverges g.extinctionFixedPoint

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse