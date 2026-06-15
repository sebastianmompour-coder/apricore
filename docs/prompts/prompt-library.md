# APRICORE prompt library

**How to use:** Paste the relevant prompt plus your raw input — a ticket, bug report, feature request, stakeholder statement, or any vague work item — into any capable LLM. The prompts are model-agnostic: no vendor-specific syntax, no API calls, no tool integrations required. Any language model that can follow multi-step instructions will work.

Choose the prompt that matches what you need:

- **Master prompt** — runs the full A·P·C·R pipeline and produces the canonical output schema. Use this when you have a complete work item and want a full structured analysis.
- **Per-phase prompts** — run a single phase in isolation. Use these when you have already completed earlier phases and want to continue, or when you need to re-run one phase after a revision.
- **Distortion-lens prompt** — runs only the bias and power analysis. Use this when you want a focused check on who is framing the problem and whether the urgency is real.

---

## Master prompt

The master prompt runs the complete APRICORE pipeline — Analyze, Prioritize, Communicate, Realize — and produces the full canonical output schema (sections 1.1 through 5, plus optional sections 6–8 where relevant).

```
You are running a full APRICORE analysis. APRICORE is a four-phase problem-definition framework: Analyze, Prioritize, Communicate, Realize. Its purpose is to determine what the actual problem is before deciding how or whether to act on it. It refuses to take any input at face value.

## Core constraints — these govern every section you write

1. Do not confuse signal, symptom, opinion, urgency, hierarchy, or frustration with the actual problem. Each is a distinct epistemic category. Conflating them is a methodology failure.
2. Do not jump directly to implementation. Realize precedes execution; execution is not part of this analysis.
3. Do not assume the input is already correct. Treat it as raw material, not ground truth.
4. Do not assume the loudest framing is the right one. Volume, institutional power, and time pressure are not proxies for cause-proximity.
5. Use codebase context if it is present. If it is absent, explicitly reduce certainty in every causal claim.
6. Never invent certainty. A hypothesis is a hypothesis. A confirmed cause is a confirmed cause. Never present them as equivalent. If verification has not occurred, the statement must say so.

## Evidence labels

Apply exactly these five labels to every claim in the analysis:
- **Confirmed** — verified by direct observation, reproduction, or measurement
- **Likely** — strongly supported by available evidence but not yet directly verified
- **Possible** — consistent with available evidence but competing explanations exist
- **Anecdotal** — based on a single report or informal account; a signal, not a pattern
- **Unsubstantiated** — asserted without supporting evidence; recorded to make the gap explicit

A stakeholder statement is not evidence. A metric change is not causal proof. A proposed solution is not a correctly framed problem.

## The feedback loop and [REV] marking

During Communicate (section 3), run the analysis probe. If the probe reveals a gap, error, or materially different reading in the Analyze or Prioritize sections, do the following:
- Revise the affected section (1.x or 2.x)
- Mark it with [REV] — for example: "### 1.3 Implicit assumptions [REV]"
- Add a note below the revision explaining what changed and why
- Then continue with the rest of Communicate and proceed to Realize

A section marked [REV] signals to every reader that the original framing was superseded. Never remove [REV] markers or write over revisions without marking them.

A zero-revision analysis is a warning signal. If Communicate produces no [REV] markings, either the ticket was trivially simple or the probe did not challenge the core claims hard enough.

The analysis is complete only when Realize stands without generating new [REV] markings.

## Output structure

Produce every section listed below. Do not skip sections. Do not merge sections that have distinct numbers. Section numbers are invariant — do not reorder, renumber, or rename them.

---

### 1. Analysis

**1.1 Sharpened summary**
A precise restatement of the actual problem — not a paraphrase of the original request. This is the active result of analysis, not a copy of the input. It may differ substantially from what was submitted.

**1.2 Explicit requirements**
What the request states openly and unambiguously — the literal, stated demands verifiable against the input text.

**1.3 Implicit assumptions**
What the request takes for granted without stating: unstated preconditions, assumed technical or organizational context, implicit acceptance criteria the requester did not articulate. Apply evidence labels.

**1.4 Ambiguities / contradictions / TBDs**
Every term, requirement, or constraint that is vague, overloaded, undefined, internally contradictory, or explicitly left open. Name them directly — no euphemisms.

**1.5 Signal / symptom / possible cause**
Three-layer separation. What is observable and reported (signal). What friction or anomaly it points at (symptom). What structural factors could generate that symptom (possible cause). Symptom and cause must never be collapsed into a single statement.

**1.6 Codebase context**
If source code is available: affected modules, classes, functions, or components; dependencies and coupling; existing domain patterns; validation, state handling, error handling; test coverage and likely regression zones.
If codebase access is unavailable: state this explicitly and reduce certainty in every causal claim accordingly. Do not make confirmed-sounding cause claims without code evidence.

**1.7 Evidence state**
A labeled inventory of what is known and at what confidence level. Tag every claim with one of the five evidence labels. Confirm explicitly which claims are Confirmed vs. merely Likely or Possible.

**1.8 Distortion level — interpretive power and framing bias**
A mandatory standalone section. Never merge this into 1.5. Answer all four questions:
1. Who defines the problem here — and does this person hold interpretive power (hierarchy, budget control, rhetorical dominance)?
2. Whose voice is absent from the requirement (affected users, operations teams, QA, adjacent teams)?
3. Does the chosen framing serve one party more than others? Name the asymmetry explicitly.
4. Is the urgency structurally justified, or is it socially produced (urgency theater)? Distinguish between genuine structural urgency (regulatory deadline, active data loss, revenue-blocking outage) and social pressure without structural justification.

---

### 2. Prioritization

**2.1 Priority**
Assign one level: P0 (immediate action justified) · P1 (high priority, next planning cycle) · P2 (relevant but not critical) · P3 (low priority / opportunistic) · HOLD (not decision-ready). If the Communicate probe later overturns this, mark it [REV].

**2.2 Justification**
Explicit reasoning behind the priority assignment. Every assignment must address at least two criteria:
- Cause-proximity: does the proposed measure address the problem core, not just a surface symptom?
- Timeliness: why now and not later? What changes if this is deferred by one sprint, one quarter, or indefinitely?
Loudness, institutional pressure, and urgency theater are not valid justifications.

**2.3 Risk of inaction**
What concretely happens if this item is not addressed: technical debt accumulation, user harm, security exposure, business impact, compounding costs. "Nothing" is a valid answer only if argued.

**2.4 Risk of wrong handling**
What can go wrong if the item is handled incorrectly or prematurely: regression, false fix, scope creep, misdiagnosed cause, wasted effort.

**2.5 Cause-proximate vs. symptom-proximate**
An explicit statement of whether the recommended action addresses the problem at cause level or symptom level. If symptom-proximate, state why that is nonetheless the correct choice given current constraints.

---

### 3. Communication — examination and mirror space

Communicate is not status reporting. It is an active challenge of the conclusions from sections 1 and 2.

**3.1 Analysis probe** *(mandatory — run this before writing any other section 3 content)*
Explicitly contest the core claims from sections 1 and 2. Answer all three questions:
1. Which assumption from section 1.3 is hardest to defend? If this assumption is wrong, what changes in the analysis?
2. Which perspective would most directly question the priority assigned in section 2.1? Name the specific role and why their informed view would lead to a different priority assignment.
3. Where would an informed skeptic — someone with relevant domain knowledge who has read the analysis — say "that is not right"? Identify the most vulnerable specific claim, not a general area of uncertainty.

If the probe yields new insight, activate the feedback loop: revise the affected section (1.x or 2.x), mark it [REV], note what changed and why, then continue with 3.2.

**3.2 Relevant perspectives**
For each stakeholder role with a material stake in this problem, provide: their likely concern, probable objection to the current framing, structural blind spot, and required decision input. Include only roles that are genuinely relevant. Roles to consider: Management / Leadership, Product / PM, UI/UX, Frontend, Backend, QA, Security, SEO, DevOps / Ops, Legal / Compliance, Support / Customer perspective.

**3.3 Possible objections**
The strongest arguments against the current analysis, priority assignment, or recommended action. These must be genuine objections, not strawmen.

**3.4 Communication risks**
Failure modes in how this analysis could be misread or misused. Evaluate: false certainty, underestimated risk, over-dramatization, unresolved terminology, hidden trade-offs, unclear ownership.

**3.5 Neutral reframing**
A version of the problem statement that no single stakeholder party owns. Strip advocacy framing, urgency theater, and solution-bias from the problem description so that all parties can engage with the same problem definition.

**3.6 Feedback check**
Has the Communicate phase revealed blind spots in section 1 or section 2?
- Yes → mark the affected sections [REV], update them, then proceed to section 4
- No → proceed directly to section 4

---

### 4. Realize

**4.1 What is robustly clear**
The subset of the analysis that can be stated with confidence after sections 1–3: claims that survived the probe, grounded in evidence, that would hold up to skeptical review. Use certainty labels (Confirmed / Likely / Possible) here. Never assert a Confirmed finding that the analysis has not actually verified.

**4.2 What remains open**
Everything that cannot be stated with confidence: unresolved ambiguities from 1.4, unconfirmed causal hypotheses from 1.5, unanswered probe questions from 3.1, unresolved perspective objections from 3.2. List explicitly — do not silently drop open items.

**4.3 Decision readiness**
Is the analysis sufficient to drive a decision now? Route to exactly one of these outcomes:
- Implementation is sensible now
- Further analysis required first (specify the gap)
- Data collection or measurement needed first (specify what)
- A domain decision required first (specify who must decide)
- A security or legal review required first
- Ticket must return to the requesting side (specify why)
- Problem should be split into smaller scopes (specify the sub-problems)
- Do not pursue for now (argue the cost-benefit case)

**4.4 Recommended next step**
One concrete action, addressed to one responsible party. Not a list of options — a single recommended step that follows logically from 4.3. If decision readiness is insufficient, the recommended next step is the clarification action, not implementation.

**4.5 Corrected ticket version**
A reframed version of the original requirement that incorporates all findings from sections 1–4: correct problem framing, explicit acceptance criteria, removed solution-bias, and clearly scoped boundaries. This is what the ticket should say to be correctly implemented.

---

### 5. Brief conclusion

3 to 8 precise bullet points summarizing the analysis. Each point must be independently useful to a reader who has not read the full analysis. No repetition of content already stated in detail. No hedging superlatives. No marketing language.

---

### 6. Security review *(include if the request touches authentication, authorization, data validation, trust boundaries, input handling, data exposure, or abuse vectors)*

Cover: auth/authz gaps, injection risks (XSS, CSRF, IDOR, SSRF, SQL), validation failures, broken trust boundaries, data leakage, rate limiting, insecure defaults, spam/abuse/bot vectors.

### 7. Test and quality consequences *(include if the change has meaningful regression risk, observability impact, or test coverage implications)*

Cover: regression probability, missing or broken tests, observability gaps, migration and rollback risk, hidden coupling.

### 8. SEO / product consequences *(include if the change affects discoverability, rendering, content structure, or user-facing product behavior)*

Cover: crawlability and indexability, rendering implications (SSR vs. CSR), structured data, duplicate content risk, Core Web Vitals / performance effects, information architecture mismatches, unclear acceptance criteria.

---

## Input

<PASTE YOUR INPUT HERE>
```

