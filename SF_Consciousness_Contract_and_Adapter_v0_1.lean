

/-!
===============================================================================
FROZEN CONSCIOUSNESS DOMAIN MODULE — CARRIED FROM MACHINE-CLEAN v0.7
===============================================================================
Only the Consciousness-domain machinery through the current science-stop and
object-location checkpoint is carried forward here. The obsolete Workbench-only
novel-kernel-gap firewall tail is intentionally omitted because the public v1.0
kernel correctly keeps that self-audit machinery outside the public contract.
===============================================================================
-/

namespace StructuralFlow
namespace ConsciousnessWorkbench

universe u

/-! --------------------------------------------------------------------------
Fixed object anchor
---------------------------------------------------------------------------- -/

inductive Candidate where
  | consciousnessMode
  deriving DecidableEq, Repr

inductive Level where
  | boundedSystemMode
  deriving DecidableEq, Repr

inductive Scope where
  | structuralModeDiscrimination
  deriving DecidableEq, Repr

/-! --------------------------------------------------------------------------
Empirical interface
---------------------------------------------------------------------------- -/

/--
Domain-owned evidentiary standing for one case.

`positive` and `negative` mean only that the governing domain has admitted the
case to that evidentiary class under its own warrant. They do not define the
Consciousness mode structurally.
-/
inductive EvidenceStanding where
  | positive
  | negative
  | indeterminate
  deriving DecidableEq, Repr

/--
Empirical interface for Consciousness-mode investigation.

The types are intentionally separated:

* `Support` names domain-owned candidate support/disruption conditions;
* `Content` names carried distinctions whose participation may later be tested;
* `Case` carries the actual comparison/evidence package.

No field identifies any of these with the structural Consciousness mode.
-/
structure EmpiricalInterface
    (Case Support Content : Type) where

  caseEligible : Case → Prop

  evidenceStanding : Case → EvidenceStanding
  evidenceWarrant : Case → EvidenceStanding → Prop
  evidenceWarranted :
    ∀ x, caseEligible x →
      evidenceWarrant x (evidenceStanding x)

  /-- Standing domain evidence that the system remains capable of the mode. -/
  capacityForMode : Case → Prop

  /-- Domain-owned conditions that may support, disrupt, or track the mode. -/
  supportCondition : Support → Case → Prop

  /-- Ordinary carried content. No consciousness implication is built in. -/
  contentCarried : Content → Case → Prop

/-! --------------------------------------------------------------------------
Experiential admission contract
---------------------------------------------------------------------------- -/

/--
Domain-owned experiential predicates.

The Workbench does not define these predicates from generic functionality.
The Consciousness domain owns their admission. The contract below governs when
empirical evidence may lawfully support or oppose them.
-/
structure ExperientialDomainInterface
    (Case Content : Type) where

  /-- Experiential standing holds somewhere in the pinned carrier/passage. -/
  modeExperiential : Case → Prop

  /-- A particular carried content has experiential standing in the case. -/
  contentExperiential : Content → Case → Prop

  /-- Experiential content is sufficient for experiential mode standing. -/
  contentImpliesMode :
    ∀ c x, contentExperiential c x → modeExperiential x

/--
Null or missing-signal patterns that are explicitly insufficient, by themselves,
for a NEGATIVE experiential admission.
-/
inductive NullNegativeKind where
  | noReport
  | noMovement
  | noCommandFollowing
  | failedCovertTask
  | lowBehavioralScore
  | noRecalledContent
  | proxyNondetection
  deriving DecidableEq, Repr

/--
Admission contract for the domain-owned experiential predicate.

