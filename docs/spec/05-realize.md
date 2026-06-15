# R — Realize

Reach a defensible conclusion. Realize answers one guiding question: **What is robustly clear — and what action follows logically from it?**

The name is deliberate. "To realize" carries two meanings in English: to come to understand something, and to bring something about. Both readings are present in this phase, but the primary reading is epistemological. Realize is not the execution step — it is the step where the analysis earns the right to drive an execution decision. The conclusion produced here must be robust enough that it does not require the practitioner to be present to defend it. If the conclusion collapses when examined by anyone other than the person who wrote it, the analysis is not done.

The failure mode for this phase is the same one APRICORE is designed to prevent throughout: skipping to action before the insight is robust. A Realize that starts with "so the fix is..." rather than "what is actually clear here?" has not completed the phase; it has performed the conclusion while bypassing it.

---

## What Realize concludes

Every Realize section addresses four questions, in order:

1. **What is actually clear now?**
   What, after the full sequence of Analyze, Prioritize, and Communicate, can be stated with confidence? This is the residue of the analysis — the claims that survived the analysis probe in Communicate, that are grounded in evidence, and that hold up to the scrutiny that was applied. "Clear" does not mean certain; it means that the claim is explicitly labeled with its evidence basis and that no unresolved probe finding contradicts it.

2. **What remains unresolved?**
   What open questions, contested assumptions, missing data points, or structural ambiguities could not be resolved by the analysis? These are not failures — they are the honest output of a methodology that refuses to invent certainty. Naming what remains open is as important as stating what is clear. An analysis that has no open questions has either confronted a genuinely simple problem or has stopped asking questions too early.

3. **Whether implementation is already justified?**
   Given what is clear and what remains open, is the evidence basis strong enough to proceed to implementation? This is not a question about whether implementation is eventually required — it is a question about whether it is justified now, with the current state of knowledge. Implementation justified on insufficient evidence produces rework; implementation deferred when the evidence is already sufficient produces delay. Realize names which one applies.

4. **Whether clarification must come first?**
   If implementation is not yet justified, what specific clarification, decision, or information would change that? This is the actionable form of "what remains unresolved" — not a general gesture toward uncertainty but a named prerequisite.

---

## The eight allowed outcomes

Realize does not produce a free-form recommendation. It routes to exactly one of eight allowed outcomes. The selection is determined by what the analysis has established, not by what the requester expects or what the implementer would prefer.

**1. Implementation is sensible**
The problem is sufficiently understood, the priority is defensibly assigned, the relevant perspectives have been examined, and the risks are named and manageable. The analysis is complete. Proceed to implementation with the corrected ticket version from section 4.5 as the specification.

**2. Further analysis needed first**
The analysis has identified that the problem is not yet understood well enough to justify implementation. A specific gap in understanding exists — a missing cause level, an unexamined distortion, or a structural question the analysis could not answer from available information. Return to Analyze, targeting the identified gap, before proceeding.

**3. Data collection / measurement needed first**
The analysis has reached the limit of what structural reasoning can establish without empirical input. A hypothesis has been formed, but verifying it requires data that does not yet exist — a performance measurement, a user behavior metric, an error rate under production conditions, a controlled test. Implementation before measurement risks solving the wrong problem. Collect the specified data, then return to Analyze.

**4. A domain decision needed first**
The analysis has established the problem clearly but cannot determine the correct response without a decision that belongs to a domain authority — a product owner, a legal team, a business stakeholder, a security officer. This is not a case of missing analysis; it is a case of missing authorization. The required decision must be made explicitly before implementation proceeds.

**5. A security or legal review needed first**
The analysis has identified that the work touches a surface — an authentication boundary, a data handling path, a regulatory requirement, a contractual constraint — where the risk of getting it wrong exceeds the practitioner's scope to assess unilaterally. The review is not a precaution; it is a prerequisite. Proceed only after the review is complete and its findings are incorporated.

**6. Ticket back to the requesting side**
The request, as currently stated, cannot be responsibly analyzed or implemented. The requirement contains a contradiction that only the requester can resolve, a scope boundary that makes implementation impossible without a decision the requester has not made, or an assumption baked into the ticket that the analysis has shown to be false. Return the ticket with the specific finding that makes it unworkable in its current form.

**7. Split into smaller problem spaces**
The analysis has found that what arrived as a single request is actually two or more distinct problems with different causes, different priorities, or different responsible parties. Attempting to address them as a unit would require resolving trade-offs that have not been surfaced as trade-offs. Split the problem into named sub-problems, apply APRICORE to each, and route each independently.

**8. Do not pursue for now**
The analysis has concluded that the problem, as understood, does not meet the threshold for action at this time. This may be because the cost of action exceeds the cost of inaction, because the problem is better addressed by a different change already in progress, because the risk of intervention exceeds the risk of the status quo, or because the problem resolves itself under conditions that are already in motion. This outcome is not a rejection — it is a reasoned conclusion. It requires justification in the same way every other outcome does.

