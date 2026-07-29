import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean

structure ExtinctionCriteriaPackage (G : GaltonWatsonBranchingProcess) where
  meanOffspringCondition : Prop
  generatingFunctionFixedPoint : Prop
  extinctionProbabilityEquation : Prop
  zeroIfMeanLessEqualOne : Prop
  positiveIfMeanGreaterOne : Prop
  secondMomentCondition : Prop
  extinctionProbabilityContinuous : Prop
  criticalCaseBehavior : Prop
  extinctionProbabilityClosedForm : Prop

structure ExtinctionCriteriaEvidence {G : GaltonWatsonBranchingProcess}
    (E : ExtinctionCriteriaPackage G) where
  meanOffspringConditionClosed : E.meanOffspringCondition
  generatingFunctionFixedPointClosed : E.generatingFunctionFixedPoint
  extinctionProbabilityEquationClosed : E.extinctionProbabilityEquation
  zeroIfMeanLessEqualOneClosed : E.zeroIfMeanLessEqualOne
  positiveIfMeanGreaterOneClosed : E.positiveIfMeanGreaterOne
  secondMomentConditionClosed : E.secondMomentCondition
  extinctionProbabilityContinuousClosed : E.extinctionProbabilityContinuous
  criticalCaseBehaviorClosed : E.criticalCaseBehavior
  extinctionProbabilityClosedFormClosed : E.extinctionProbabilityClosedForm

def ExtinctionCriteriaClosed {G : GaltonWatsonBranchingProcess}
    (E : ExtinctionCriteriaPackage G) : Prop :=
  E.meanOffspringCondition ∧
  E.generatingFunctionFixedPoint ∧
  E.extinctionProbabilityEquation ∧
  E.zeroIfMeanLessEqualOne ∧
  E.positiveIfMeanGreaterOne ∧
  E.secondMomentCondition ∧
  E.extinctionProbabilityContinuous ∧
  E.criticalCaseBehavior ∧
  E.extinctionProbabilityClosedForm

theorem extinction_criteria_closed_from_evidence
    {G : GaltonWatsonBranchingProcess}
    (E : ExtinctionCriteriaPackage G)
    (Ev : ExtinctionCriteriaEvidence E) : ExtinctionCriteriaClosed E := by
  exact And.intro Ev.meanOffspringConditionClosed
    (And.intro Ev.generatingFunctionFixedPointClosed
      (And.intro Ev.extinctionProbabilityEquationClosed
        (And.intro Ev.zeroIfMeanLessEqualOneClosed
          (And.intro Ev.positiveIfMeanGreaterOneClosed
            (And.intro Ev.secondMomentConditionClosed
              (And.intro Ev.extinctionProbabilityContinuousClosed
                (And.intro Ev.criticalCaseBehaviorClosed
                  Ev.extinctionProbabilityClosedFormClosed)))))))

end BranchingProcessesGaltonWatsonBirthFoundationCanonicalLaneLean
end HautevilleHouse
