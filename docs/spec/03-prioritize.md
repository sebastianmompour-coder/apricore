# P — Prioritize

> **Guiding question:** What actually matters now — and why, not because it is loudest?

Prioritize is the second phase of APRICORE. Its purpose is to determine what actually matters now, given what Analyze has established. It does not reopen the analysis; it ranks the findings and assigns a recommendation level that is explicit, justified, and negotiable.

---

## What Prioritize Is Not

Prioritize is **not** driven by:

- **Wording** — how the ticket is written, how confident the author sounds, or whether the request is grammatically urgent
- **Volume** — how many people mentioned the issue, or how many messages were sent about it
- **Pressure** — deadlines imposed without structural justification (urgency theater), escalations from stakeholders who feel strongly, or the discomfort of saying "not yet"
- **Hierarchy alone** — a senior stakeholder's preference is an input, not a verdict; interpretive power is noted in the distortion level of Analyze, not imported unchecked into Prioritize

These are the three dominant forces in informal prioritization — loudness, institutional power, and time pressure. APRICORE makes them visible so they can be weighed rather than obeyed.

---

## The Structural Nature of Prioritization

Prioritization is an explicit ranking operation. It always contains valuations and implicit organizational decisions. APRICORE makes this step visible and negotiable — it does not resolve priority conflicts automatically.

Every priority assignment must be justified by at least two criteria:

1. **Cause-proximity** — does the proposed measure address the problem core established in Analyze, or only a surface symptom?
2. **Timeliness** — why now and not later? What changes if this is deferred by one sprint, one quarter, or indefinitely?

A priority assignment that cannot answer both questions is not ready.

---

## Evaluation Axes

Assess where relevant. Not every axis applies to every finding; apply judgment. Document which axes were considered and which were set aside and why.

| Axis | What to assess |
|---|---|
| **User impact** | Does this affect end-user experience, task completion, or trust? How broadly and how severely? |
| **Business impact** | Revenue, conversion, contractual obligations, reputation, or competitive position? |
| **Operational impact** | Load on support, ops, or maintenance teams? Incident probability or response cost? |
| **Technical risk** | Coupling, fragility, scalability ceiling, known debt that amplifies other risks? |
| **Security risk** | Auth/authz gaps, data exposure, injection surfaces, abuse vectors, insecure defaults? |
| **SEO risk** | Crawlability, indexability, rendering behavior, structured data integrity, duplicate content? |
| **Legal / compliance risk** | Regulatory requirements, data protection obligations, contractual exposure? |
| **Maintainability impact** | Does acting (or not acting) make the codebase harder or easier to reason about and change? |
| **Regression probability** | How likely is the change to break existing behavior? How wide is the affected surface? |
| **Cost of inaction** | What accumulates — technically, organizationally, or user-facing — if this is not addressed? |
| **Cost of the wrong framing** | If the problem is misunderstood and addressed as stated, what is the waste or harm? |
| **Blast radius** | How many users, systems, or teams are affected if this goes wrong? |
| **Reversibility** | Can the decision or implementation be unwound cheaply, or does it lock in a path? |

No formula aggregates these axes into a score. The practitioner weighs them in context and records the reasoning. The output of this step is a recommendation level and a written justification — not a number.

---

## Recommendation Levels

Assign one level per finding or per problem cluster. Each level has a specific definition; do not treat them as a spectrum of enthusiasm.

| Level | Definition |
|---|---|
| **P0** | Immediate action justified. The risk of inaction, blast radius, or cause-proximity is high enough that deferral is not a legitimate option. Proceed to Communicate and Realize without queuing. |
| **P1** | High priority. Address in the next clarification and planning cycle. The finding is significant but not so acute that normal workflow cannot absorb it. |
| **P2** | Relevant but not critical. Worth tracking and addressing when capacity allows. Does not block current work. |
| **P3** | Low priority / opportunistic. Address if it falls naturally into scope — do not invest planning effort to sequence it. |
| **HOLD** | Not decision-ready. The finding is too unclear, the evidence is too weak, or the cause-proximity is insufficient to justify any recommendation. Do not assign a direction until the ambiguity is resolved. Return to Analyze if needed, or escalate the open question explicitly. |

**HOLD is a legitimate outcome.** Assigning P0 to avoid the discomfort of uncertainty is a failure mode. A forced priority on a poorly understood problem is more expensive than a declared HOLD.

---

## Minimum Standard

A valid priority assignment in the output must satisfy both conditions:

- It names the cause-proximity: the measure addresses the problem core (not just a visible symptom)
- It answers timeliness: there is a stated reason why this is the right moment, or an explicit acknowledgment that timing is flexible

If neither can be satisfied, assign HOLD and document the missing information.

---

## Scope of This Phase

Prioritize covers the ranking discipline and the logic of assignment. It does not define the output structure — the canonical output sections for the Prioritize phase (sections 2.1–2.5 of the APRICORE output format) are specified in `spec/07-output-schema.md`. One responsibility per file.
