# APRICORE

A requirements-analysis discipline that turns vague, biased, or symptom-laden work items into decision-ready analyses. APRICORE guides practitioners through a structured process: **Analyze** problems systematically, **Prioritize** what actually matters, **Communicate** findings clearly, and **Realize** outcomes effectively.

---

## The four phases

APRICORE consists of four phases applied in sequence. Feedback loops from later phases back to earlier ones are a designed feature, not a failure.

| Phase | Guiding question | Spec |
|---|---|---|
| **Analyze** | Have we understood the actual problem — or have we only named a symptom? | [02-analyze.md](./docs/spec/02-analyze.md) |
| **Prioritize** | What actually matters now, and why — not because it is loudest? | [03-prioritize.md](./docs/spec/03-prioritize.md) |
| **Communicate** | Have we stress-tested Analyze and Prioritize, and produced a Clarity Brief? | [04-communicate.md](./docs/spec/04-communicate.md) |
| **Realize** | What is robustly clear, and what action follows logically from it? | [05-realize.md](./docs/spec/05-realize.md) |

Additional specification files:

- [01-framework.md](./docs/spec/01-framework.md) — framework overview, core principles, and when to use APRICORE
- [06-disciplines.md](./docs/spec/06-disciplines.md) — cross-cutting disciplines: feedback loop, evidence labeling, and analysis lenses
- [07-output-schema.md](./docs/spec/07-output-schema.md) — canonical output structure (sections 1–8, hard rules)

---

## How to apply

**With an LLM (any provider):** Use the prompts in [`./docs/prompts/prompt-library.md`](./docs/prompts/prompt-library.md). The library provides ready-to-paste prompt templates that walk a language model through the four phases against an input ticket or requirement.

**Manually:** Read the spec files in order (`01` → `07`) and apply the phases to the work item directly. The output schema in `07-output-schema.md` defines the sections every analysis must produce.

**Worked examples** showing both approaches applied to realistic inputs:

- [`./docs/examples/example-1-vague-ticket.md`](./docs/examples/example-1-vague-ticket.md) — a vague, underspecified ticket analyzed end-to-end
- [`./docs/examples/example-2-stakeholder.md`](./docs/examples/example-2-stakeholder.md) — a politically framed stakeholder request

---

## What this is not

- **Not a hosted service.** APRICORE is a methodology specification, not a product. There is nothing to sign up for.
- **Not a project-management tool.** APRICORE analyzes problems; it does not manage them. It does not replace your issue tracker, your wiki, or your planning process — it is the structured step that should precede those.
- **Not tied to any LLM vendor or agent host.** The prompts in this repository work with any instruction-following language model. No specific provider, platform, or API is required.

---

## License

- **Methodology texts** (`docs/`) — [CC BY 4.0](./LICENSE-docs). Share and adapt for any purpose, with attribution.
- **Code, tooling, and configuration** — [MIT](./LICENSE).

APRICORE is a free, open discipline — no certificates, no commercial binding, and not affiliated with any other provider using this name.
