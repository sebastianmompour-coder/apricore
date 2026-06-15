# APRICORE — The Framework

APRICORE is a micro-framework for problem definition and handling order. It turns vague, overloaded, politically distorted, or symptom-driven work items into precise, verifiable, decision-ready analyses. It refuses to take tickets, feature requests, bug reports, TODOs, milestone descriptions, stakeholder statements, or proposed solutions at face value. The four phases — **A**nalyze, **P**rioritize, **C**ommunicate, **Realize** — form a sequential handling order, not a process model, role framework, or governance architecture. APRICORE does not replace Scrum, PMBOK, PRINCE2, or any full root-cause-analysis method; it fills the gap those frameworks leave: the structured, quality-assured step of actually determining what the problem is before deciding how or whether to act on it.

---

## When to use it

Use APRICORE any time an input exhibits one or more of these properties:

- **Unclear or underspecified** — requirements are missing, implied rather than stated, or too vague to act on reliably.
- **Symptom-heavy** — the description names an observable friction or anomaly without identifying a cause.
- **Solution-biased** — the request pre-selects a solution before the problem has been correctly framed.
- **Politically framed** — the wording serves the interests of the person who wrote it more than the problem it describes.
- **Contradictory** — different parts of the input point in incompatible directions.
- **Urgency-driven without justification** — pressure signals are present but the structural basis for that urgency is absent.
- **Risk-laden** — security, legal, or architectural implications are present but not named or evaluated.
- **Loudest-voice framing** — the input reflects what was said most forcefully or most recently, not what is most cause-proximate.

When in doubt, apply APRICORE. The cost of a structured analysis on a simple problem is low. The cost of skipping analysis on a complex one is not.

---

## Core principles

These eight principles govern every step of APRICORE. They are constraints, not suggestions.

1. **Do not confuse signal, symptom, opinion, urgency, hierarchy, or frustration with the actual problem.** Each of these is a different epistemic category. Conflating them produces analyses that are locally coherent but structurally wrong.

2. **Do not jump directly to implementation.** The impulse to act is not evidence that the action is the right one. Realize precedes execution; execution is not part of APRICORE.

3. **Do not assume the ticket is already correct.** Tickets are written under time pressure, by people with partial information, framed by whoever happened to be loudest at the time. Treating the ticket as ground truth is not analysis — it is transcription.

4. **Do not assume the loudest framing is the right one.** Volume, institutional power, and time pressure are the three dominant forces in informal prioritization and problem definition. None of them is a proxy for cause-proximity.

5. **Uncomfortable precision is better than comfortable vagueness.** A precise statement that reveals an inconvenient truth is more useful than a soft framing that defers the hard question. APRICORE is not in the business of managing feelings about problems.

6. **Use codebase context when it is present.** When code is available, the analysis must use it — affected modules, dependencies, existing patterns, validation logic, regression zones. Ignoring available evidence is a methodology failure.

7. **Explicitly reduce certainty when codebase context is absent.** Certainty that has no grounding in available evidence must be flagged, not silently asserted. Uncertainty is information; hiding it is distortion.

8. **Never invent certainty.** A hypothesis is a hypothesis. A confirmed cause is a confirmed cause. The two must never be presented as equivalent. If verification has not occurred, the statement must say so.

---

## The four phases at a glance

APRICORE is sequentially readable but not rigidly linear. The feedback loop from Realize back to Analyze is an explicit and expected part of the model.

**Analyze** — Clarify what is actually being claimed: have we understood the actual problem, or have we only named a symptom? → [Full phase definition](./02-analyze.md)

**Prioritize** — Determine what actually matters now: what counts at this moment, and why — not because it is loudest? → [Full phase definition](./03-prioritize.md)

**Communicate** — Challenge, do not report: this is the examination and mirror space where Analyze and Prioritize are stress-tested — have we surfaced relevant perspectives and produced a Clarity Brief? → [Full phase definition](./04-communicate.md)

**Realize** — Reach a defensible conclusion: what is robustly clear, and what action follows logically from that clarity? → [Full phase definition](./05-realize.md)

### The feedback loop

Realize can trigger a return to Analyze. Three conditions activate this loop:

| Trigger | Action |
|---|---|
| The Communicate probe reveals a gap in the analysis | Mark the affected section with `[REV]`, update it, then re-check Prioritize |
| The Communicate phase overturns the priority assignment | Mark sections 2.1–2.2 with `[REV]`, add justification, proceed |
| A Realize insight contradicts earlier assumptions | Revise the affected section in Analyze or Prioritize, mark the revision explicitly |

The analysis is complete only when Realize stands without new `[REV]` markings. If more than two full cycles are required, escalation is the correct response — not continued cycling.

### What APRICORE is not

- Not a process model or role framework
- Not a governance architecture
- Not a full root-cause-analysis method
- Not a replacement for Scrum, PMBOK, PRINCE2, or similar
- Not an alternative to specialist security, legal, or domain review — it routes to those when they are needed

### Methodological lineage

APRICORE is a lightweight, framework-agnostic tool. Its named predecessors include PDCA, OODA, Kepner-Tregoe, DMAIC, Toyota A3 (closest relative — the Clarity Brief artifact derives from the A3 structure), McKinsey 7-Step, Minto Pyramid, Senge Systems Iceberg (direct source for the six analysis levels), Cynefin (domain-check prerequisite), and Ford 8D. What distinguishes APRICORE from each of these is the combination of three features no other listed framework provides together: (a) an explicitly weighted Communicate step with a defined artifact (the Clarity Brief), (b) a formal feedback loop, and (c) named, documented predecessors — making the methodology's own lineage transparent and falsifiable.
