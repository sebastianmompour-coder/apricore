# Example 2 — Stakeholder Statement

This example shows a verbally relayed stakeholder statement being processed through a
full APRICORE analysis. The input type is different from Example 1: not a written ticket
but a spoken, second-hand report of a senior stakeholder's position. This shows that
APRICORE is general-purpose — the engine operates on any framed input, not only
structured tickets. The analysis surfaces power and urgency distortion, missing voices,
and routes to a clarification-first outcome.

---

## Raw input

> *Relayed by a team lead at the start of a sprint planning session:*
>
> "The director said the new export format needs to be live by Friday — it's critical.
> The data team has been asking for this for months. We just need to get it done."

---

## APRICORE Analysis

### 1. Analysis

#### 1.1 Sharpened summary

A director has verbally communicated urgency around a "new export format" feature
requested by the data team. The statement arrived second-hand (relayed by a team lead)
and contains no specification of the export format, no definition of "live," no
articulation of what makes it critical, and no explanation of why Friday is the deadline.
The actual problem is: **what does the data team need from an export feature, why does
it need to exist, and is Friday a structurally justified deadline or a socially produced
pressure point?**

#### 1.2 Explicit requirements

- Deliver a "new export format" by Friday.
- The feature is characterized as critical by a director.

#### 1.3 Implicit assumptions

- The "new export format" is sufficiently specified somewhere (in a prior document,
  previous meeting, or backlog item) for implementation to begin without further
  clarification.
- "Live by Friday" means fully deployed to production, tested, and available to users
  (as opposed to: merged to main, deployed to staging, or demo-ready).
- Friday is a hard external deadline (regulatory, contractual, or otherwise
  structurally fixed) rather than an internally set target date.
- The data team's need for the export is understood and agreed upon by whoever owns
  the feature specification.
- The current team has the capacity within the existing sprint to deliver this change
  without displacing other committed work.
- "Critical" reflects a business or operational impact, not merely the director's
  personal preference or level of awareness.

#### 1.4 Ambiguities / contradictions / TBDs

- **"New export format"** — not specified. Format type (CSV, JSON, XLSX, Parquet?),
  schema, encoding, column selection, filtering options — all absent.
- **"Live by Friday"** — "live" is undefined: deployed to production? available to
  all data team users? passed QA? The deadline is four words; the specification is zero
  words.
- **"Critical"** — undefined severity. Critical to what? Revenue, a regulatory filing,
  a data team internal deadline, a downstream system dependency, a contractual
  obligation?
- **Why Friday specifically** — not explained. Is this tied to a scheduled reporting
  run, a partner deadline, a regulatory submission window, or was Friday named because
  it felt appropriate in the moment?
- **"The data team has been asking for this for months"** — this claim is relayed through
  the team lead, not sourced from the data team directly. The specific format and use
  case they have been requesting may differ from whatever the director has in mind.
- **Which system or service** is responsible for producing the export is not stated.

#### 1.5 Signal / symptom / possible cause

**Signal:** A director verbally communicates urgency ("critical," "by Friday") about a
feature request, relayed second-hand into a sprint planning session.

**Symptom:** A team is being asked to commit to an unspecified feature under a fixed
deadline without a written specification, without a direct account of the underlying
need, and without a stated structural reason for the deadline.

**Possible causes of the urgency:**

- A downstream system or reporting process depends on the export and has a real fixed
  deadline (e.g., a regulatory submission, a scheduled partner data transfer) (Possible —
  would constitute structural urgency; not established by the statement)
- The director became aware of the long-standing data team request and named a deadline
  to accelerate delivery (Possible — a common pattern where awareness at a senior level
  produces deadline rhetoric without structural backing)
- The data team has a scheduled internal reporting run on Monday that requires the
  export to be available by end of week (Possible — would constitute structural urgency
  at team level; not stated)
- The director's "Friday" is a social deadline: a preference expressed with authority
  rather than a constraint imposed by external circumstances (Possible — consistent with
  the absence of any stated external driver)