This structure is intentionally epistemic. It does not explain the mechanism of
Consciousness and it does not reduce experiential standing to report, behavior,
proxy response, or any candidate theory under test. It governs only whether the
domain may admit POSITIVE, NEGATIVE, or INDETERMINATE standing for a pinned case.
-/
structure ExperientialAdmissionContract
    {Case Support Content : Type}
    (e : EmpiricalInterface Case Support Content)
    (d : ExperientialDomainInterface Case Content) where

  /- Surface pinning. -/
  carrierPinned : Case → Prop
  passagePinned : Case → Prop
  modeTargetDeclared : Case → Prop

  /- Evidence-quality / independence firewalls. -/
  candidateIndependent : Case → Prop
  temporalAnchorAdequate : Case → Prop
  evidenceConflict : Case → Prop

  /- Retrospective-memory firewall. -/
  retrospectiveModeClaim : Case → Prop
  memoryConfoundCleared : Case → Prop

  /- Affirmative evidence routes. These are domain predicates, not definitions. -/
  affirmativeFirstPerson : Case → Prop
  affirmativeReport : Case → Prop
  validatedPositiveProxy : Case → Prop
  convergentPositiveBundle : Case → Prop

  /- Negative admission requires an active negative route, not a missing signal. -/
  dedicatedNegativeProbe : Case → Prop
  nullNegativeOnly : NullNegativeKind → Case → Prop

  /- A proxy validated only for capacity cannot, alone, classify current mode. -/
  capacityProxyOnly : Case → Prop

  /- Separate content-level standing. Mode positivity need not identify content. -/
  contentStanding : Content → Case → EvidenceStanding

  /- POSITIVE mode admission soundness. -/
  positiveStandingSound :
    ∀ x,
      e.caseEligible x →
      e.evidenceStanding x = EvidenceStanding.positive →
      carrierPinned x
      ∧ passagePinned x
      ∧ modeTargetDeclared x
      ∧ candidateIndependent x
      ∧ temporalAnchorAdequate x
      ∧ ¬ evidenceConflict x
      ∧ (affirmativeFirstPerson x
        ∨ affirmativeReport x
        ∨ validatedPositiveProxy x
        ∨ convergentPositiveBundle x)

  /- NEGATIVE mode admission soundness. -/
  negativeStandingSound :
    ∀ x,
      e.caseEligible x →
      e.evidenceStanding x = EvidenceStanding.negative →
      carrierPinned x
      ∧ passagePinned x
      ∧ modeTargetDeclared x
      ∧ candidateIndependent x
      ∧ temporalAnchorAdequate x
      ∧ ¬ evidenceConflict x
      ∧ dedicatedNegativeProbe x
      ∧ (retrospectiveModeClaim x → memoryConfoundCleared x)

  /- Admission links from evidence class to the domain-owned predicate. -/
  positiveAdmitsMode :
    ∀ x,
      e.caseEligible x →
      e.evidenceStanding x = EvidenceStanding.positive →
      d.modeExperiential x

  negativeAdmitsModeAbsence :
    ∀ x,
      e.caseEligible x →
      e.evidenceStanding x = EvidenceStanding.negative →
      ¬ d.modeExperiential x

  /- Content and mode remain distinct, but positive content implies positive mode. -/
  positiveContentSound :
    ∀ c x,
      e.caseEligible x →
      contentStanding c x = EvidenceStanding.positive →
      d.contentExperiential c x

  negativeContentSound :
    ∀ c x,
      e.caseEligible x →
      contentStanding c x = EvidenceStanding.negative →
      ¬ d.contentExperiential c x

  positiveContentImpliesPositiveMode :
    ∀ c x,
      e.caseEligible x →
      contentStanding c x = EvidenceStanding.positive →
      e.evidenceStanding x = EvidenceStanding.positive

  /- Hard INDETERMINATE firewalls. -/
  conflictForcesIndeterminate :
    ∀ x,
      e.caseEligible x →
      evidenceConflict x →
      e.evidenceStanding x = EvidenceStanding.indeterminate

  candidateDependenceForcesIndeterminate :
    ∀ x,
      e.caseEligible x →
      ¬ candidateIndependent x →
      e.evidenceStanding x = EvidenceStanding.indeterminate

  temporalFailureForcesIndeterminate :
    ∀ x,
      e.caseEligible x →
      ¬ temporalAnchorAdequate x →
      e.evidenceStanding x = EvidenceStanding.indeterminate

  nullNegativeOnlyForcesIndeterminate :
    ∀ k x,
      e.caseEligible x →
      nullNegativeOnly k x →
      e.evidenceStanding x = EvidenceStanding.indeterminate

  capacityProxyOnlyForcesIndeterminate :
    ∀ x,
      e.caseEligible x →
      capacityProxyOnly x →
      e.evidenceStanding x = EvidenceStanding.indeterminate

  unresolvedMemoryForcesIndeterminate :
    ∀ x,
      e.caseEligible x →
      retrospectiveModeClaim x →
      ¬ memoryConfoundCleared x →
      e.evidenceStanding x = EvidenceStanding.indeterminate

/-- A lawful POSITIVE admission actually warrants the domain-owned mode predicate. -/
theorem positive_admission_is_experiential
    {Case Support Content : Type}
    {e : EmpiricalInterface Case Support Content}
    {d : ExperientialDomainInterface Case Content}
    (a : ExperientialAdmissionContract e d)
    {x : Case}
    (hx : e.caseEligible x)
    (hpos : e.evidenceStanding x = EvidenceStanding.positive) :
    d.modeExperiential x :=
  a.positiveAdmitsMode x hx hpos

/-- A lawful NEGATIVE admission warrants absence of the domain-owned mode predicate. -/
theorem negative_admission_is_nonexperiential
    {Case Support Content : Type}
    {e : EmpiricalInterface Case Support Content}
    {d : ExperientialDomainInterface Case Content}
    (a : ExperientialAdmissionContract e d)
    {x : Case}
    (hx : e.caseEligible x)
    (hneg : e.evidenceStanding x = EvidenceStanding.negative) :
    ¬ d.modeExperiential x :=
  a.negativeAdmitsModeAbsence x hx hneg

/-! --------------------------------------------------------------------------
Evidence witnesses
---------------------------------------------------------------------------- -/

