# A — Analyze

The Analyze phase answers one guiding question: **Have we understood the actual problem — or have we only named a symptom?**

Its discipline is precision through decomposition. The work is not to accept the input at face value, summarize it, or propose a solution. The work is to clarify what is actually being claimed — what is stated, what is implied, what is contested, and what is still unknown. An Analyze phase that ends at the symptom level because the cause is politically inconvenient, structurally too costly to surface, or simply not demanded by the ticket has failed.

The output of Analyze is not a symptom description. It is a **verifiable problem hypothesis** — a falsifiable, evidence-grounded claim about what the actual problem is and why. Not "the system is slow" but "the system is slow because query X on table Y executes without a covering index — suspected from profiling data dated [date]." The distinction between naming a symptom and formulating a verifiable hypothesis is the minimum standard of this phase.

---

## The six things always determined in Analyze

Before any structural analysis begins, six determinations must be made for every input, regardless of its apparent simplicity:

1. **What is explicitly required** — what the input states directly, in its own words, with no inference added.
2. **What is only implied** — what must be true for the explicit requirements to make sense, but is never stated.
3. **What is vague, overloaded, or undefined** — terms, criteria, or scope boundaries that different readers would interpret differently, or that carry multiple conflicting meanings simultaneously.
4. **What is signal vs. symptom vs. possible cause** — the observable trigger (signal), the functional anomaly it indicates (symptom), and the structural explanation that could generate that anomaly (possible cause). These are three distinct epistemic categories and must never be collapsed into one.
5. **What evidence exists** — what is confirmed, likely, possible, anecdotal, or unsubstantiated. The type of evidence matters as much as its content.
6. **What remains TBD** — open questions, missing information, and decisions not yet made that the analysis cannot currently resolve.

These six determinations drive the structure of the analysis. Skipping any of them does not shorten the analysis — it creates blind spots that surface later as rework.

---

## The six analysis levels