None of these can be confirmed from the statement alone.

#### 1.6 Codebase context

No codebase access is available for this analysis. The export format and the affected
system are unspecified, so no technical context can be established. Certainty is reduced
accordingly: no implementation readiness assessment is possible without a specification.

#### 1.7 Evidence state

| Claim | Label |
|---|---|
| A director has communicated urgency about a new export format | Anecdotal (second-hand report; no direct statement or written artifact) |
| The data team has been requesting this feature for months | Anecdotal (relayed by team lead; specific format/use case not verified) |
| The feature is critical | Unsubstantiated (no structural definition of criticality provided) |
| Friday is a hard deadline | Unsubstantiated (no external constraint cited to explain it) |
| The feature is specified well enough to implement | Unsubstantiated (no specification, document, or prior ticket referenced) |
| A structural dependency drives the Friday date | Possible (not ruled out, but no evidence provided) |

#### 1.8 Distortion level — interpretive power & framing bias

1. **Who defines the problem here — and do they hold interpretive power?**
   The director holds significant interpretive power through organizational hierarchy.
   Their verbal statement — relayed through a team lead — has bypassed normal
   requirements channels and arrived directly as an execution directive. Because the
   director's authority is real, the team faces social pressure to accept the framing
   without interrogation. The problem definition (what the export must do, why, by when)
   has not been provided; only the urgency and the deadline have been communicated. This
   is a textbook case of interpretive power substituting for specification.

2. **Whose voice is absent?**
   The data team — the stated requester — is entirely absent from this account. Their
   specific needs (which data to export, in what format, for what downstream use) are
   not represented. The team lead is relaying an interpretation of what the director said,
   which is itself an interpretation of what the data team asked for, filtered through
   management escalation. Two layers of mediation separate the actual user need from the
   planning conversation. Additionally: QA (who would need to validate the export's
   correctness), any downstream system owners who depend on the export, and the product
   owner who should be owning the specification are all absent.

3. **Does the framing serve one party more than others?**
   The framing ("it's critical, just get it done") serves the director's interest in
   visible delivery. It does not serve the data team's interest in getting an export
   that actually meets their needs (which requires a specification conversation). It
   does not serve engineering's interest in knowing what to build. The "months of
   asking" framing creates implicit blame on the delivery team without acknowledging
   that the specification may never have been written or agreed upon.

4. **Is the urgency structurally justified or socially produced?**
   As stated, the urgency is socially produced. The word "critical" and the Friday
   deadline are asserted through senior authority, not grounded in a named external
   constraint. The statement contains zero structural justification: no regulatory
   reference, no contractual deadline, no downstream system dependency, no named
   consequence of missing Friday. Urgency theater is strongly indicated. This does
   not mean no urgency is real — it means the real driver (if one exists) has not
   been surfaced and must be established before the deadline is accepted as binding.

---

### 2. Prioritization

#### 2.1 Priority

**HOLD** — the statement is not decision-ready.

The feature cannot be responsibly prioritized because it lacks: a specification, a
confirmed structural reason for the deadline, and a direct account of the data team's
actual need. Prioritizing under these conditions would require accepting the director's
authority as a substitute for a problem framing — which APRICORE prohibits.

#### 2.2 Justification

**Cause-proximity:** No cause has been established. There is no problem statement that
identifies what gap the export format fills, why the existing export options are
insufficient, or what the downstream use case is. An implementation committed under
these conditions has no way to be cause-proximate — it would be implementing a feature
whose acceptance criteria are unknown, for a use case that has not been verified.

**Timeliness:** Friday is four days away (or less, depending on when this planning
conversation occurs). The timeliness case for prioritizing now would require a structural
reason to believe that missing Friday has concrete and proportionate consequences. No
such reason is present in the statement. A deadline imposed through seniority without
structural backing is not a valid timeliness argument.

