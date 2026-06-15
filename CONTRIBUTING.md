# Contributing to APRICORE

Thanks for your interest in improving APRICORE. APRICORE is a requirements-analysis discipline — **A**nalyze, **P**rioritize, **C**ommunicate, **R**ealize — that turns vague, biased, or symptom-laden work items into decision-ready analyses.

## What you can contribute

- **Methodology refinements** — sharper definitions, clearer heuristics, or better worked examples in `docs/spec/` and `docs/examples/`.
- **Prompt improvements** — clearer or more faithful prompts in `docs/prompts/`.
- **Worked examples** — additional realistic, anonymized analyses that demonstrate the method on new input types.
- **Adapters** — once a reference implementation lands, integrations for trackers (Jira, Linear, GitHub Issues, …) and output targets (Markdown, Confluence, Obsidian, …). Integrations are deliberately pluggable; the methodology core stays independent of any tool.

## Ground rules

- **The spec is the single source of truth.** `docs/spec/` defines the method; everything else (prompts, examples, future implementations) must conform to it. If a change alters the method, change the spec first.
- **English only, and no private references.** Published content must read as a generic, vendor-neutral methodology — no employer, client, or personal-project names; no internal paths. Run the guard before submitting:
  ```bash
  ./scripts/check-spec.sh
  ```
  The hard check must print `OK`.
- **Keep files focused.** One responsibility per file; prefer small, clear files over large ones.
- **Examples are invented and anonymized** — never use a real company, product, or person.

## How to propose a change

1. For anything that changes the **method itself**, open an issue first to discuss — methodology changes ripple across the spec, prompts, and examples.
2. For fixes, new examples, or prompt improvements, a pull request is welcome directly.
3. Keep commits small and use clear [Conventional Commits](https://www.conventionalcommits.org/) messages (e.g. `docs(spec): …`, `docs(examples): …`).
4. Make sure `./scripts/check-spec.sh` passes and that any cross-references between files still resolve.

## License

By contributing, you agree that your contributions are licensed under the project's [MIT License](./LICENSE).