Every input, once decomposed, can be examined across six strata. These levels are derived from systems-thinking practice (Senge's iceberg model). They are not sequential steps; they are lenses applied to the same problem simultaneously. The discipline is to reach all six rather than stopping when the first plausible explanation appears.

### Signal level
What is visible, loud, acute, measurable, or reported. The triggering event: a dashboard alert, a user complaint, a ticket opened, a metric that moved. The signal is the surface — the fact that something is noticed. It tells you that something is worth investigating; it does not tell you what.

### Symptom level
The friction, error, complaint, or anomaly that the signal indicates. The symptom is one layer deeper: not "the alert fired" but "the checkout flow shows a 23% abandonment spike." Symptoms are real and must be taken seriously, but they are not causes. A symptom is a description of a malfunction; it says nothing about why the malfunction exists.

### Cause level (structural)
The structural conditions that could generate the observed symptom. Causes are not inferred from the symptom alone — they require evidence. The question at this level is: what mechanism, architecture, configuration, process, or decision, if present, would predictably produce this symptom? Multiple candidate causes are normal; the discipline is to hold them as hypotheses rather than conclusions until evidence confirms or eliminates them.

### Distortion level
The interests, incentives, power structures, and biases that warp the framing of the problem — shaping which symptoms are visible, which causes are named, and whose definition of the problem dominates. The distortion level does not assess whether the problem is real; it assesses whether the way the problem has been framed is neutral and complete, or whether it serves some parties more than others. Distortion is not always intentional. It can emerge from structural position, cognitive load, institutional inertia, or the path of least resistance in a given organization.

The distortion level is not optional. It must always be examined explicitly.

#### The four mandatory distortion-level questions

For every analysis, these four questions must be asked and answered — not skipped because the answer seems obvious, and not merged into the symptom or cause level:

1. **Who defines the problem here — and does this person or group hold interpretive power?** Interpretive power is the authority — through hierarchy, budget control, or rhetorical dominance — to determine which version of the problem becomes the accepted one. The person who opens the ticket, the manager who escalates, and the stakeholder who frames the briefing all exercise interpretive power. Their framing is not neutral.

2. **Whose voice is missing from the requirement?** The affected users who experience the problem daily, Ops and infrastructure teams who maintain the environment, QA engineers who observe edge cases, adjacent product teams whose work is coupled — any of these may be absent from the input. Absent voices produce partial problem statements.

3. **Does the chosen framing serve one party more than others?** A framing that emphasizes speed of delivery over correctness serves engineering throughput. A framing that emphasizes a specific technical solution serves the person who prefers that solution. A framing that names only customer-facing symptoms obscures internal process failures. These asymmetries must be named.

4. **Is the urgency structurally grounded or socially produced?** Urgency theater is the production of pressure through social mechanisms — escalation, repetition, managerial emphasis, deadline rhetoric — without structural justification for why this problem requires action now rather than at normal priority. Urgency theater is one of the most common distortion mechanisms in software development. It must be distinguished from genuine structural urgency (regulatory deadline, active data loss, revenue-blocking outage) before it is accepted as a prioritization input.

### Precision level
The most decision-useful formulation of the problem, after signal, symptom, cause, and distortion have all been examined. The precision level is not a summary of the levels above — it is a reframing. It asks: given everything we now know about what is actually happening, what is the sharpest, most actionable way to state the problem? This is the formulation that drives Prioritize. It is specific enough to be falsified, bounded enough to be acted on, and neutral enough that it does not pre-select a solution.

### Intervention level
The category of measure that addresses the core of the problem rather than its surface. Intervention level reasoning does not select the implementation — that belongs to Realize and to whichever execution framework supplements APRICORE. It identifies the type of intervention warranted: architectural change, configuration correction, process redesign, documentation, data collection, stakeholder alignment, or deferral. Identifying the right intervention type prevents the most common form of rework: solving the right problem with the wrong class of action.

---

## Request classification

Every input must be classified before the six analysis levels are applied. The classification is not a judgment of quality — it is a diagnostic that sets expectations for what the analysis will find and what follow-up is required.

| Classification | What it means |
|---|---|
| **Clear** | Requirements are explicit, bounded, and internally consistent. Ambiguity is absent or negligible. |
| **Partially clear** | Core intent is recoverable but some requirements are implied rather than stated, or scope is open at the edges. |
| **Ambiguous** | The same wording supports multiple incompatible interpretations. Resolution requires clarification before analysis can proceed with confidence. |
| **Contradictory** | Different parts of the input point in incompatible directions. At least one part cannot be satisfied without violating another. |
| **Underspecified** | Requirements are present but missing enough detail to drive a reliable implementation decision. |
| **Solution-biased** | The input pre-selects a solution — a specific implementation, tool, or approach — before the problem has been correctly framed. The solution may be correct; that is not established until the problem is. |
| **Politically framed** | The wording of the requirement reflects the interests or perspective of the person who wrote it more than the problem itself. The framing forecloses options or assigns blame in ways that serve a particular party. |
| **Symptom-language-only** | The input describes an observable anomaly or friction without any causal claim. Nothing in the input reaches the cause level. |

A single input can carry more than one classification simultaneously — for example, "partially clear and solution-biased" or "underspecified and symptom-language-only." When classifications combine, the most restrictive one governs what must be resolved before Prioritize can proceed with full confidence.

---

## Codebase-context checks

When a codebase or system is available as context — not as a reference, but as something that can be read and traced — the following checks are part of the Analyze phase. Codebase context is not a supplement to analysis; it is evidence, and must be treated with the same rigor as any other evidence type.

When context is available, determine:

- **Affected modules and components** — which files, packages, classes, functions, or components are directly touched by the problem, and which are indirectly affected through shared state or control flow.
- **Dependencies and coupling** — which other parts of the system depend on the affected components, and how tightly. Tight coupling expands blast radius; loose coupling limits it.
- **Existing domain patterns and prior similar logic** — how has the codebase solved analogous problems before? Prior implementations are evidence about what the team considered correct in earlier contexts. Diverging from them requires justification; repeating their mistakes requires awareness.
- **Validation, state handling, and error handling** — where are invariants enforced, what state transitions are managed, and how are exceptional conditions handled? These are the most common locations where structural causes reside.
- **Tests and likely regression zones** — what test coverage exists over the affected components, and which areas are likely to behave differently if a change is made? Regression zones are not merely areas the tests cover — they are areas where behavior is load-bearing for other callers.

When codebase context is not available, explicitly reduce certainty in the hypothesis. A cause-level claim made without access to the code is a hypothesis; it must not be stated as a confirmed finding.

---

## What Analyze does not do

Analyze does not produce implementation decisions. It does not produce a solution. It does not rank problems against each other — that is Prioritize. It does not select communication strategy or produce the Clarity Brief — that is Communicate. It does not determine what action follows — that is Realize.

Analyze produces one thing: a verifiable problem hypothesis, grounded in evidence, classified by request type, examined across all six analysis levels, and honest about what remains open. That hypothesis is the input that makes every subsequent phase trustworthy.