Loudness and institutional pressure are explicitly excluded from prioritization
justification under APRICORE. The director's seniority is noted in section 1.8; it does
not carry forward into this priority assignment.

#### 2.3 Risk of inaction

If this statement is not followed up and the underlying need is real (e.g., a genuine
external dependency drives the Friday date), the data team will miss a deadline that
matters to them. That is a real and non-trivial risk. The recommended next step (4.4)
directly addresses this risk: it routes to the data team within hours to establish
whether a structural urgency exists. If it does, the priority is revised immediately.
Holding pending clarification is not the same as inaction.

#### 2.4 Risk of wrong handling

- Committing to "live by Friday" without a specification: high probability of building
  the wrong thing, requiring a rework cycle that extends beyond Friday anyway.
- Treating "the director said so" as a specification: the data team's actual need may
  differ from whatever the director understood or communicated. Delivering a feature
  that satisfies the director's mental model but not the data team's use case is a
  failed delivery regardless of the speed of execution.
- Missing the real structural driver: if a regulatory or contractual deadline actually
  exists and the analysis dismisses it as urgency theater, a real consequence follows.
  The clarification step in 4.4 is designed to surface this within hours.
- Committing in sprint planning under authority pressure: once the commitment is made,
  displacing other work creates a second set of risks that ripple beyond this feature.

#### 2.5 Cause-proximate vs. symptom-proximate

The HOLD outcome is cause-proximate: it withholds commitment until the actual problem
(what the data team needs the export to do) is established. Any implementation begun
before the specification is written would be symptom-proximate at best — delivering
something in response to visible pressure without addressing the underlying need.

---

### 3. Communication — examination and mirror space

#### 3.1 Analysis probe

1. **Hardest assumption to defend (from 1.3):** The assumption that the export format
   is specified somewhere and implementation can begin without further clarification.
   This is the assumption that makes "just get it done" sound like a plausible
   instruction. In practice, if a written specification existed, it would have been
   referenced. The absence of any reference to a document, prior ticket, or agreed
   schema is itself evidence that the specification does not exist. This assumption, if
   accepted unchallenged, leads directly to implementation of an unspecified feature
   under a director-imposed deadline — the highest-risk pattern the distortion level
   surfaced.

2. **Perspective that would most directly question the HOLD priority:** The director,
   if informed of the HOLD, would argue that the urgency is real and that a
   clarification step introduces delay on a critical item. This is the strongest
   counter-pressure. The correct response is to acknowledge the authority and redirect
   it: the clarification step requires a conversation with the data team that can happen
   in hours, not a week of analysis. The HOLD is conditional and time-bounded, not
   indefinite.

3. **Where an informed skeptic would say "that's not right":** The evidence label for
   "the data team has been asking for months" is Anecdotal. A skeptic might argue that
   this longevity of request is itself evidence of real need, and that the analysis
   underweights it. The response: duration of request is evidence of desire, not
   evidence of a correctly framed specification. The data team wanting a feature for
   months does not establish what the feature should do. Both facts can be true: the
   need is real, and the specification is missing.

No probe finding triggers a revision to sections 1 or 2 in this case. The HOLD
assignment holds.

#### 3.2 Relevant perspectives

**Management / Leadership (the director)**
- Concern: A senior-level request has been outstanding for months and they want visible
  delivery.
- Likely objection: "I already made the prioritization decision. This needs to go into
  this sprint."
- Blind spot: Is not close enough to the specification layer to know whether the feature
  can be built correctly in four days without a specification. Tends to underestimate
  the cost of a false delivery (feature shipped, data team cannot use it, rework follows).
- Required decision input: Acknowledgment that a same-day clarification conversation
  with the data team is a prerequisite for a responsible sprint commitment. Alternatively:
  a reference to an existing specification document.

**Data team (the actual requester)**
- Concern: They have been waiting months for an export format that unblocks something
  in their workflow.
- Likely objection: "We have already explained what we need multiple times — why do we
  need another conversation?"