---

## Per-phase prompts

### Analyze — phase 1 only

Use this when you want to run only the Analyze phase — for example, when you need a problem hypothesis before a planning meeting, or when you are feeding Analyze output into a separate Prioritize session.

```
You are running the Analyze phase of an APRICORE analysis.

The Analyze phase answers one guiding question: Have we understood the actual problem — or have we only named a symptom?

Its output is a verifiable problem hypothesis: a falsifiable, evidence-grounded claim about what the actual problem is and why. Not "the system is slow" but "the system is slow because query X on table Y executes without a covering index — suspected from profiling data dated [date]." The distinction between naming a symptom and formulating a verifiable hypothesis is the minimum standard of this phase.

## Core constraints

- Do not accept the input at face value. Tickets are written under time pressure by people with partial information.
- Do not assume the loudest framing is the right one.
- Use codebase context if it is present. If it is absent, explicitly state this and reduce certainty in every causal claim.
- Never invent certainty. Label every claim with its evidence status.

## Evidence labels — apply these to every claim

- **Confirmed** — verified by direct observation, reproduction, or measurement
- **Likely** — strongly supported by available evidence but not yet directly verified
- **Possible** — consistent with available evidence but competing explanations exist
- **Anecdotal** — based on a single report or informal account
- **Unsubstantiated** — asserted without supporting evidence

## Request classification

Before beginning the six analysis levels, classify the input using one or more of these categories:
- **Clear** — requirements are explicit, bounded, and internally consistent
- **Partially clear** — core intent is recoverable but some requirements are implied or open-ended
- **Ambiguous** — the same wording supports multiple incompatible interpretations
- **Contradictory** — different parts of the input point in incompatible directions
- **Underspecified** — requirements are present but missing enough detail to drive a reliable implementation decision
- **Solution-biased** — the input pre-selects a solution before the problem has been correctly framed
- **Politically framed** — the wording reflects the interests of the person who wrote it more than the problem itself
- **Symptom-language-only** — the input describes an observable anomaly without any causal claim

A single input can carry more than one classification simultaneously. The most restrictive one governs what must be resolved before Prioritize can proceed with confidence.

## The six determinations — answer all six for every input

1. **What is explicitly required** — what the input states directly, in its own words, with no inference added
2. **What is only implied** — what must be true for the explicit requirements to make sense, but is never stated
3. **What is vague, overloaded, or undefined** — terms or scope boundaries different readers would interpret differently
4. **What is signal vs. symptom vs. possible cause** — the observable trigger, the functional anomaly, and the structural explanation that could generate that anomaly. These are three distinct epistemic categories. Never collapse them.
5. **What evidence exists** — confirmed, likely, possible, anecdotal, or unsubstantiated
6. **What remains TBD** — open questions and missing information the analysis cannot currently resolve

## The six analysis levels — examine all six simultaneously

Apply these six lenses to the same problem:

1. **Signal level** — what is visible, loud, acute, measurable, or reported. The triggering event. The signal tells you something is worth investigating; it does not tell you what.

2. **Symptom level** — the friction, error, complaint, or anomaly the signal indicates. One layer deeper. Symptoms are real but not causes — a description of malfunction, not an explanation of why.

3. **Cause level (structural)** — the structural conditions that could generate the observed symptom. Causes require evidence. Hold candidate causes as hypotheses rather than conclusions until evidence confirms or eliminates them.

4. **Distortion level** — the interests, incentives, power structures, and biases that warp the framing of the problem. This level is not optional.

Answer all four mandatory distortion-level questions:
- Who defines the problem here — and does this person hold interpretive power (hierarchy, budget control, rhetorical dominance)?
- Whose voice is absent from the requirement (affected users, operations teams, QA, adjacent teams)?
- Does the chosen framing serve one party more than others? Name the asymmetry.
- Is the urgency structurally justified, or is it socially produced (urgency theater)?

5. **Precision level** — the sharpest, most actionable restatement of the problem after examining all the above. Specific enough to be falsified, bounded enough to be acted on, neutral enough not to pre-select a solution.

6. **Intervention level** — the category of measure that addresses the core problem rather than its surface. Do not select an implementation here — identify the type of intervention warranted: architectural change, configuration correction, process redesign, documentation, data collection, stakeholder alignment, or deferral.

## Codebase context

If source code is available: identify affected modules, dependencies and coupling, existing domain patterns and similar prior logic, validation and error handling locations, and likely regression zones.

If codebase access is unavailable: state this explicitly and mark every causal claim as Likely or Possible, never Confirmed. Do not make confirmed-sounding cause claims without code evidence.

## Output format

Produce these sections:

**Request classification:** [classification(s) and brief explanation]

**1.1 Sharpened summary** — precise restatement of the actual problem

**1.2 Explicit requirements** — literally stated demands

**1.3 Implicit assumptions** — unstated preconditions and assumed context, with evidence labels

**1.4 Ambiguities / contradictions / TBDs** — every vague, overloaded, undefined, or contradictory element

**1.5 Signal / symptom / possible cause** — three-layer separation. Never collapse symptom and cause.

**1.6 Codebase context** — technical context if available; explicit uncertainty reduction if not

**1.7 Evidence state** — labeled inventory of what is known at what confidence level

**1.8 Distortion level — interpretive power and framing bias** — standalone section, never merged into 1.5. Answer all four distortion questions.

---

## Input

<PASTE YOUR INPUT HERE>
```

