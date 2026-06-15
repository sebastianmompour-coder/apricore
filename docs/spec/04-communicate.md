# C — Communicate

Challenge, don't report. Communicate is the stress-test and mirror room; only under contradiction does it show whether Analyze and Prioritize hold.

Communicate is not status reporting. It is an examination and mirror space: a structured sequence of challenge, perspective-taking, and risk-naming that subjects the prior two phases to active pressure before any conclusions are carried forward. The failure mode for this phase is false consensus — sending a status report in place of a probe, producing apparent agreement that has never been tested against a counter-thesis or surfaced a hidden assumption. A Communicate step that contains no contradiction, no objection, and no analysis probe has not been completed; it has been skipped and labeled.

Communicate may additionally yield an optional distillation artifact: the **Clarity Brief**. The Clarity Brief is a one-page stakeholder summary derived from the Communicate section output — specifically the neutral reframing from Step 4 (section 3.5) and the load-bearing perspectives, objections, and communication risks from Steps 2–3 (sections 3.2–3.4). It is produced when a shareable stakeholder summary is useful; it is not a mandatory output of every analysis. Derived from the Toyota A3 structure, the Clarity Brief makes Communicate a method rather than an intention when a persistent summary is needed. Because the Clarity Brief is produced through active challenge — not passive synthesis — it can only be written after the analysis probe has run. A Clarity Brief written before Step 1 is not a Clarity Brief; it is a summary of unexamined assumptions. The Clarity Brief is introduced in `spec/01-framework.md` as a defined artifact of the Communicate phase; this phase is where it is produced, when applicable.

---

## Step 1 — Analysis probe (mandatory)

The analysis probe is the non-negotiable first action of Communicate. It is not a framing exercise or a warm-up — it is an active attempt to break the conclusions from Analyze and Prioritize before those conclusions are treated as stable enough to act on.

Explicitly contest the core claims from A and P before mirroring any perspectives. Three probe questions must be applied:

1. **Which assumption from section 1.3 (implicit assumptions) is hardest to defend?**
   Identify the assumption the analysis has relied on most heavily but has the least evidence for. If this assumption is wrong, what changes in the analysis? If the answer is "nothing changes," the assumption was not load-bearing and another one should be named. The hardest-to-defend assumption is usually the one that has been treated as background fact rather than identified explicitly.

2. **Which perspective would directly question the priority assigned in section 2.1?**
   Name the stakeholder role, team, or affected party whose informed view of the situation would lead them to assign a different priority — or no priority at all. Do not pick a perspective that politely disagrees; pick the one that would most sharply contest the reasoning. If no such perspective exists, the prioritization has not been stress-tested.

3. **Where would an informed skeptic say "that's not right"?**
   An informed skeptic is someone with relevant domain knowledge who has read the analysis and finds a specific claim, classification, or conclusion incorrect — not vague or incomplete, but actually wrong. Identify the most vulnerable point. This is not a request for false modesty; it is a request for precision about where the analysis is genuinely exposed.

**If the probe yields new insight** — if any of these three questions reveals an error, a gap, or a materially different reading — the feedback loop activates: revise the affected section in Analyze (section 1.x) or Prioritize (section 2.x), mark it with `[REV]`, and return to Communicate only after that revision is complete. Do not paper over a probe finding with a caveat in Step 2. The probe exists to prevent exactly that.

---

## Step 2 — Mirror perspectives

Once the analysis probe has run (and any triggered revisions are complete), mirror the relevant perspectives. For each role that has a legitimate stake in this problem, identify:

- **Concern** — what this role is primarily trying to protect or achieve
- **Likely objection** — the specific objection this role would raise against the current framing or priority
- **Blind spot** — what this role tends to underweight or not see from its position
- **Required decision input** — what information or decision this role needs to provide before the analysis can be resolved

Not every role is relevant to every analysis. Apply judgment. But where a role is relevant, all four elements must be populated — a perspective mirror that lists concerns without naming objections or blind spots is incomplete.

**Roles to evaluate:**

| Role | Apply when |
|---|---|
| **Management / Leadership** | Organizational decisions, resource allocation, risk tolerance, escalation paths are in scope |
| **Product / PM** | Requirements ownership, roadmap priorities, acceptance criteria, user story framing are involved |
| **UI/UX** | User-facing behavior, interaction design, terminology, discoverability, or accessibility are affected |
| **Frontend** | Client-side implementation, rendering behavior, state management, or browser-specific behavior is in scope |
| **Backend** | Server-side logic, APIs, data processing, persistence, or integration contracts are affected |
| **QA** | Regression risk, test coverage gaps, edge-case invisibility, or release validation are relevant |
| **Security** | Auth/authz logic, data handling, trust boundaries, injection surfaces, or abuse vectors are touched |
| **SEO** | Crawlability, indexability, structured data, content visibility, or URL structure are involved |
| **DevOps / Ops** | Deployment, infrastructure, observability, rollback, or incident response are affected |
| **Legal / Compliance** | Regulatory requirements, data protection obligations, contractual constraints, or liability exposure are present |
| **Support / Customer perspective** | End-user impact, support volume, error messaging, or user-facing failure modes are relevant |

**A note on blind spots:** Every role has structural blind spots — places where its position makes certain costs, risks, or trade-offs systematically invisible. These are not character flaws; they are the predictable consequence of specialization and organizational position. Name them without softening them. A Security perspective that does not name the Security team's tendency to underweight delivery timelines, or a Management perspective that does not name its tendency to underweight technical debt accumulation, has not surfaced the actual blind spot.

