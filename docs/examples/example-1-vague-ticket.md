# Example 1 — Vague Feature Ticket

This example shows a solution-biased, symptom-language-only ticket being processed
through a full APRICORE analysis. The input is a common class of request: a complaint
phrased as a technical instruction. The analysis surfaces the missing problem framing,
separates signal from symptom from cause, and demonstrates how the Communicate probe
triggers a revision before a recommended action is produced.

---

## Raw input

> **Ticket #1047 — Dashboard performance**
>
> Users are complaining that the reporting dashboard is slow. Please add caching so it
> loads faster. This has been an issue for a while and the support team keeps getting
> tickets about it. Needs to be fixed.

---

## APRICORE Analysis

### 1. Analysis

#### 1.1 Sharpened summary

The reporting dashboard exhibits degraded load performance under conditions that are not
yet characterized. User-facing latency is causing support escalations. The root cause of
the slowness is unestablished: "add caching" is a proposed intervention, not a diagnosed
problem. The actual problem is: **what makes the reporting dashboard slow, and is that
cause addressable without first measuring where the time is spent?**

#### 1.2 Explicit requirements

- Add caching to the reporting dashboard.
- Reduce the time it takes for the dashboard to load.

#### 1.3 Implicit assumptions

- Caching is the correct intervention for the observed latency (assumed, not established).
- The slowness is reproducible and not intermittent.
- All users experience the same slowness, rather than a subset under specific conditions.
- "Slow" means unacceptably slow by a defined threshold (assumed; no baseline or target
  response time is stated).
- The dashboard's data queries are the bottleneck, as opposed to network latency, client
  rendering time, or server-side resource contention.
- Adding caching will not introduce correctness problems (stale data served to users).

#### 1.4 Ambiguities / contradictions / TBDs

- **"Slow"** is undefined. No baseline measurement, no target, no percentile is given.
  One engineer's "slow" is another's "acceptable."
- **"Add caching"** is underspecified: what layer (HTTP, application, database query,
  CDN), what cache key strategy, what invalidation policy, what TTL?
- **"A while"** is undefined — is this regression from a known-good state, or a
  long-standing characteristic of the dashboard?
- **Which users** are affected is not stated — all authenticated users, users with large
  datasets, users in specific roles?
- **Which view or interaction** triggers the slowness is not stated — does the dashboard
  load slowly on first navigation, on filter changes, on data refresh?
- **Acceptance criteria** for "fixed" are absent: what load time is acceptable?

#### 1.5 Signal / symptom / possible cause

**Signal:** An elevated rate of support tickets from users reporting that the reporting
dashboard loads slowly.

**Symptom:** Users experience unacceptable wait times when navigating to or interacting
with the reporting dashboard. The support team's ticket queue confirms this is a
recurring pattern rather than an isolated event.

**Possible causes (as hypotheses — none confirmed without profiling data):**

- Unindexed or poorly optimized database queries executed on every page load
  (Possible — consistent with "been an issue for a while" and not tied to a specific
  deployment)
- N+1 query patterns introduced during prior feature additions to the dashboard
  (Possible — common cause of dashboard-class latency)
- Large dataset fetched in full and filtered client-side rather than server-side
  (Possible — consistent with slowness that worsens for users with more data)
- Synchronous third-party API calls blocking the dashboard render path (Possible)
- Frontend rendering bottleneck (heavy component tree, non-virtualized lists) (Possible)
- Infrastructure-level resource saturation during peak usage hours (Possible)

None of these can be confirmed without profiling. Caching could mask some of these
causes without addressing them.

#### 1.6 Codebase context

No codebase access is available for this analysis. All cause-level claims above are
hypotheses derived from structural reasoning about typical dashboard performance patterns.
Certainty is reduced accordingly — confirmed cause identification requires profiling
(query execution times, network waterfalls, flame graphs, or equivalent instrumentation).

#### 1.7 Evidence state

| Claim | Label |
|---|---|
| Users report the dashboard is slow | Anecdotal (multiple reports via support tickets — pattern, not measurement) |
| Support team receives repeated tickets on this issue | Confirmed (stated directly in ticket) |
| The problem has existed for an extended period | Anecdotal (stated by ticket author; no timestamps given) |
| Caching will resolve the slowness | Unsubstantiated (no profiling data links slowness to a cache-addressable bottleneck) |
| Unindexed queries are the cause | Possible (structurally plausible, no evidence) |
| N+1 queries are the cause | Possible (structurally plausible, no evidence) |
| Client-side rendering bottleneck | Possible (structurally plausible, no evidence) |

