# 06 — Cross-Cutting Disciplines

Three disciplines run through every APRICORE analysis regardless of phase. They are defined here as the canonical reference; the phase files (`04-communicate.md`, `05-realize.md`) refer to this document for authoritative definitions.

---

## The feedback loop

APRICORE is sequentially readable but not rigidly linear. Communicate can provoke new analysis; new data can overturn a priority; an insight reached during Realize can contradict an assumption established in Analyze. The feedback loop is not a failure mode — it is a designed structural feature. What distinguishes a mature analysis from a superficial one is precisely whether the loop was activated.

### Trigger → action table

| Trigger | Action |
|---|---|
| The Communicate analysis probe exposes a gap in Analyze | Mark the affected section(s) `[REV]`, update the analysis, then re-check Prioritize — a corrected cause framing often changes the priority. |
| The Communicate phase overturns the priority established in Prioritize | Mark sections 2.1–2.2 `[REV]` and add explicit justification for the revised priority. |
| A Realize insight contradicts assumptions made in Analyze or Prioritize | Revise the affected section(s) (1.x or 2.x), mark each revision with `[REV]`, and state what changed and why. |

### Closing rule

The analysis is complete only when Realize stands without any new `[REV]` markers. An analysis that carries zero revisions throughout is a warning sign: either the ticket was genuinely trivial, or Communicate did not challenge the core claims hard enough. A well-executed Communicate step almost always surfaces at least one assumption worth revisiting.

If two full feedback cycles complete and the analysis is still not stable, the right response is escalation — not a third cycle. Continued cycling on an unstable foundation is a process failure, not a methodology feature.

---

## Evidence discipline

Every claim in an APRICORE analysis must carry an explicit epistemic status. The discipline of labeling evidence is not a bureaucratic formality; it is the primary defense against the most common failure modes in problem analysis: treating assumptions as facts, treating symptoms as causes, and treating urgency as justification.

### Three separations to maintain

Always clearly distinguish between:

- **Fact / assumption / interpretation / anecdotal evidence** — the provenance of what you know
- **Symptom / possible cause / likely cause / confirmed cause** — the causal status of an observation
- **Risk / TBD / open item** — the resolution status of an uncertainty

These three separations address different dimensions of epistemic uncertainty and must never be collapsed into a single undifferentiated claim.

### The five evidence labels

Apply exactly these labels to claims in the analysis, particularly in sections 1.3 (implicit assumptions), 1.5 (signal / symptom / possible cause), and 1.7 (evidence state):

| Label | Meaning |
|---|---|
| **Confirmed** | Verified by direct observation, reproduction, or measurement. A verified statement requires concrete evidence in hand — not inference. |
| **Likely** | Strongly supported by available evidence and consistent with known patterns, but not yet directly verified. |
| **Possible** | Consistent with the available evidence but competing explanations exist; further investigation required before acting. |
| **Anecdotal** | Based on a single report, one observation, or an informal account. Treated as a signal worth investigating, not as evidence of a pattern. |
| **Unsubstantiated** | Asserted without supporting evidence. Recorded to make the gap explicit, not to give the claim standing. |

### Three hard rules

These rules are non-negotiable and not softened by authority, urgency, or convention:

1. **A stakeholder statement is not evidence.** A statement from a product owner, a manager, or a user is an input to analysis — it tells you what someone believes or wants. It is not a confirmed fact about system behavior or causal structure. Record it as `Anecdotal` or `Unsubstantiated` until independently corroborated.

2. **A proposed solution is not a correctly framed problem.** When a ticket arrives with a solution already specified, treat the solution as a hypothesis about the cause — not as the problem definition. The problem must be established independently. A solution can be correct for the wrong problem.

3. **A metric change is not causal proof.** An observed change in a measurement — a rise in error rate, a drop in conversion, a spike in latency — establishes that something changed. It does not establish why. Correlation between a deployment and a metric change is a starting point for analysis, not a conclusion.

---