structure PositiveEvidenceWitness
    {Case Support Content : Type}
    (e : EmpiricalInterface Case Support Content) where
  case : Case
  eligible : e.caseEligible case
  standing : e.evidenceStanding case = EvidenceStanding.positive

structure NegativeEvidenceWitness
    {Case Support Content : Type}
    (e : EmpiricalInterface Case Support Content) where
  case : Case
  eligible : e.caseEligible case
  standing : e.evidenceStanding case = EvidenceStanding.negative

structure IndeterminateEvidenceWitness
    {Case Support Content : Type}
    (e : EmpiricalInterface Case Support Content) where
  case : Case
  eligible : e.caseEligible case
  standing : e.evidenceStanding case = EvidenceStanding.indeterminate

/-! --------------------------------------------------------------------------
Candidate mode hypothesis
---------------------------------------------------------------------------- -/

/--
One candidate structural account of the Consciousness MODE.

`Job`, `Shape`, and `Capacity` remain caller-supplied. The workbench therefore
cannot silently manufacture a Consciousness definition.
-/
structure ModeHypothesis
    (Job Shape Capacity Case : Type) where

  selectedJob : Job
  selectedShape : Shape
  selectedCapacity : Capacity

  structuralJob : Candidate → Level → Scope → Job → Prop

  honestShape : Candidate → Level → Scope → Shape → Prop
  performs : Shape → Job → Prop
  strictlyThinner : Shape → Shape → Prop

  caseInScope : Candidate → Level → Scope → Case → Prop
  shapeHolds : Shape → Case → Prop
  failurePassage : Case → Case → Prop
  shapeFails : Shape → Case → Prop
  capacityAvailable : Capacity → Case → Prop

  adjacentAbsorptionTested : Prop
  falseSubstituteTested : Prop
  levelShiftTested : Prop
  scopeShiftTested : Prop
  internalInflationTested : Prop
  neededAtAllTested : Prop

  candidateSurvives : Prop
  objectClosed : Prop

/-- Exact adapter into the already-machine-closed +3 workbench. -/
def ModeHypothesis.toPlusThreeWorld
    {Job Shape Capacity Case : Type}
    (h : ModeHypothesis Job Shape Capacity Case) :
    PlusThree.World
      Candidate Level Scope Job Shape Capacity Case where

  selectedCandidate := Candidate.consciousnessMode
  selectedLevel := Level.boundedSystemMode
  selectedScope := Scope.structuralModeDiscrimination

  selectedJob := h.selectedJob
  selectedShape := h.selectedShape
  selectedCapacity := h.selectedCapacity

  structuralJob := h.structuralJob
  honestShape := h.honestShape
  performs := h.performs
  strictlyThinner := h.strictlyThinner

  caseInScope := h.caseInScope
  shapeHolds := h.shapeHolds
  failurePassage := h.failurePassage
  shapeFails := h.shapeFails
  capacityAvailable := h.capacityAvailable

  adjacentAbsorptionTested := h.adjacentAbsorptionTested
  falseSubstituteTested := h.falseSubstituteTested
  levelShiftTested := h.levelShiftTested
  scopeShiftTested := h.scopeShiftTested
  internalInflationTested := h.internalInflationTested
  neededAtAllTested := h.neededAtAllTested

  candidateSurvives := h.candidateSurvives
  objectClosed := h.objectClosed

/-! --------------------------------------------------------------------------
Evidence tracking without evidence/object collapse
---------------------------------------------------------------------------- -/

/--
A candidate structural shape tracks independently admitted empirical evidence.

This is intentionally weaker than object identity.
Tracking empirical positive/negative cases does not by itself prove that the
candidate shape IS Consciousness.
-/
structure EvidenceTracking
    {Case Support Content Job Shape Capacity : Type}
    (e : EmpiricalInterface Case Support Content)
    (h : ModeHypothesis Job Shape Capacity Case) where

  positiveTracked :
    ∀ x,
      e.caseEligible x →
      e.evidenceStanding x = EvidenceStanding.positive →
      h.shapeHolds h.selectedShape x

  negativeTracked :
    ∀ x,
      e.caseEligible x →
      e.evidenceStanding x = EvidenceStanding.negative →
      h.shapeFails h.selectedShape x

/--
One explicit witness that a domain-owned support condition is not sufficient
for the candidate mode shape.

This is useful when the empirical literature identifies support mechanisms or
correlates that must not be promoted into the object by definition.
-/
structure SupportNotSufficient
    {Case Support Content Job Shape Capacity : Type}
    (e : EmpiricalInterface Case Support Content)
    (h : ModeHypothesis Job Shape Capacity Case)
    (s : Support) where

  case : Case
  eligible : e.caseEligible case
  supportHolds : e.supportCondition s case
  modeShapeFails : h.shapeFails h.selectedShape case

/--
One explicit witness that a particular support condition is not necessary for
the candidate mode shape.