#### 1.8 Distortion level — interpretive power & framing bias

1. **Who defines the problem here?** The ticket was written by an unspecified author who
   synthesized support escalations into a technical instruction. The author holds
   interpretive power: they have already translated a user-facing symptom into an
   implementation directive ("add caching") before any diagnosis occurred. This collapses
   the analysis space and frames the ticket as an execution task rather than a problem
   to investigate.

2. **Whose voice is absent?** The users who experience the slowness are not quoted
   directly; their reports are mediated through the support team. The support team's own
   observations (which interactions trigger the complaint? what time of day? which user
   segments?) are not included. The engineering team that built or maintains the dashboard
   is not consulted. No performance data or profiling output is attached.

3. **Does the framing serve one party more than others?** Framing the ticket as "add
   caching" serves delivery speed (an engineer can start immediately without a diagnosis
   phase) at the cost of correctness (caching the wrong layer produces stale data or
   solves the wrong bottleneck). It implicitly favors the appearance of action over the
   quality of the outcome.

4. **Is the urgency structurally justified or socially produced?** The ticket carries
   implicit urgency ("keeps getting tickets," "needs to be fixed") but provides no
   structural justification: no SLA breach, no revenue impact, no outage, no defined
   threshold crossed. The urgency is socially produced — repeated escalation by the
   support team creates pressure without establishing that the pressure is proportionate
   to the risk.

---

### 2. Prioritization

#### 2.1 Priority [REV]

**P2** — relevant but not immediately actionable as stated.

*Original draft was P1. Revised to P2 after the Communicate probe (section 3.1) surfaced
that the absence of profiling data makes any implementation decision premature: acting
now on the caching hypothesis risks false fix and introduces cache-correctness risk
without confirmed benefit.*

#### 2.2 Justification [REV]

**Cause-proximity:** The proposed action (add caching) is not demonstrably cause-proximate
because the cause is unconfirmed. Caching is one of six or more candidate interventions
depending on where profiling identifies the actual bottleneck. Implementing caching before
profiling may be symptom-proximate at best, counterproductive at worst (if the bottleneck
is client-side rendering, query-layer caching provides no benefit; if data freshness
matters, a cache with an incorrect TTL introduces correctness risk).

**Timeliness:** The problem has existed "for a while" with no reported acute harm (no
SLA breach, no stated revenue loss, no data corruption). The support team's escalation
volume is a signal of user friction but not a structural emergency. A one-to-two-sprint
investigation + profiling cycle before implementation is proportionate. There is no
established reason why this must proceed this sprint rather than a planned one.

*Prior P1 assignment was driven implicitly by the support team's escalation volume —
a loudness-based signal, not a structural justification. The probe in 3.1 identified
this and triggered the revision.*

#### 2.3 Risk of inaction

If the dashboard remains slow and no investigation is initiated: user frustration
continues, support ticket volume stays elevated, and the underlying cause (whatever it is)
may worsen as the dataset grows. The longer a structural cause like missing indexes goes
unaddressed, the more pronounced the degradation typically becomes. This risk is real and
non-trivial — deferring indefinitely is not the recommendation.

#### 2.4 Risk of wrong handling

- Adding caching without profiling: high probability of false fix. Latency may improve
  superficially while the underlying cause remains.
- Incorrect cache invalidation strategy: stale data served to users, which for a reporting
  dashboard (where correctness of reported numbers matters) is a correctness defect, not
  merely a UX concern.
- Implementing at the wrong layer: a database query cache does nothing for a
  client-side rendering bottleneck, and vice versa.
- Scope creep: "add caching" can expand indefinitely if the scope boundary is not fixed
  before implementation begins.

#### 2.5 Cause-proximate vs. symptom-proximate

The recommended next action (profiling — see 4.4) is cause-proximate: it directly
investigates the structural origin of the latency. Any subsequent implementation step
chosen after profiling will also be cause-proximate (targeting the confirmed bottleneck).
The originally proposed action (caching, implemented without profiling) would be
symptom-proximate: it addresses the observable slowness without confirming it targets
the cause.

---

### 3. Communication — examination and mirror space

#### 3.1 Analysis probe

1. **Hardest assumption to defend (from 1.3):** The assumption that caching is the
   correct intervention. This is the load-bearing assumption of the entire ticket — the
   instruction "add caching" only makes sense if the bottleneck is cache-addressable
   (repeated identical queries, slow data fetches whose results can be reused). Without
   profiling, this assumption has no evidence base. If the actual bottleneck is
   client-side (a heavy rendering pass, an unvirtualized list over thousands of rows),
   adding a backend cache produces zero improvement. The assumption was never stated as
   an assumption — it was presented as an instruction, which makes it more dangerous.