- Blind spot: May assume that "months of asking" is equivalent to "specification
  received and understood" by the engineering team. The history of the request may not
  include a structured written spec.
- Required decision input: A written account (even a brief one) of: the required export
  format, the exact data fields needed, the downstream system or use case consuming the
  export, and what "working" looks like from their perspective.

**Product / PM**
- Concern: A director has escalated; the team lead is under pressure. Wants to find a
  path to commitment without conflict.
- Likely objection: "Can we scope something small enough to deliver by Friday and call
  it the first iteration?"
- Blind spot: An MVP export scoped in response to time pressure (rather than use case)
  may not meet the data team's actual need, resetting the escalation cycle.
- Required decision input: Confirmation of what "done" means for the data team — not
  what can be delivered in four days, but what would actually close the request.

**QA**
- Concern: Four days is not enough time for a meaningful QA pass on a new export format,
  especially without a specification.
- Likely objection: "If we ship this untested and the export produces incorrect data,
  the data team's downstream processes may produce wrong results. That is a worse
  outcome than a short delay."
- Blind spot: May not be included in the sprint planning conversation at all (which is
  itself a process failure).
- Required decision input: Whether QA is expected to validate the export before Friday,
  and if not, who accepts the risk of shipping without validation.

#### 3.3 Possible objections

- "The director said it is critical — we should just start and figure out the spec
  as we go." (Counter: concurrent specification and implementation on a deadline with no
  written requirements is the primary cause of a rework cycle that ends up taking longer
  than a one-day clarification would have. The pattern "figure it out as we go" has a
  known failure mode: the thing that gets built is the thing that was easiest to build,
  not the thing that was needed.)
- "The data team has been waiting months — another day of delay is disrespectful to
  their need." (Counter: another sprint of building the wrong thing is more disrespectful
  to their need than a same-day clarification conversation.)
- "We can always adjust the export format after delivery." (Counter: export formats
  consumed by downstream systems create dependencies. A schema change after the data
  team integrates the export may require them to update downstream processes. Getting
  the format right matters more than getting something deployed by Friday.)

#### 3.4 Communication risks

- **False certainty:** If the team accepts the statement at face value and commits to
  Friday, the team lead may communicate back to the director that delivery is confirmed.
  This creates false certainty in the director's view that the specification is
  understood and the commitment is reliable.