---

## Step 3 — Name communication risks

After mirroring perspectives, identify the communication risks that the Clarity Brief must explicitly manage. These are the failure modes that occur not in the analysis itself but in how the analysis is received, understood, or acted on. Six categories must be evaluated:

1. **False certainty** — the analysis presents a conclusion with more confidence than the evidence supports. This is the most common failure mode and the hardest to detect because it feels like clarity. If a probable cause is stated as a confirmed cause, or an assumption is stated as a fact, false certainty is present.

2. **Underestimated risk** — a risk that has been identified but whose severity or probability has been minimized. Often occurs when a risk is technically acknowledged but practically deprioritized without justification. The question is not whether the risk was mentioned but whether its weight in the analysis reflects its actual potential impact.

3. **Over-dramatization** — the analysis amplifies a risk or problem beyond what the evidence supports, often under time pressure or stakeholder anxiety. Over-dramatization is symmetric with false certainty; both distort the signal. If a possible cause is presented as certain, or a low-probability risk is treated as an imminent threat, over-dramatization is present.

4. **Unresolved terminology** — key terms in the analysis mean different things to different stakeholders, and the analysis has not surfaced or resolved that ambiguity. Terminology disputes block decisions; they should be named explicitly rather than left to resolve themselves in implementation.

5. **Hidden trade-offs** — the analysis has implicitly chosen one value or constraint over another without making that choice visible. All priority assignments contain trade-offs; when those trade-offs are not named, stakeholders discover them at the worst possible time.

6. **Unclear ownership** — the analysis reaches a conclusion that requires someone to act, but who must act, decide, or provide input is not specified. An analysis with no named owner for the recommended next step is an analysis that will not be acted on.

---

## Step 4 — Feedback check

After Steps 1–3 are complete, run an explicit feedback check before proceeding to Realize.

**Has Communicate exposed blind spots in Analyze or Prioritize?**

- **Yes** → Identify which sections are affected. Mark each affected section with `[REV]`. Write the revision. Then return to Communicate to verify that the revisions do not open new probe findings before proceeding to Realize.
- **No** → Proceed directly to Realize.

The `[REV]` marking is not administrative housekeeping — it is the mechanism by which the analysis remains honest about its own history. A `[REV]`-marked section signals to every reader that the original framing was superseded, what replaced it, and why. Stripping `[REV]` markers or writing over revisions without marking them defeats the entire purpose of the feedback loop.

**A zero-revision analysis is a warning signal.** If Communicate produces no `[REV]` markings across the full analysis, two explanations are possible: either the ticket was genuinely trivial and the full analysis was not required, or the probe in Step 1 did not challenge the assumptions hard enough. The more common explanation is the second one.

---

## The Clarity Brief

The Clarity Brief is an optional distillation artifact that Communicate may produce. It is not a summary of the full APRICORE analysis — it is a one-page distillation of the Communicate section output (sections 3.2–3.5), intended as a shareable stakeholder summary when one is needed. It is not part of the numbered analysis schema and is not a mandatory output of every analysis.

**Structure:** The Clarity Brief contains exactly four elements:

1. **Neutral problem reframing** — a version of the problem statement that no single party owns. Not the ticket author's framing, not the loudest stakeholder's framing, not the implementer's framing. A statement of the problem that the analysis has arrived at through the examination process, expressed without advocacy.

2. **Priority basis** — what the assigned priority rests on, expressed as two explicit criteria (cause-proximity and timeliness, per the minimum standard from Prioritize), with the three informal prioritization forces (volume, institutional power, time pressure) explicitly excluded or accounted for.

3. **Load-bearing perspectives** — which stakeholder roles have a direct stake in the decision, and what each role's required decision input is. This is derived from Step 2 but distilled to only the perspectives that, if absent, would prevent a sound decision.

4. **Named communication risks** — the subset of Step 3 findings that must be visible to decision-makers. Not all six risk categories will produce findings for every analysis; only the findings that materially affect how the Clarity Brief should be read or acted on are included.

**The Clarity Brief is persistent.** Unlike a status report, the Clarity Brief does not expire when the next update is sent. It records the state of the analysis at the point Communicate is complete and carries that record forward into Realize and beyond. Revisions to the analysis after Communicate require updating the Clarity Brief, not replacing it.

**What the Clarity Brief is not:** It is not the full APRICORE analysis output (that is the output schema defined in `spec/07-output-schema.md`). It is not a slide deck, an email, or a meeting agenda. It is not a compromise between stakeholder preferences — it is the honest, methodologically derived reframing of the problem, which may or may not match what any individual stakeholder prefers to hear.

---

## Summary

Communicate is the phase where APRICORE earns or forfeits its claim to rigor. An Analyze and Prioritize that have never been challenged may be correct — but they have not been tested. Communicate provides the test. The three probe questions in Step 1 are the minimum stress load. The perspective mirror in Step 2 ensures that the analysis has been examined from the positions most likely to find its weakest points. The risk inventory in Step 3 ensures that the Clarity Brief can be communicated without producing the very distortions it is meant to prevent. And the feedback check in Step 4 ensures that any finding from Steps 1–3 that challenges the prior analysis is incorporated rather than noted and ignored.

When a shareable stakeholder summary is needed, the Clarity Brief can be produced from this process: a one-page optional distillation, derived from active challenge rather than passive synthesis, that makes the problem definition visible, contestable, and durable for any audience that needs to engage with it without reading the full analysis.