2. **Perspective that would question the priority:** The backend engineering team would
   note that implementing caching without profiling creates the risk of introducing a
   caching layer with an incorrect invalidation policy, potentially serving stale
   reporting data to users while calling the ticket "done." They would argue for
   measurement-first and would resist being handed an implementation directive that
   bypasses diagnosis. A senior engineer familiar with the codebase would very likely
   assign HOLD pending profiling.

3. **Where an informed skeptic would say "that's not right":** The probe identifies that
   the P1 priority assigned in the initial draft was driven by the support team's
   escalation volume — a loudness-based signal — rather than by a confirmed structural
   urgency. An informed skeptic would point out that repeated support escalations are
   evidence of user friction, not evidence that caching is the correct intervention or
   that the change is blocking critical operations. The priority assignment was circular:
   it accepted the urgency the ticket implied rather than independently evaluating it.

**Feedback loop triggered:** The probe in question 3 reveals that the initial P1
assignment was not defensible on cause-proximity grounds. Sections 2.1 and 2.2 are
revised and marked `[REV]`.

#### 3.2 Relevant perspectives

**Support / Customer perspective**
- Concern: Users are experiencing friction; the support team's inbox is filling up.
  They want a fix delivered.
- Likely objection: "We have been reporting this for a while and nothing has changed.
  Why does analysis need to happen before anyone starts working on it?"
- Blind spot: The support team sees the symptom (users complain) but not the structural
  cause, and may not understand why a caching implementation without profiling could
  produce a false fix or introduce data correctness issues.
- Required decision input: A sample of specific support tickets (or a summary) specifying
  which dashboard interactions are cited, for which user segments, and at what times of
  day. This is the missing diagnostic signal.

**Backend / Engineering**
- Concern: Being asked to implement a specific solution (caching) before the cause is
  known is a red flag. A cache implemented at the wrong layer adds complexity without
  benefit.
- Likely objection: "We need profiling data before we can make a responsible
  implementation decision."
- Blind spot: Tends to underestimate the cumulative cost of sustained user friction when
  a "let us measure first" stance is perceived as stalling.
- Required decision input: Authorization to run a profiling session (production or
  staging) and time allocation to interpret results before a sprint commitment is made.

**Product / PM**
- Concern: The support escalation indicates a user experience problem that may affect
  retention or satisfaction metrics. Wants the ticket resolved without blocking the
  roadmap.
- Likely objection: "We cannot spend a full sprint profiling — just add caching and
  iterate."
- Blind spot: Underestimates the cost of a false fix: if caching is added and the problem
  persists, a second ticket is generated, trust in the engineering team's responsiveness
  is eroded, and the cache layer now needs to be maintained.
- Required decision input: Willingness to scope a time-boxed (one to two day) profiling
  step before the sprint commitment is finalized.

#### 3.3 Possible objections

- "A profiling step is overkill — caching is standard practice for dashboards and will
  help regardless of the specific cause." (Counter: standard practice applied without
  diagnosis still carries the risk of stale data and adds an invalidation surface. "Will
  help regardless" is not a defensible engineering claim when the cache layer and
  invalidation strategy have not been specified.)
- "The support team's escalation volume is evidence enough that this is high priority."
  (Counter: volume of complaint is evidence of user friction; it is not evidence of a
  specific cause or a structural emergency. Priority is not proportional to loudness.)
- "We have always solved dashboard slowness with caching." (Counter: past correlation
  between caching and resolved slowness in other contexts is not evidence that the
  current bottleneck is cache-addressable.)

#### 3.4 Communication risks

- **False certainty:** The ticket creates false certainty that caching is the correct
  intervention. If this analysis is communicated as "we confirmed caching will fix it,"
  that false certainty is propagated.
- **Unclear ownership:** The ticket is addressed to engineering generally. No specific
  team or individual is named as responsible for the profiling step or the subsequent
  implementation.
- **Hidden trade-off:** Adding a caching layer introduces a data freshness trade-off.
  For a reporting dashboard, users may expect data to be current; a cache with a 5-minute
  TTL could serve numbers that are out of date. This trade-off is invisible in the
  current ticket framing.

#### 3.5 Neutral reframing

"The reporting dashboard displays degraded load performance that generates repeated user
complaints and support escalations. The cause of the latency is not yet characterized.
Profiling is required to identify the bottleneck layer before an implementation approach
can be responsibly chosen. Caching is one candidate intervention among several; its
suitability depends on where profiling shows time is being spent."