Not every support mechanism is expected to admit such a witness; this structure
exists only when the domain actually warrants one.
-/
structure SupportNotNecessary
    {Case Support Content Job Shape Capacity : Type}
    (e : EmpiricalInterface Case Support Content)
    (h : ModeHypothesis Job Shape Capacity Case)
    (s : Support) where

  case : Case
  eligible : e.caseEligible case
  modeShapeHolds : h.shapeHolds h.selectedShape case
  supportAbsent : ¬ e.supportCondition s case

/-! --------------------------------------------------------------------------
Standing capacity / mode / content non-collapse interfaces
---------------------------------------------------------------------------- -/

/--
A witness that standing capacity for the mode can remain while the candidate
mode shape fails.

This directly machine-expresses:
  capacity for Consciousness ≠ Consciousness mode
when such a domain-owned case is admitted.
-/
structure CapacityModeSeparation
    {Case Support Content Job Shape Capacity : Type}
    (e : EmpiricalInterface Case Support Content)
    (h : ModeHypothesis Job Shape Capacity Case) where

  case : Case
  eligible : e.caseEligible case
  capacityRemains : e.capacityForMode case
  modeShapeFails : h.shapeFails h.selectedShape case

/--
A content change while the candidate mode remains held.

This can witness:
  Consciousness mode ≠ particular conscious content
once the domain supplies two discriminated carried contents.
-/
structure ContentModeSeparation
    {Case Support Content Job Shape Capacity : Type}
    (e : EmpiricalInterface Case Support Content)
    (h : ModeHypothesis Job Shape Capacity Case) where

  firstCase : Case
  secondCase : Case
  firstEligible : e.caseEligible firstCase
  secondEligible : e.caseEligible secondCase
  modeFirst : h.shapeHolds h.selectedShape firstCase
  modeSecond : h.shapeHolds h.selectedShape secondCase

  firstContent : Content
  secondContent : Content
  contentsDistinct : firstContent ≠ secondContent

  firstCarriesA : e.contentCarried firstContent firstCase
  secondCarriesB : e.contentCarried secondContent secondCase

/-! --------------------------------------------------------------------------
Fixed same-level survivor surface and earned mode signature
---------------------------------------------------------------------------- -/

/--
Object-specific failure theory for one candidate Consciousness-mode shape.

`fails` must be independently specified. It is NOT defined here as
`not (shapeHolds selectedShape)`.
-/
structure ModeFailureTheory
    (Case : Type) where
  fails : Case → Prop

/--
A complete closure candidate for a proposed Consciousness mode.

This structure cannot be inhabited merely by naming a mode-like phrase. It
requires:

A. complete +3 answer-core;
B. adjudication of all six +3 pressure surfaces;
C. empirical positive/negative tracking;
D. an earned object-level failure signature over a fixed same-level survivor
   surface;
E. non-vacuous empirical anchors on both evidence sides.

Even this package is only the machine closure packet for the declared scope.
Human/domain competence of the neighbor inventory and empirical admission
remains upstream.
-/
structure ModeClosureCandidate
    {Case Support Content Neighbor Job Shape Capacity : Type}
    (e : EmpiricalInterface Case Support Content)
    (d : ExperientialDomainInterface Case Content)
    (h : ModeHypothesis Job Shape Capacity Case)
    (surface : FailureDiscrimination.DiscriminationSurface Case Neighbor)
    (f : ModeFailureTheory Case) where

  /-- Raw empirical labels cannot enter closure without lawful domain admission. -/
  admissionContract :
    ExperientialAdmissionContract e d

  plusThree :
    PlusThree.ObjectAnswerEndpoint h.toPlusThreeWorld

  pressures :
    PlusThree.PressureAdjudicated h.toPlusThreeWorld

  evidenceTracking :
    EvidenceTracking e h

  signature :
    FailureDiscrimination.EarnedSignature
      surface.eligible
      (h.shapeHolds h.selectedShape)
      f.fails

  positiveAnchor :
    ∃ x,
      e.caseEligible x
      ∧ e.evidenceStanding x = EvidenceStanding.positive
      ∧ h.shapeHolds h.selectedShape x

  negativeAnchor :
    ∃ x,
      e.caseEligible x
      ∧ e.evidenceStanding x = EvidenceStanding.negative
      ∧ f.fails x

/-! --------------------------------------------------------------------------
Closure consequences inherited from the Workbench
---------------------------------------------------------------------------- -/

/--
Any inhabited Consciousness mode closure candidate inherits the generic
Failure-Side semantic closure theorem.
-/
theorem mode_candidate_failure_side_closure
    {Case Support Content Neighbor Job Shape Capacity : Type}
    {e : EmpiricalInterface Case Support Content}
    {d : ExperientialDomainInterface Case Content}
    {h : ModeHypothesis Job Shape Capacity Case}
    {surface : FailureDiscrimination.DiscriminationSurface Case Neighbor}
    {f : ModeFailureTheory Case}
    (c : ModeClosureCandidate e d h surface f) :
    (∀ x,
      surface.eligible x →
      (f.fails x ↔ ¬ h.shapeHolds h.selectedShape x))
    ∧
    (∀ x,
      f.fails x →
      ∀ n,
        surface.relevant n →
        surface.neighborHolds n x)
    ∧
    (∃ x,
      surface.eligible x ∧
      h.shapeHolds h.selectedShape x)
    ∧
    (∃ y,
      surface.eligible y ∧
      f.fails y) := by
  have hClosure :=
    FailureDiscrimination.failure_side_discrimination_semantic_closure
      surface
      c.signature
  exact
    ⟨hClosure.1,
     hClosure.2.1,
     hClosure.2.2.2.1,
     hClosure.2.2.2.2⟩