---

### Prioritize — phase 2 only

Use this when you have completed Analyze output and want to run Prioritize in isolation — for example, when comparing multiple analyzed items against each other, or when you need a formal priority assignment before a planning session.

```
You are running the Prioritize phase of an APRICORE analysis. You already have the output of the Analyze phase. Your task is to determine what actually matters now — and why, not because it is loudest.

## What Prioritize is not

Prioritize is not driven by:
- Wording — how the ticket is written or how confident the author sounds
- Volume — how many people mentioned the issue
- Pressure — deadlines imposed without structural justification, escalations from stakeholders who feel strongly, or discomfort with saying "not yet"
- Hierarchy alone — a senior stakeholder's preference is an input, not a verdict

These three forces — loudness, institutional power, and time pressure — must be made visible and weighed, not obeyed.

## Every priority assignment must be justified by at least two criteria

1. **Cause-proximity** — does the proposed measure address the problem core established in Analyze, or only a surface symptom?
2. **Timeliness** — why now and not later? What changes if this is deferred by one sprint, one quarter, or indefinitely?

A priority assignment that cannot answer both questions is not ready.

## Evaluation axes — assess where relevant

Apply judgment. Document which axes were considered and which were set aside and why.

- User impact: end-user experience, task completion, trust — how broadly and severely?
- Business impact: revenue, conversion, contractual obligations, reputation, competitive position
- Operational impact: support load, incident probability, response cost
- Technical risk: coupling, fragility, scalability ceiling, debt that amplifies other risks
- Security risk: auth/authz gaps, data exposure, injection surfaces, abuse vectors
- Legal / compliance risk: regulatory requirements, data protection, contractual exposure
- Maintainability impact: does acting or not acting make the codebase harder or easier to reason about?
- Regression probability: how likely is the change to break existing behavior, and how wide is the affected surface?
- Cost of inaction: what accumulates technically, organizationally, or user-facing if this is not addressed?
- Cost of the wrong framing: if the problem is misunderstood, what is the waste or harm?
- Blast radius: how many users, systems, or teams are affected if this goes wrong?
- Reversibility: can the decision be unwound cheaply, or does it lock in a path?

No formula aggregates these into a score. Weigh them in context and record the reasoning.

## Recommendation levels

Assign one level. Each level has a specific definition — do not treat them as a spectrum of enthusiasm.

- **P0** — Immediate action justified. Risk of inaction, blast radius, or cause-proximity is high enough that deferral is not a legitimate option.
- **P1** — High priority. Address in the next clarification and planning cycle. Significant but not so acute that normal workflow cannot absorb it.
- **P2** — Relevant but not critical. Worth tracking and addressing when capacity allows. Does not block current work.
- **P3** — Low priority / opportunistic. Address if it falls naturally into scope — do not invest planning effort to sequence it.
- **HOLD** — Not decision-ready. The finding is too unclear, the evidence is too weak, or the cause-proximity is insufficient to justify any recommendation. Return to Analyze if needed, or escalate the open question explicitly.

HOLD is a legitimate outcome. Assigning P0 to avoid the discomfort of uncertainty is a failure mode. A forced priority on a poorly understood problem is more expensive than a declared HOLD.

## Output format

**2.1 Priority** — the assigned level with a one-line statement of what it means in this context

**2.2 Justification** — explicit reasoning addressing cause-proximity and timeliness. Name any loudness, institutional pressure, or urgency theater that was present but excluded from the justification.

**2.3 Risk of inaction** — what concretely accumulates or worsens if this item is not addressed

**2.4 Risk of wrong handling** — what can go wrong if the item is handled incorrectly or prematurely

**2.5 Cause-proximate vs. symptom-proximate** — explicit statement of whether the recommended action addresses the problem at cause level or symptom level. If symptom-proximate, state why that is nonetheless the correct choice.

---

## Analyze output (sections 1.1–1.8)

<PASTE YOUR ANALYZE OUTPUT HERE>

## Original input

<PASTE YOUR ORIGINAL INPUT HERE>
```

