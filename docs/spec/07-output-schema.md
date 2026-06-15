# Canonical output schema

Every APRICORE analysis must follow this structure exactly. The schema makes analyses
comparable across sessions, practitioners, and tools: a reader who knows section 2.3
always finds the risk-of-inaction assessment there, regardless of who ran the analysis
or when.

**Language is a runtime parameter; structure is a fixed contract.** The prose inside
each section may be written in any language the context demands. The section numbers
and their assigned meanings are invariant. Tools, downstream skills, and cross-
references (e.g. "mark section 2.1 with [REV]") point at section numbers — so numbers
must never be reassigned, merged, or reordered. Only the prose language varies.

**The `[REV]` marker** signals that a section was revised during the feedback loop
(Communicate probe or Realize insight triggered a return to Analyze or Prioritize).
Cross-reference `spec/06-disciplines.md` for the full feedback-loop rules; they are
not repeated here.

---

## 1. Analysis

### 1.1 Sharpened summary
A precise restatement of the actual problem — not a paraphrase of the original
request. "Sharpened" is load-bearing: this is the active result of the Analyze phase,
not a copy of the ticket title. It may differ substantially from what was submitted.

### 1.2 Explicit requirements
What the request or ticket states openly and unambiguously — the literal, stated
demands that can be verified directly against the input text.

### 1.3 Implicit assumptions
What the request takes for granted without stating: unstated preconditions, assumed
technical or organisational context, and implicit acceptance criteria the requester
did not articulate.

### 1.4 Ambiguities / contradictions / TBDs
Every term, requirement, or constraint that is vague, overloaded, undefined,
internally contradictory, or explicitly left open ("TBD"). These are blockers or
risk factors for correct implementation.

### 1.5 Signal / symptom / possible cause
The three-layer separation that prevents premature closure: what is observable and
reported (signal), what friction or anomaly it points at (symptom), and what
structural factors could generate that symptom (possible cause). Symptom and cause
must never be collapsed into a single statement.

### 1.6 Codebase context
Relevant technical context when source code is available: affected modules,
classes, functions, or components; dependencies and coupling; existing domain
patterns and similar prior logic; validation, state handling, error handling;
test coverage and likely regression zones. State explicitly when codebase access
is unavailable and reduce certainty accordingly.

### 1.7 Evidence state
A labelled inventory of what is known and at what confidence level. Every claim
is tagged with one of five evidence labels: **Confirmed** · **Likely** ·
**Possible** · **Anecdotal** · **Unsubstantiated**. A stakeholder statement
is not evidence. A metric change is not causal proof.

### 1.8 Distortion level — interpretive power & framing bias
A mandatory standalone section examining who frames the problem and how that
framing may distort the analysis. Four sub-questions must be addressed: (1) Who
defines the problem here — and does this person hold interpretive power (hierarchy,
budget, rhetoric)? (2) Whose voice is absent from the requirement (affected users,
Ops, QA, other teams)? (3) Does the chosen framing serve one party more than
others? (4) Is the urgency structurally justified or socially produced (urgency
theater)? This section must never be merged into section 1.5.

---

## 2. Prioritization

### 2.1 Priority
The assigned priority level: **P0** (immediate action justified) · **P1** (high
priority, next clarification and planning) · **P2** (relevant but not critical) ·
**P3** (low priority / opportunistic) · **HOLD** (not decision-ready, evidence too
weak, or too unclear to prioritize). A [REV] marker here signals the level was
revised after the Communicate probe.

### 2.2 Justification
The explicit reasoning behind the priority assignment. Every assignment must be
supported by at least two criteria: cause-proximity (does the proposed measure
address the problem core, not just a surface symptom?) and timeliness (why now
and not later?). Loudness, institutional pressure, and urgency theater are not
valid justifications.

### 2.3 Risk of inaction
What concretely happens if this item is not addressed — technical debt accumulation,
user harm, security exposure, business impact, or compounding costs. "Nothing" is
a valid answer only if argued.

### 2.4 Risk of wrong handling
What can go wrong if the item is handled incorrectly or prematurely: regression,
false fix, scope creep, misdiagnosed cause, wasted implementation effort, or
introducing new problems while patching a symptom.

### 2.5 Cause-proximate vs. symptom-proximate
An explicit statement of whether the recommended action addresses the problem at
cause level or symptom level. If symptom-proximate, state why that is nonetheless
the correct choice given current constraints. This prevents hidden technical debt
from accumulating under the label of "done."

---

## 3. Communication — examination and mirror space

Communicate is not status reporting. It is an examination and mirror space: a
structured challenge of the analysis and priority before action is recommended.
Section 3.1 (analysis probe) is mandatory, not decoration.

### 3.1 Analysis probe
An active challenge of the core claims from sections 1 and 2, executed before
mirroring perspectives. Three questions must be answered: (1) Which assumption
from section 1.3 is hardest to defend? (2) Which perspective would most directly
question the priority from section 2.1? (3) Where would an informed skeptic say
"that is not right"? If the probe surfaces new findings, the feedback loop is
triggered: affected sections in 1 or 2 are revised and marked [REV] before
proceeding to section 4.

### 3.2 Relevant perspectives
For each stakeholder role that has a material stake in this problem: their likely
concern, probable objection, blind spot, and required decision input. Roles to
consider (include only those relevant): Management / Leadership, Product / PM,
UI/UX, Frontend, Backend, QA, Security, SEO, DevOps / Ops, Legal / Compliance,
Support / Customer perspective.