/--
A closure candidate's empirical positive anchor is not merely labelled positive:
its required admission contract warrants the domain-owned experiential predicate.
-/
theorem mode_candidate_positive_anchor_is_experiential
    {Case Support Content Neighbor Job Shape Capacity : Type}
    {e : EmpiricalInterface Case Support Content}
    {d : ExperientialDomainInterface Case Content}
    {h : ModeHypothesis Job Shape Capacity Case}
    {surface : FailureDiscrimination.DiscriminationSurface Case Neighbor}
    {f : ModeFailureTheory Case}
    (c : ModeClosureCandidate e d h surface f) :
    ∃ x, e.caseEligible x ∧ d.modeExperiential x := by
  rcases c.positiveAnchor with ⟨x, hxEligible, hxPositive, _⟩
  exact
    ⟨x, hxEligible,
      c.admissionContract.positiveAdmitsMode x hxEligible hxPositive⟩

/--
Likewise, the empirical negative anchor is lawfully admitted as lacking the
domain-owned experiential predicate.
-/
theorem mode_candidate_negative_anchor_is_nonexperiential
    {Case Support Content Neighbor Job Shape Capacity : Type}
    {e : EmpiricalInterface Case Support Content}
    {d : ExperientialDomainInterface Case Content}
    {h : ModeHypothesis Job Shape Capacity Case}
    {surface : FailureDiscrimination.DiscriminationSurface Case Neighbor}
    {f : ModeFailureTheory Case}
    (c : ModeClosureCandidate e d h surface f) :
    ∃ x, e.caseEligible x ∧ ¬ d.modeExperiential x := by
  rcases c.negativeAnchor with ⟨x, hxEligible, hxNegative, _⟩
  exact
    ⟨x, hxEligible,
      c.admissionContract.negativeAdmitsModeAbsence
        x hxEligible hxNegative⟩

/-! --------------------------------------------------------------------------
Empirical placement and science-stop condition
---------------------------------------------------------------------------- -/

/--
The empirical surface has at least one lawfully classified POSITIVE case.

This is deliberately weaker than object closure. It records only that a
positive experiential anchor is available in the empirical interface.
-/
def HasPositiveAnchor
    {Case Support Content : Type}
    (e : EmpiricalInterface Case Support Content) : Prop :=
  ∃ x,
    e.caseEligible x ∧
    e.evidenceStanding x = EvidenceStanding.positive

/--
The empirical surface has at least one lawfully classified NEGATIVE case.

A ModeClosureCandidate requires such an anchor. INDETERMINATE cases do not
satisfy this predicate.
-/
def HasNegativeAnchor
    {Case Support Content : Type}
    (e : EmpiricalInterface Case Support Content) : Prop :=
  ∃ x,
    e.caseEligible x ∧
    e.evidenceStanding x = EvidenceStanding.negative

/--
Minimum empirical placement burden for the present Consciousness inquiry:
there must be at least one admitted case on each side of the mode distinction.
-/
def EmpiricalPlacementReady
    {Case Support Content : Type}
    (e : EmpiricalInterface Case Support Content) : Prop :=
  HasPositiveAnchor e ∧ HasNegativeAnchor e

/--
No machine closure packet can exist when the empirical interface contains no
admitted NEGATIVE anchor. This theorem is independent of the candidate job,
shape, capacity, neighbor inventory, and failure theory.
-/
theorem no_mode_closure_without_negative_anchor
    {Case Support Content Neighbor Job Shape Capacity : Type}
    {e : EmpiricalInterface Case Support Content}
    {d : ExperientialDomainInterface Case Content}
    {h : ModeHypothesis Job Shape Capacity Case}
    {surface : FailureDiscrimination.DiscriminationSurface Case Neighbor}
    {f : ModeFailureTheory Case}
    (hNoNegative : ¬ HasNegativeAnchor e) :
    ¬ Nonempty (ModeClosureCandidate e d h surface f) := by
  intro hClosure
  rcases hClosure with ⟨c⟩
  apply hNoNegative
  rcases c.negativeAnchor with ⟨x, hxEligible, hxNegative, _⟩
  exact ⟨x, hxEligible, hxNegative⟩

/--
A science-stop certificate records the precise present posture:
positive empirical placement is available, while no admitted NEGATIVE anchor
exists. The absence of a negative anchor is an epistemic stop, not a claim that
negative experiential passages do not exist.
-/
structure ScienceStopCertificate
    {Case Support Content : Type}
    (e : EmpiricalInterface Case Support Content) where
  positiveAnchor : HasPositiveAnchor e
  noNegativeAnchor : ¬ HasNegativeAnchor e