---

### Communicate — phase 3 only

Use this when you have completed Analyze and Prioritize and want to run Communicate in isolation — the stress-test and mirror step. This phase produces the Clarity Brief.

```
You are running the Communicate phase of an APRICORE analysis.

Communicate is not status reporting. It is an examination and mirror space: a structured challenge of the conclusions from Analyze and Prioritize before any action is recommended. The failure mode for this phase is false consensus — producing apparent agreement that has never been tested against a counter-thesis.

A Communicate step that contains no contradiction, no objection, and no analysis probe has not been completed; it has been skipped and labeled.

## Step 1 — Analysis probe (mandatory, run this first)

Before writing anything else in this phase, explicitly contest the core claims from the Analyze and Prioritize outputs.

Answer all three probe questions:

1. **Which assumption from section 1.3 (implicit assumptions) is hardest to defend?**
   Identify the assumption the analysis has relied on most heavily but has the least evidence for. If this assumption is wrong, what changes in the analysis? The hardest-to-defend assumption is usually the one that has been treated as background fact rather than identified explicitly.

2. **Which perspective would directly question the priority assigned in section 2.1?**
   Name the stakeholder role, team, or affected party whose informed view would lead them to assign a different priority — or no priority at all. Do not pick a perspective that politely disagrees; pick the one that would most sharply contest the reasoning.

3. **Where would an informed skeptic say "that is not right"?**
   An informed skeptic is someone with relevant domain knowledge who finds a specific claim, classification, or conclusion incorrect — not vague or incomplete, but actually wrong. Identify the most vulnerable specific point.

**If the probe yields new insight:** activate the feedback loop. Identify which section (1.x or 2.x) is affected. State the revision. Mark the affected section with [REV] — for example: "Section 1.3 [REV]: the assumption that X was revised because..." Then continue with Step 2.

Do not paper over a probe finding with a caveat in Step 2. The probe exists to prevent exactly that.

## Step 2 — Mirror perspectives

For each stakeholder role with a material stake in this problem, provide:
- **Concern** — what this role is primarily trying to protect or achieve
- **Likely objection** — the specific objection this role would raise against the current framing or priority
- **Blind spot** — what this role tends to underweight or not see from its position. Name blind spots without softening them; they are predictable consequences of specialization and organizational position, not character flaws.
- **Required decision input** — what information or decision this role needs to provide before the analysis can be resolved

Roles to consider (include only those genuinely relevant):
Management / Leadership · Product / PM · UI/UX · Frontend · Backend · QA · Security · SEO · DevOps / Ops · Legal / Compliance · Support / Customer perspective

A perspective mirror that lists concerns without naming objections or blind spots is incomplete.

## Step 3 — Name communication risks

After mirroring perspectives, identify the communication risks the Clarity Brief must manage. Evaluate all six categories:

1. **False certainty** — the analysis presents a conclusion with more confidence than the evidence supports. A probable cause stated as a confirmed cause. An assumption stated as a fact.
2. **Underestimated risk** — a risk that has been identified but whose severity or probability has been minimized.
3. **Over-dramatization** — a risk or problem amplified beyond what the evidence supports. A possible cause presented as certain. A low-probability risk treated as imminent.
4. **Unresolved terminology** — key terms that mean different things to different stakeholders, not yet surfaced or resolved.
5. **Hidden trade-offs** — the analysis has implicitly chosen one value or constraint over another without making that choice visible.
6. **Unclear ownership** — the analysis reaches a conclusion requiring action, but who must act is not specified.

## Step 4 — Feedback check

Has Communicate exposed blind spots in Analyze or Prioritize?
- Yes → mark the affected sections [REV], write the revision, then verify the revision does not open new probe findings
- No → proceed to the Clarity Brief

A zero-revision analysis is a warning signal.

## The Clarity Brief *(optional)*

The Clarity Brief is an optional one-page distillation of the Communicate section output (sections 3.2–3.5), produced when a shareable stakeholder summary is useful. It is not part of the numbered schema and is not required for every analysis. If you produce it, do so only after the probe, perspective mirroring, risk naming, and feedback check are complete. A Clarity Brief written before Step 1 is not a Clarity Brief; it is a summary of unexamined assumptions.

The Clarity Brief contains exactly four elements:

1. **Neutral problem reframing** — a version of the problem statement that no single party owns. Not the ticket author's framing, not the loudest stakeholder's framing. A statement the analysis has arrived at through the examination process, expressed without advocacy.

2. **Priority basis** — what the assigned priority rests on, expressed as two explicit criteria (cause-proximity and timeliness), with the three informal prioritization forces (volume, institutional power, time pressure) explicitly excluded or accounted for.

3. **Load-bearing perspectives** — which stakeholder roles have a direct stake in the decision, and what each role's required decision input is. Distilled to only the perspectives that, if absent, would prevent a sound decision.

4. **Named communication risks** — the subset of Step 3 findings that must be visible to decision-makers. Only findings that materially affect how the Clarity Brief should be read or acted on.

## Output format

**3.1 Analysis probe** — probe findings and any [REV] markings triggered

**3.2 Relevant perspectives** — concern, objection, blind spot, required decision input for each relevant role

**3.3 Possible objections** — the strongest arguments against the current analysis, priority, or recommended action

**3.4 Communication risks** — failure modes in how this analysis could be misread or misused

**3.5 Neutral reframing** — the problem statement stripped of advocacy and urgency theater

**3.6 Feedback check** — explicit gate: were blind spots revealed? If yes, name the revised sections.

**Clarity Brief** *(optional)* — produce this one-page distillation of sections 3.2–3.5 when a shareable stakeholder summary is useful. It is not part of the numbered schema. When produced, it contains exactly four elements: neutral reframing · priority basis · load-bearing perspectives · named communication risks

---

## Analyze and Prioritize output (sections 1.1–2.5)

<PASTE YOUR ANALYZE AND PRIORITIZE OUTPUT HERE>

## Original input

<PASTE YOUR ORIGINAL INPUT HERE>
```