---

## The hypothesis-vs-verified discipline

Realize operates on the output of a structured analysis, not on empirical verification. This distinction has a direct consequence for the language Realize uses.

**What Realize may state:** A conclusion grounded in code reading, structural reasoning, or documented evidence may be expressed as a hypothesis with an appropriate certainty label. "Likely crashes on NULL input because the guard clause at line 47 handles only empty string, not null." "Possibly a caching race condition given the intermittent failure pattern and the shared cache key structure." These are legitimate Realize conclusions — specific, grounded, and honestly labeled.

**What Realize may not state:** A conclusion that uses the language of verified fact when no verification has occurred. "Crashes on NULL input" — stated without a bash reproduction or observed failure — is not a Realize conclusion; it is a claim that has exceeded what the analysis can establish. Code reading produces hypotheses. Structural reasoning produces hypotheses. A confirmed finding requires reproduction, observation, or measurement.

**The three certainty labels that apply to Realize conclusions:**

- **Likely** — the reasoning is strong and the evidence points clearly in one direction, but reproduction or measurement has not been performed. Use when the structural case is compelling. Example: "Likely causes data loss under concurrent writes — the write path has no mutex and the race window is clearly present in the code."
- **Possible** — the evidence is suggestive but not strongly directional. Multiple causes could explain the observed signal. Use when the analysis has narrowed the field without eliminating alternatives. Example: "Possibly related to the session handling refactor — timing is consistent, but the change touched three paths, any of which could be responsible."
- **Confirmed** — a verified finding, established by reproduction, observation, or measurement. Realize may carry a Confirmed label forward from upstream evidence (a reproduction already in the ticket, a metric already collected), but may not generate new Confirmed claims without the corresponding verification. If the claim requires bash execution to confirm, that execution has not happened within APRICORE; mark the claim as Likely and route to the appropriate verification step.

The full evidence label system — including the distinction between Confirmed, Likely, Possible, Anecdotal, and Unsubstantiated as applied to evidence types — is defined canonically in `spec/06-disciplines.md`. The discipline stated here concerns specifically the language of Realize's conclusions: never assert a verified finding that the analysis has not actually verified.

---

## Realize artifacts: local vs. durable

Realize produces output in one of two modes, depending on what the insight requires to carry beyond the current analysis.

**Local artifact:** An insight that is sufficient for the occasion — the specific ticket, the specific decision, the specific review. A memory note, a commit message annotation, a done-remark in the task system. Local artifacts are appropriate when the insight does not generalize beyond the immediate context or when the pattern it captures is already documented elsewhere.

**Durable artifact:** An insight that carries beyond the occasion — a decision that will recur, a pattern that affects future callers, a constraint that must be visible to the next implementer. An Architecture Decision Record (ADR), a pattern document, a glossary entry, a skill update. Durable artifacts are appropriate when the insight, if not recorded structurally, will have to be re-derived by the next person who encounters the same problem.

Realize is not Execute. Code changes, pull requests, and deployments are execution — they belong to the workflow that follows APRICORE, not to APRICORE itself. The Realize artifact is the conclusion that justifies execution, not the execution itself. The code patch solves one ticket; the ADR that documents the architectural decision behind it makes the pattern binding for every subsequent caller. Both are outputs — but only the ADR is a Realize artifact. The patch is the outcome of the outcome.

---

## The feedback loop at Realize

If Realize produces an insight that contradicts a conclusion carried forward from Analyze or Prioritize, the feedback loop activates. The contradicted section is marked `[REV]`, the revision is written, and Communicate re-runs on the revised analysis before Realize can settle. This is not optional — a Realize conclusion that reveals an error in the prior phases and does not trigger revision has not closed the loop; it has added a footnote to a flawed analysis.

The feedback loop has a maximum of two cycles. If two full cycles of revision have not produced a Realize that stands without triggering further revision, the analysis has reached the limit of what it can resolve unilaterally. The correct response is escalation — surfacing the unresolved structural question to the appropriate decision-maker — not a third cycle of the same process.

Realize is complete when it stands without generating new `[REV]` markings. Until that point, the analysis is not done.

---

## Summary

Realize is where the analysis becomes a conclusion. Its discipline is twofold: use the eight allowed outcomes to route explicitly rather than gesturing toward action, and use the hypothesis-vs-verified distinction to label conclusions honestly rather than inflating them. A Realize that produces a Likely claim when the evidence is strong, names what remains open when the evidence is incomplete, and routes to "do not pursue for now" when the cost-benefit calculus does not support action has done its job. A Realize that states Confirmed findings without reproduction, produces free-form recommendations outside the eight outcomes, or proceeds to implementation before the analysis probe has been satisfied has not.

The conclusion Realize reaches must be defensible in the practitioner's absence. If it requires the practitioner's presence to hold up, it is not a conclusion — it is an argument. Arguments belong in Communicate. Conclusions belong in Realize.