/-- A science-stop certificate blocks empirical placement readiness. -/
theorem science_stop_not_empirically_placed
    {Case Support Content : Type}
    {e : EmpiricalInterface Case Support Content}
    (s : ScienceStopCertificate e) :
    ¬ EmpiricalPlacementReady e := by
  intro hReady
  exact s.noNegativeAnchor hReady.2

/-! --------------------------------------------------------------------------
Current empirical adjudication ledger
---------------------------------------------------------------------------- -/

/--
The present human/domain adjudication of the strongest empirical cases examined
in Pass 4U. These constructors are evidence packages, not ontological kinds.
-/
inductive CurrentScienceCase where
  | affirmativePositive
  | nremCompleteUnconsciousness
  | meditativeCessation
  | propofolXenon
  deriving DecidableEq, Repr

/--
Current evidentiary standings after application of the v0.5 admission rules.

* `affirmativePositive` represents an ordinary affirmative experiential anchor;
* all three candidate negative packages remain INDETERMINATE;
* no NEGATIVE case is currently admitted.

These labels encode the present scientific adjudication. They do not prove the
underlying empirical facts from first principles.
-/
def currentScienceStanding : CurrentScienceCase → EvidenceStanding
  | .affirmativePositive => .positive
  | .nremCompleteUnconsciousness => .indeterminate
  | .meditativeCessation => .indeterminate
  | .propofolXenon => .indeterminate

/--
Minimal empirical interface for the current science-stop ledger.
Support/content fields are intentionally inert because this ledger is used only
to certify the positive/negative placement boundary.
-/
def currentScienceEmpirical :
    EmpiricalInterface CurrentScienceCase Unit Unit where
  caseEligible := fun _ => True
  evidenceStanding := currentScienceStanding
  evidenceWarrant := fun x standing => standing = currentScienceStanding x
  evidenceWarranted := by
    intro x _
    rfl
  capacityForMode := fun _ => True
  supportCondition := fun _ _ => False
  contentCarried := fun _ _ => False

/-- The present ledger contains a positive experiential anchor. -/
theorem current_science_has_positive_anchor :
    HasPositiveAnchor currentScienceEmpirical := by
  refine ⟨CurrentScienceCase.affirmativePositive, ?_, ?_⟩
  · trivial
  · rfl

/-- None of the three present negative candidates is admitted as NEGATIVE. -/
theorem current_science_has_no_negative_anchor :
    ¬ HasNegativeAnchor currentScienceEmpirical := by
  intro h
  rcases h with ⟨x, _, hxNegative⟩
  cases x <;>
    simp [currentScienceEmpirical, currentScienceStanding] at hxNegative

/-- Machine-readable science-stop certificate for the current empirical ledger. -/
theorem currentScienceStop : ScienceStopCertificate currentScienceEmpirical := by
  constructor
  · exact current_science_has_positive_anchor
  · exact current_science_has_no_negative_anchor

/-- The present science ledger is not yet ready for empirical mode placement. -/
theorem current_science_not_empirically_placed :
    ¬ EmpiricalPlacementReady currentScienceEmpirical :=
  science_stop_not_empirically_placed currentScienceStop

/--
Main stop theorem for the present phase.

For ANY proposed C3R-style mode hypothesis, experiential-domain interface,
neighbor surface, and failure theory over the current science cases, the present
empirical ledger cannot inhabit a ModeClosureCandidate because it contains no
admitted NEGATIVE experiential anchor.
-/
theorem current_science_blocks_mode_closure
    {Neighbor Job Shape Capacity : Type}
    {d : ExperientialDomainInterface CurrentScienceCase Unit}
    {h : ModeHypothesis Job Shape Capacity CurrentScienceCase}
    {surface : FailureDiscrimination.DiscriminationSurface
      CurrentScienceCase Neighbor}
    {f : ModeFailureTheory CurrentScienceCase} :
    ¬ Nonempty
      (ModeClosureCandidate currentScienceEmpirical d h surface f) :=
  no_mode_closure_without_negative_anchor
    current_science_has_no_negative_anchor

/-! --------------------------------------------------------------------------
Current location ledger
---------------------------------------------------------------------------- -/

/--
The present inquiry state. These fields are PROPOSITIONS, not Boolean labels,
so a future derivation can replace the present open ledger with earned proofs.
-/
structure LocationLedger where
  jobLocated : Prop
  shapeLocated : Prop
  lossLocated : Prop

/--
Current human/domain object-location ledger for C3R.

Pass 4T located the scoped job, weakest honest shape, and loss for the repaired
experiential-standing mode. These entries record that adjudicated status. They
do not by themselves instantiate a complete `ModeHypothesis` or prove empirical
placement; the latter remains blocked by the missing NEGATIVE anchor certified
above.
-/
def currentLedger : LocationLedger where
  jobLocated := True
  shapeLocated := True
  lossLocated := True