### 3.3 Possible objections
The strongest arguments against the current analysis, priority assignment, or
recommended action — sourced from the perspectives in 3.2 or from the probe in
3.1. These must be genuine objections, not strawmen.

### 3.4 Communication risks
Failure modes in how this analysis could be misread or misused: false certainty,
underestimated risk, over-dramatization, unresolved terminology, hidden trade-offs,
unclear ownership. Naming these prevents the Communicate phase from producing
false consensus.

### 3.5 Neutral reframing
A version of the problem statement that no single stakeholder party owns. A neutral
reframe strips advocacy framing, urgency theater, and solution-bias from the
problem description so that all parties can engage with the same problem definition.

### 3.6 Feedback check
The explicit gate between Communicate and Realize. Has the Communicate phase
revealed blind spots in section 1 (Analysis) or section 2 (Prioritization)?
If yes: mark the affected sections with [REV], update them, and then proceed to
section 4. If no: proceed directly to section 4. An analysis that reaches Realize
with zero [REV] markings is a warning signal — either the ticket was trivial or
the probe in 3.1 did not challenge sufficiently.

> **Optional Clarity Brief:** The Communicate phase may additionally yield a
> Clarity Brief — a one-page distillation of sections 3.2–3.5 for stakeholders
> who need to engage with the problem definition without reading the full analysis.
> The Clarity Brief is not part of the numbered schema and is not a mandatory
> output. Produce it when a shareable stakeholder summary is useful.

---

## 4. Realize

### 4.1 What is robustly clear
The subset of the analysis that can be stated with confidence after sections 1–3:
confirmed facts, validated assumptions, and conclusions that would survive skeptical
review. "Robustly clear" means it could be acted on without further investigation.

### 4.2 What remains open
Everything that cannot be stated with confidence: unresolved ambiguities from 1.4,
unconfirmed causal hypotheses from 1.5, unanswered questions from the probe (3.1),
and any perspective from 3.2 that raised an objection not yet resolved. Open items
must be explicitly listed, not silently dropped.

### 4.3 Decision readiness
An assessment of whether the analysis is now sufficient to drive a decision. Options:
implementation is justified now · further analysis required first · data collection
or measurement needed · specialist or domain decision required · security or legal
review required · ticket must return to requirements side · problem should be split
into smaller scopes · do not pursue for now.

### 4.4 Recommended next step
One concrete action, addressed to one responsible party. Not a list of options —
a single recommended step that follows logically from 4.3. If decision readiness
is insufficient, the recommended next step is the clarification action, not
implementation.

### 4.5 Corrected ticket version
A reframed version of the original requirement that incorporates all findings from
sections 1–4: correct problem framing, explicit acceptance criteria, removed
solution-bias, and clearly scoped boundaries. This is the input-ready form of the
requirement — what a ticket should say to be correctly implemented.

---

## 5. Brief conclusion

3 to 8 precise bullet points summarizing the analysis. Rules:
- No repetition of content already stated in detail in sections 1–4
- No marketing language, no hedging superlatives
- Each point must be independently useful to a reader who has not read the full analysis
- Stated in the same language as the rest of the analysis

---

## 6. Security review *(optional)*

Include when the request touches authentication, authorisation, data validation,
trust boundaries, input handling, data exposure, or abuse vectors. Covers: auth /
authz gaps, injection risks (XSS, CSRF, IDOR, SSRF, SQL), validation failures,
broken trust boundaries, data leakage, rate limiting, insecure defaults, and
spam / abuse / bot vectors.

---

## 7. Test and quality consequences *(optional)*

Include when the change has meaningful regression risk, observability impact, or
test coverage implications. Covers: regression probability, missing or broken tests,
observability gaps, migration and rollback risk, and hidden coupling that a naive
implementation would miss.

---

## 8. SEO / product consequences *(optional)*

Include when the change affects discoverability, rendering, content structure, or
user-facing product behavior. Covers: crawlability and indexability, rendering
implications (SSR vs. CSR), structured data, duplicate content risk, Core Web
Vitals / performance effects, information architecture mismatches, and unclear
acceptance criteria for user-facing behavior.

---

## Scoring model *(activate when useful)*

Score each dimension 0–5 to produce a concise readiness profile. Useful when
communicating analysis depth to stakeholders or when comparing multiple items.

| Dimension | Score |
|---|---|
| Clarity of requirement | |
| Evidence strength | |
| Cause precision | |
| Implementation readiness | |
| Security relevance | |
| Regression risk | |
| Stakeholder conflict potential | |

Scale: **0** = not present / completely unclear · **1** = very weak · **2** = weak ·
**3** = medium · **4** = strong · **5** = very strong

---

## Hard rules

These govern every APRICORE output and cannot be overridden by framing or time pressure:

- No implementation-first behavior: section 4 is never reached before sections 1–3 are complete
- No invented certainty: claims without evidence carry an explicit evidence label (section 1.7)
- No euphemisms for unclear requirements: 1.4 names ambiguities directly
- No acceptance of urgency without justification: section 2.2 must explain *why now*
- Symptom and cause are never collapsed into one statement (section 1.5)
- No "solution" section before the problem is correctly framed
- The analysis probe (section 3.1) is mandatory — Communicate is not a perspective catalogue
- Distortion level (section 1.8) is always its own section — never merged into 1.5