#### 3.6 Feedback check

The Communicate probe (3.1) revealed that the initial priority assignment (P1) was
driven by escalation volume rather than cause-proximity. Sections 2.1 and 2.2 have been
revised and marked `[REV]`. No further gaps were identified. Proceeding to Realize.

---

### 4. Realize

#### 4.1 What is robustly clear

- The reporting dashboard loads slowly enough that users escalate to support repeatedly.
  This is a real and sustained user-facing friction point. (Confirmed — stated in ticket,
  corroborated by support queue.)
- The cause of the slowness is not established. (Confirmed — no profiling data, no
  measurements, no reproduction steps in the ticket.)
- "Add caching" is a proposed solution, not a framed problem. Implementing it without
  profiling carries a meaningful probability of false fix and introduces a cache
  correctness risk. (Likely — structural reasoning, not yet reproduced.)
- The urgency is socially produced (support escalation volume) rather than structurally
  justified (SLA breach, revenue loss, active outage). (Likely — no structural urgency
  evidence provided.)

#### 4.2 What remains open

- What is the actual bottleneck? (Requires profiling — unresolved.)
- Which specific interactions trigger the slowness? (Not stated in ticket — unresolved.)
- Which user segments are affected? (Not stated — unresolved.)
- What is the acceptable load time (target response time)? (Not defined — unresolved.)
- Does "slow" represent a regression from a previous state, or a long-standing
  characteristic? (Not determinable from the ticket — unresolved.)
- If caching is ultimately the correct intervention, what layer, key strategy, TTL, and
  invalidation policy are appropriate? (Requires profiling results — premature to specify.)

#### 4.3 Decision readiness

**Data collection / measurement needed first.** A time-boxed profiling session (query
execution time, network waterfall, client rendering profile) must be completed before
any implementation approach is selected. The analysis is not sufficient to drive an
implementation decision.

#### 4.4 Recommended next step

The backend engineering team lead should schedule a time-boxed profiling session (target:
one to two days) covering database query execution times, API response times, and browser
rendering profile for the reporting dashboard under representative load. The profiling
output becomes the evidence base for the subsequent implementation decision. No caching
implementation should begin before this profiling is complete.

#### 4.5 Corrected ticket version

> **Ticket #1047 (corrected) — Reporting dashboard: investigate and address latency**
>
> **Problem:** The reporting dashboard consistently loads slowly for users, generating
> sustained support escalations. The root cause of the latency is unknown.
>
> **Out of scope:** Implementing any specific technical solution (caching or otherwise)
> before the bottleneck is identified.
>
> **Phase 1 — Required before implementation:**
> Run a profiling session covering: (a) database query execution times on the dashboard
> data path, (b) server response time, (c) client-side rendering profile. Produce a
> written summary naming the confirmed primary bottleneck.
>
> **Phase 2 — Implementation (scoped after profiling):**
> Design and implement a solution targeted at the confirmed bottleneck. If caching is
> selected as the approach, specify: layer, cache key strategy, TTL, and invalidation
> policy. Define the data freshness guarantee the cache will provide.
>
> **Acceptance criteria:**
> - Dashboard load time (time-to-interactive for a representative dataset) meets a
>   defined target (to be agreed with Product before Phase 2 begins).
> - Reported data is not stale beyond the agreed freshness threshold.
> - The fix is validated against the user segments and interaction types identified in
>   Phase 1 profiling.

---

### 5. Brief conclusion

- The ticket is solution-biased: "add caching" is an unvalidated hypothesis, not a
  diagnosed cause. Implementing it without profiling risks a false fix and introduces
  cache-correctness risk for a dashboard where data accuracy matters.
- Six structurally plausible causes exist for the observed latency; none can be confirmed
  without profiling. The correct next action is measurement, not implementation.
- The urgency is socially produced (support escalation volume), not structurally justified.
  A one-to-two-day profiling step before sprint commitment is proportionate and does not
  require emergency prioritization.
- The initial P1 priority was revised to P2 after the Communicate probe identified that
  it was based on escalation volume (loudness) rather than cause-proximity.
- The corrected ticket separates the problem into a profiling phase and a targeted
  implementation phase — this prevents the most common failure mode (implementing the
  wrong fix, labeling it done, and reopening the ticket when the problem persists).
- Missing from the original ticket and required before any implementation: a target
  response time, identification of affected user segments, and specification of which
  interactions trigger the complaint.