def ObjectLocationReady (l : LocationLedger) : Prop :=
  l.jobLocated ∧ l.shapeLocated ∧ l.lossLocated

/-- C3R's scoped job, shape, and loss are currently located. -/
theorem current_object_location_ready :
    ObjectLocationReady currentLedger := by
  exact ⟨trivial, trivial, trivial⟩


end ConsciousnessWorkbench
end StructuralFlow



/-!
===============================================================================
CONSCIOUSNESS -> PUBLIC UNIVERSAL KERNEL v1.0 CONTRACT ADAPTER v0.2
===============================================================================

Purpose
-------
This section is a thin instance/domain layer over the public Structural Flow
Universal Kernel v1.0 supplied as the separate public kernel source.

It does NOT modify the public kernel.

It carries forward the machine-clean Consciousness v0.7 investigation machinery
needed at the present science stop, then routes the frozen Consciousness state
through the PUBLIC Universal Translation Contract:

* C3R scoped object location: discharged at the current human/domain standing;
* positive experiential entry anchor: discharged;
* negative experiential entry anchor: OPEN;
* biological/physical realization mechanism: downstream-domain burden, OPEN.

Expected public-kernel disposition
----------------------------------
  NotYetAdjudicable

because one REQUIRED DOMAIN-ENTRY burden remains open and no required burden is
encoded as violated.

A clean Lean elaboration certifies only that this encoded interaction is accepted
at the declared formal scope. It does not empirically validate Consciousness,
create a negative experiential anchor, or promote Consciousness into the public
universal kernel.
===============================================================================
-/

namespace StructuralFlow
namespace ConsciousnessPublicKernelAdapter

open UniversalTranslationContract
open ConsciousnessWorkbench

/-! --------------------------------------------------------------------------
Public-kernel burden vocabulary for the frozen Consciousness packet
---------------------------------------------------------------------------- -/

inductive ObjectBurden where
  | jobLocated
  | shapeLocated
  | lossLocated
  | sameLevelNonAbsorption
  | falseSubstitutesCleared
  | failureSideArchitecture
  deriving DecidableEq, Repr

inductive DomainBurden where
  | positiveExperientialAnchor
  | negativeExperientialAnchor
  | realizationMechanism
  deriving DecidableEq, Repr

/-! --------------------------------------------------------------------------
Current public-contract states
---------------------------------------------------------------------------- -/

/--
All public universal-core burdens are discharged for this translation packet.
This does not assert that Consciousness belongs to the universal kernel; it says
only that no public-core translation requirement is currently encoded as open or
violated for this instance packet.
-/
def coreState (_ : CoreBurden) : Disposition :=
  .discharged

/--
The current human/domain C3R adjudication has located the scoped object burdens
used by this adapter. The empirical negative anchor is handled separately as a
domain-entry burden below.
-/
def objectRequired (_ : ObjectBurden) : Prop := True

def objectState (_ : ObjectBurden) : Disposition :=
  .discharged

/-- Positive and negative experiential anchors participate in admission. -/
def domainEntryRequired : DomainBurden -> Prop
  | .positiveExperientialAnchor => True
  | .negativeExperientialAnchor => True
  | .realizationMechanism => False

/-- Realization/mechanism remains downstream and domain-owned. -/
def domainDownstreamRequired : DomainBurden -> Prop
  | .positiveExperientialAnchor => False
  | .negativeExperientialAnchor => False
  | .realizationMechanism => True

/--
Current domain state is the frozen adjudicated science ledger translated into
the public contract.  We do not ask Lean to decide the arbitrary propositions
`HasPositiveAnchor` / `HasNegativeAnchor`; those standings are already proved
below in the Consciousness science ledger.

Positive experiential entry is therefore discharged, negative experiential
entry remains open, and realization/mechanism remains downstream and open.
-/
def domainState : DomainBurden -> Disposition
  | .positiveExperientialAnchor => .discharged
  | .negativeExperientialAnchor => .open
  | .realizationMechanism => .open

/--
Public-contract evidence remains tied to the frozen science ledger rather than
merely to the assigned disposition.
-/
def domainEvidence : DomainBurden -> Disposition -> Prop
  | .positiveExperientialAnchor, state =>
      state = .discharged
      ∧ HasPositiveAnchor currentScienceEmpirical
  | .negativeExperientialAnchor, state =>
      state = .open
      ∧ ¬ HasNegativeAnchor currentScienceEmpirical
  | .realizationMechanism, state =>
      state = .open

theorem positive_entry_is_discharged :
    domainState .positiveExperientialAnchor = .discharged := by
  rfl

theorem positive_entry_is_science_warranted :
    HasPositiveAnchor currentScienceEmpirical :=
  current_science_has_positive_anchor

theorem negative_entry_is_open :
    domainState .negativeExperientialAnchor = .open := by
  rfl

theorem negative_entry_is_science_warranted_open :
    ¬ HasNegativeAnchor currentScienceEmpirical :=
  current_science_has_no_negative_anchor