---

### Realize — phase 4 only

Use this when you have completed Analyze, Prioritize, and Communicate, and want to reach a defensible conclusion and recommended action.

```
You are running the Realize phase of an APRICORE analysis.

Realize answers one guiding question: What is robustly clear — and what action follows logically from it?

The primary purpose of Realize is epistemological: it is the step where the analysis earns the right to drive an execution decision. The conclusion produced here must be robust enough that it does not require the practitioner to be present to defend it. If the conclusion collapses when examined by anyone other than the person who wrote it, the analysis is not done.

The failure mode for this phase is the same one APRICORE is designed to prevent throughout: skipping to action before the insight is robust. A Realize that starts with "so the fix is..." rather than "what is actually clear here?" has not completed the phase; it has performed the conclusion while bypassing it.

## Certainty discipline — this governs the language of section 4.1

Realize may not assert a verified finding that the analysis has not actually verified. Use these three labels:

- **Likely** — the reasoning is strong and the evidence points clearly in one direction, but reproduction or measurement has not been performed
- **Possible** — the evidence is suggestive but not strongly directional; multiple causes could explain the observed signal
- **Confirmed** — a verified finding established by reproduction, observation, or measurement. Realize may carry a Confirmed label forward from upstream evidence (a reproduction already in the ticket, a metric already collected), but may not generate new Confirmed claims without the corresponding verification

Code reading and structural reasoning produce hypotheses, not confirmed findings. Never assert Confirmed without the corresponding evidence.

## The eight allowed outcomes for section 4.3

Route to exactly one:

1. **Implementation is sensible** — the problem is sufficiently understood, the priority is defensibly assigned, the relevant perspectives have been examined, and the risks are named and manageable
2. **Further analysis needed first** — a specific gap in understanding exists; identify it
3. **Data collection / measurement needed first** — a hypothesis has been formed but requires empirical verification; specify what data is needed
4. **A domain decision needed first** — the correct response requires a decision that belongs to a domain authority; name who must decide
5. **A security or legal review needed first** — the work touches a surface where risk exceeds the practitioner's scope to assess unilaterally
6. **Ticket back to the requesting side** — the request contains a contradiction only the requester can resolve, or an assumption the analysis has shown to be false; state the specific finding
7. **Split into smaller problem spaces** — what arrived as a single request is actually two or more distinct problems with different causes, priorities, or responsible parties; name the sub-problems
8. **Do not pursue for now** — the cost of action exceeds the cost of inaction, or the problem resolves itself under conditions already in motion; argue the case

## The feedback loop at Realize

If Realize produces an insight that contradicts a conclusion from Analyze or Prioritize, activate the feedback loop: mark the contradicted section [REV], write the revision, and then verify the revision does not require further changes before settling Realize.

Maximum two feedback cycles. If two full cycles do not produce a stable Realize, escalate rather than cycling a third time.

Realize is complete only when it stands without generating new [REV] markings.

## Output format

**4.1 What is robustly clear**
The subset of the analysis that can be stated with confidence after sections 1–3. Use certainty labels (Confirmed / Likely / Possible). Never assert Confirmed without the corresponding verification.

**4.2 What remains open**
Unresolved ambiguities from 1.4, unconfirmed causal hypotheses from 1.5, unanswered probe questions from 3.1, unresolved objections from 3.2. List explicitly. An analysis with no open questions has either confronted a genuinely simple problem or stopped asking too early.

**4.3 Decision readiness**
Route to exactly one of the eight allowed outcomes above. State which outcome applies and why.

**4.4 Recommended next step**
One concrete action, addressed to one responsible party. Not a list of options. If decision readiness is insufficient, the recommended next step is the clarification action, not implementation.

**4.5 Corrected ticket version**
A reframed version of the original requirement that incorporates all findings from sections 1–4: correct problem framing, explicit acceptance criteria, removed solution-bias, clearly scoped boundaries. This is what the ticket should say to be correctly implemented.

---

## Full analysis output (sections 1.1–3.6 and Clarity Brief)

<PASTE YOUR ANALYZE, PRIORITIZE, AND COMMUNICATE OUTPUT HERE>

## Original input

<PASTE YOUR ORIGINAL INPUT HERE>
```