## Analysis lenses

The core APRICORE phases (Analyze, Prioritize, Communicate, Realize) apply to every ticket. The analysis lenses are supplementary: activate the relevant lens or lenses when the ticket domain calls for it. A ticket about an authentication change activates Security by default; a ticket about changing page titles activates SEO/Web. Multiple lenses can be active simultaneously.

The lenses do not replace the core phases — they deepen one dimension of the Analyze step and feed into the optional output sections (Security considerations, Quality consequences, SEO/Product consequences). Do not activate a lens as a checklist exercise; activate it when there is genuine risk in that dimension.

### Security

Activate when the change touches authentication, authorization, data handling, user input, external integrations, or any trust boundary.

Checklist items to evaluate:
- Authentication and authorization: are access controls correct, complete, and consistently enforced?
- XSS, CSRF, IDOR, SSRF: does the change introduce or widen any of these attack surfaces?
- Injection risks: is user-supplied input passed to a query, shell, template, or serializer without adequate sanitization?
- Validation gaps: is input validated at the correct layer (not only on the client side)?
- Broken trust boundaries: does the change assume trust that is not actually established?
- Data leakage: can the change expose sensitive data in logs, error messages, API responses, or URLs?
- Abuse, spam, and bot vectors: does the change create or expand a surface that can be automated or abused?
- Rate limiting: are sensitive endpoints protected against brute force and enumeration?
- Insecure defaults: does the change ship with configuration or behavior that is unsafe out of the box?

### Quality and testability

Activate when the change modifies shared logic, cross-cutting infrastructure, persistence, or anything with an existing test gap.

Checklist items to evaluate:
- Regression risk: which existing behaviors could break, and are they covered by tests?
- Missing tests: does the change introduce behavior that has no test path?
- Observability gaps: will a failure in this code be visible in production — through logs, metrics, or alerts?
- Migration and rollback risk: can the change be safely rolled back? Are schema migrations reversible?
- Hidden coupling: does the change reveal or introduce implicit dependencies between components?

### Product and UX

Activate when the change affects user-facing behavior, terminology, flows, or acceptance criteria.

Checklist items to evaluate:
- Misread user needs: is the ticket solving what users actually need, or what someone assumed they need?
- Unclear acceptance criteria: is "done" defined precisely enough to avoid a rework cycle?
- Misleading UI terminology: does the interface use language that contradicts user mental models or domain conventions?
- Invisible edge cases: which user states, input combinations, or usage patterns are not represented in the ticket?
- State inconsistency: can the user reach an inconsistent UI state through normal interaction?
- Deep-link behavior: does the change affect URL structure, bookmarkability, or browser history in ways the ticket does not address?

### SEO and web

Activate when the change affects page rendering, URL structure, metadata, content visibility to crawlers, or site performance.

Checklist items to evaluate:
- Crawlability and indexing: does the change affect which pages are accessible to search engine crawlers?
- Rendering implications: is content rendered server-side or client-side, and does the change shift that boundary?
- Structured data: does the change affect schema markup or rich result eligibility?
- Duplicate content: does the change create additional URLs that serve the same or similar content?
- Performance effects: does the change affect page load time, Core Web Vitals, or resource loading order?
- Information architecture mismatch: does the new URL structure or navigation contradict the site's established IA patterns?

### Process and organization

Activate when the ticket reveals coordination failures, unclear ownership, or a priority that appears socially rather than structurally justified.

Checklist items to evaluate:
- Ownership gaps: is it clear who is responsible for delivering this change and for maintaining the result?
- Decision latency: is the ticket blocked because a decision has not been made, and if so, who must make it?
- Requirement debt: does this ticket carry unresolved ambiguity from an earlier decision that was deferred rather than resolved?
- Urgency theater: is the stated urgency structurally justified, or is it socially produced pressure without proportionate underlying risk?
- Power distortion: does the problem framing reflect the interests of the person with interpretive authority rather than the interests of the users or the system?