- **Urgency amplification:** Each layer of relay ("the director said...," "it's
  critical...," "the data team has been asking for months") amplifies the urgency signal
  independently of whether the underlying urgency is structural. Communicating back
  without interrogating the chain risks propagating amplified urgency into the sprint.
- **Unclear ownership:** No owner is named for the specification. The team lead is
  relaying a statement, not owning a requirement. Without a named specification owner,
  the clarification step will not happen.
- **Hidden trade-off:** Committing to Friday displaces other sprint work. That
  displacement is a real cost that has not been named in the sprint planning conversation.

#### 3.5 Neutral reframing

"The data team has an unmet need for an export format that has been escalating through
management channels for an extended period. A director has communicated urgency with a
Friday deadline. The specification of the required format, the structural reason for the
deadline, and the downstream use case are not yet documented. A same-day clarification
conversation with the data team is required to determine whether the Friday deadline is
structurally fixed and what the export must contain before a responsible sprint commitment
can be made."

#### 3.6 Feedback check

The analysis probe (3.1) did not surface any finding that requires revision to sections
1 or 2. The HOLD assignment stands. No `[REV]` markers are triggered by this probe.
Proceeding to Realize.

---

### 4. Realize

#### 4.1 What is robustly clear

- A director has communicated urgency about a new export format. The social pressure
  is real and will not go away without a response. (Confirmed — stated directly in the
  relayed input.)
- The feature has no written specification visible to the engineering team. (Likely —
  no document, ticket, or schema is referenced despite the claim that the request has
  existed for months.)
- The Friday deadline has no stated structural justification. (Confirmed — the statement
  provides none; urgency theater is strongly indicated.)
- The data team's actual need (specific format, schema, use case) is not documented in
  the statement. (Confirmed — the statement contains no technical content.)
- Implementing under these conditions produces a high probability of building the wrong
  thing. (Likely — structural reasoning; consistent with standard failure patterns for
  under-specified deadline-driven development.)

#### 4.2 What remains open

- Does a structural urgency actually exist for the Friday deadline? (Requires direct
  conversation with the data team or the director — unresolved.)
- What specifically does the data team need the export to contain? (Requires a
  specification conversation — unresolved.)
- Is there an existing specification document or prior ticket that was not referenced
  in the planning conversation? (Requires checking — unresolved.)
- What downstream system or process will consume the export? (Not stated — unresolved.)
- What does "live" mean — deployed to production, validated, available to all data team
  members? (Undefined — unresolved.)

#### 4.3 Decision readiness

**Clarification must come first.** The analysis is not sufficient to drive an
implementation decision. A same-day conversation with the data team and, if needed,
with the director's office is required to establish: (1) the structural reason for
Friday if one exists, and (2) the minimum specification required to build something
correct. Only after that conversation can a responsible sprint commitment be made.

#### 4.4 Recommended next step

The team lead should set up a call with the data team within two hours of the sprint
planning session. The call has two objectives: (a) establish whether the Friday deadline
is tied to a specific external event (reporting run, submission, partner dependency) or
is a soft target imposed through authority; (b) capture the minimum required export
specification in writing (format, fields, downstream use). The outcome of this call
determines whether the HOLD is lifted and the feature enters the sprint, or whether a
revised delivery timeline is negotiated with the director based on actual specification
time.

#### 4.5 Corrected ticket version

> **Feature: Data team export format — [format to be specified]**
>
> **Problem:** The data team cannot export [data entity] in the format required by
> their [downstream process / system]. They have been using a workaround that creates
> [described friction]. The missing export format blocks [specific use case].
>
> **Required export specification (to be completed before implementation begins):**
> - Format: [CSV / JSON / XLSX / other — confirmed with data team]
> - Columns / fields: [list — confirmed with data team]
> - Filtering / scoping options: [e.g., date range, entity type — confirmed with data team]
> - Encoding and character handling: [if relevant]
> - Expected file size / volume constraints: [if relevant]
>
> **Deadline:**
> - [State whether Friday is a hard external deadline and why, or a preferred delivery
>   date that can be negotiated]
>
> **Acceptance criteria:**
> - The data team can generate the export from [specified interface/API].
> - The exported data matches [specified correctness criteria].
> - The export has been validated by QA against a representative dataset.
> - [If Friday is hard:] Deployed to production and verified accessible to data team
>   members by [specific time] on Friday.
>
> **Out of scope until explicitly included:**
> - Scheduling or automation of the export
> - Access controls beyond the existing permission model
> - Any format variant not named above

---

### 5. Brief conclusion

- The statement is a power/urgency distortion event: a director's verbal instruction
  relayed second-hand has substituted for a specification. None of the technical
  content required to implement the feature is present in the input.
- The Friday deadline is unsubstantiated: no structural driver (regulatory,
  contractual, downstream system dependency) is cited. Urgency theater is the primary
  diagnosis until a structural reason is confirmed.
- The data team — the actual requester — is entirely absent from the input. Two layers
  of mediation (data team → director → team lead → planning session) separate the actual
  need from the engineering team.
- The HOLD outcome is not a refusal to act: it is a conditional hold pending a
  same-day clarification conversation. The clarification step takes hours, not days,
  and directly determines whether Friday is feasible at all.
- Committing to Friday without a specification produces the highest-risk outcome:
  implementation of an unspecified feature under a deadline, with QA excluded from the
  timeline and no agreed definition of "done."
- The corrected ticket template in 4.5 structures the minimum information required to
  lift the HOLD and begin responsible implementation.