---

## Distortion-lens prompt

Use this when you want a focused analysis of who is framing the problem and whether the stated urgency is structurally justified — without running the full APRICORE pipeline. This lens is drawn directly from the Distortion level of the Analyze phase.

```
You are running a distortion-lens analysis on a work item.

The distortion lens examines the interests, incentives, power structures, and biases that warp problem framing — shaping which symptoms are visible, which causes are named, and whose definition of the problem dominates. The distortion level does not assess whether the problem is real; it assesses whether the way the problem has been framed is neutral and complete, or whether it serves some parties more than others. Distortion is not always intentional — it can emerge from structural position, cognitive load, institutional inertia, or the path of least resistance in a given organization.

## Four mandatory distortion questions — answer all four

### 1. Who defines the problem here — and does this person or group hold interpretive power?

Interpretive power is the authority — through hierarchy, budget control, or rhetorical dominance — to determine which version of the problem becomes the accepted one. The person who opens the ticket, the manager who escalates, and the stakeholder who frames the briefing all exercise interpretive power. Their framing is not neutral.

Identify:
- Who authored or framed the input
- What position or authority this person holds relative to others involved
- Whether their framing reflects the problem as it affects the system, or the problem as it affects their particular interests or visibility
- Whether an alternative framing would emerge from a different position of authority

### 2. Whose voice is missing from the requirement?

Absent voices produce partial problem statements. Consider:
- Affected users who experience the problem daily
- Operations and infrastructure teams who maintain the environment
- QA engineers who observe edge cases in practice
- Adjacent product teams whose work is coupled to this area
- Any party who bears the consequences of a decision but was not consulted in framing it

For each absent voice: what would their version of this problem look like? What would they add, remove, or reframe?

### 3. Does the chosen framing serve one party more than others?

A framing that emphasizes speed of delivery over correctness serves engineering throughput at the expense of quality. A framing that names only a specific technical solution serves whoever prefers that solution. A framing that names only customer-facing symptoms obscures internal process failures. A framing that emphasizes a business metric obscures the user experience behind it.

Identify:
- What the current framing emphasizes and what it de-emphasizes
- Which party benefits most from the problem being understood this way
- What would be visible or actionable if the framing were shifted to another party's perspective
- Whether the framing forecloses options or assigns responsibility in ways that serve a particular interest

### 4. Is the urgency structurally grounded or socially produced?

Urgency theater is the production of pressure through social mechanisms — escalation, repetition, managerial emphasis, deadline rhetoric — without structural justification for why this problem requires action now rather than at normal priority.

Distinguish:
- **Genuine structural urgency:** regulatory deadline, active data loss, revenue-blocking outage, security breach in progress, contractual obligation with a fixed date
- **Social urgency:** a stakeholder who feels strongly, a manager who escalated, a deadline set by preference rather than external constraint, repetition of the same request, anxiety about visibility or credit

For the input under analysis:
- What is the stated or implied urgency?
- What structural evidence exists for this urgency? (Name specific facts, not assertions.)
- What would the priority level be if the social pressure were removed and only structural factors remained?

## Output format

Produce these four sections in order:

**D1 — Interpretive power**
Who defines this problem, what authority they hold, and whether their framing is neutral or self-serving.

**D2 — Missing voices**
Who is absent from the requirement, what their version of the problem might look like, and what their absence does to the problem statement.

**D3 — Framing asymmetry**
What the current framing emphasizes and de-emphasizes, who benefits, and what would shift if the framing were recentered on a different party.

**D4 — Urgency assessment**
What urgency is claimed or implied, what structural evidence exists for it, and whether the urgency is structurally grounded or socially produced.

**Distortion summary**
2 to 4 bullet points stating the most significant distortions found and what they imply for how the problem should be understood before any action is taken.

---

## Input

<PASTE YOUR INPUT HERE>
```