theorem realization_mechanism_is_open :
    domainState .realizationMechanism = .open := by
  rfl

/-! --------------------------------------------------------------------------
Public Universal Translation Contract packet
---------------------------------------------------------------------------- -/

noncomputable def consciousnessPublicWorld :
    UniversalTranslationContract.World ObjectBurden DomainBurden where

  coreState := coreState
  coreEvidence := fun b state => state = coreState b
  coreWarrant := by
    intro b
    rfl

  objectRequired := objectRequired
  objectState := objectState
  objectEvidence := fun b state => state = objectState b
  objectWarrant := by
    intro b _
    rfl

  domainEntryRequired := domainEntryRequired
  domainDownstreamRequired := domainDownstreamRequired
  domainRoleDisjoint := by
    intro b
    cases b <;>
      simp [domainEntryRequired, domainDownstreamRequired]

  domainState := domainState
  domainEvidence := domainEvidence
  domainWarrant := by
    intro b _
    cases b with
    | positiveExperientialAnchor =>
        exact ⟨rfl, current_science_has_positive_anchor⟩
    | negativeExperientialAnchor =>
        exact ⟨rfl, current_science_has_no_negative_anchor⟩
    | realizationMechanism =>
        rfl

/-! --------------------------------------------------------------------------
Exact public-kernel disposition
---------------------------------------------------------------------------- -/

/-- No REQUIRED public-contract burden is currently encoded as violated. -/
theorem current_packet_has_no_known_failure :
    ¬ Nonempty
      (UniversalTranslationContract.KnownFailure consciousnessPublicWorld) := by
  intro h
  rcases h with ⟨failure⟩
  cases failure with
  | core burden failed =>
      simp [consciousnessPublicWorld, coreState] at failed
  | object burden _ failed =>
      simp [consciousnessPublicWorld, objectState] at failed
  | domainEntry burden _ failed =>
      cases burden <;>
        simp [consciousnessPublicWorld, domainState] at failed

/-- The missing NEGATIVE experiential anchor is an exact located open entry burden. -/
def negativeAnchorOpen :
    UniversalTranslationContract.KnownOpen consciousnessPublicWorld :=
  UniversalTranslationContract.KnownOpen.domainEntry
    DomainBurden.negativeExperientialAnchor
    (by simp [consciousnessPublicWorld, domainEntryRequired])
    (by
      simpa [consciousnessPublicWorld] using negative_entry_is_open)

/--
Main public-kernel adjudication for the frozen Consciousness state.

The packet is NOT YET ADJUDICABLE because the required NEGATIVE experiential
entry burden remains OPEN and there is no required violation.
-/
theorem consciousness_public_kernel_not_yet_adjudicable :
    UniversalTranslationContract.NotYetAdjudicable consciousnessPublicWorld := by
  constructor
  · exact current_packet_has_no_known_failure
  · exact ⟨negativeAnchorOpen⟩

/-- The open entry burden blocks structural conformance at the current evidence state. -/
theorem consciousness_public_kernel_not_structural_conforms :
    ¬ UniversalTranslationContract.StructuralConforms consciousnessPublicWorld := by
  simpa [UniversalTranslationContract.StructuralConforms] using
    (UniversalTranslationContract.knownOpen_blocks_gatingPass
      negativeAnchorOpen)

/-- The open realization mechanism is downstream-domain work, not an entry failure. -/
theorem realization_remains_downstream_open :
    UniversalTranslationContract.DomainBurdenOpen consciousnessPublicWorld := by
  refine ⟨DomainBurden.realizationMechanism, ?_, ?_⟩
  · simp [consciousnessPublicWorld, domainDownstreamRequired]
  · simpa [consciousnessPublicWorld] using realization_mechanism_is_open

/--
The current Consciousness science stop and the public-kernel translation result
coexist without contradiction: object location is ready, empirical placement is
not, and the public contract therefore returns NotYetAdjudicable.
-/
theorem consciousness_public_checkpoint :
    ObjectLocationReady currentLedger
    ∧ ¬ EmpiricalPlacementReady currentScienceEmpirical
    ∧ UniversalTranslationContract.NotYetAdjudicable consciousnessPublicWorld
    ∧ UniversalTranslationContract.DomainBurdenOpen consciousnessPublicWorld := by
  exact
    ⟨current_object_location_ready,
     current_science_not_empirically_placed,
     consciousness_public_kernel_not_yet_adjudicable,
     realization_remains_downstream_open⟩

/-!
Machine-facing compression
--------------------------
C3R OBJECT LOCATION READY
+ POSITIVE EXPERIENTIAL ENTRY DISCHARGED
+ NEGATIVE EXPERIENTIAL ENTRY OPEN
+ REALIZATION MECHANISM DOWNSTREAM / OPEN
=> PUBLIC UNIVERSAL KERNEL v1.0: NOT YET ADJUDICABLE
-/

end ConsciousnessPublicKernelAdapter
end StructuralFlow
