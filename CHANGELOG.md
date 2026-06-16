# Changelog

All notable changes to this project are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
While the project is pre-1.0, the methodology spec may still change in
backward-incompatible ways between minor versions.

## [Unreleased]

### Added

- `requirements.txt` for reproducible documentation builds.
- Continuous-integration workflow that validates every pull request: runs the
  repo-hygiene guard and a strict docs build (no deploy).
- Scheduled external link checking (lychee) that opens a tracking issue when a
  link breaks — deliberately decoupled from the merge gate.
- Social cards (Open Graph / Twitter preview images), generated in CI.
- Issue forms (methodology change, documentation issue) and a pull-request
  template.
- `SECURITY.md` describing how to report security or privacy issues responsibly.
- This changelog.

### Changed

- The repo-hygiene guard (`scripts/check-spec.sh`) now permits the maintainer's
  name on legal pages (imprint, privacy) only, keeps internal filesystem paths
  forbidden everywhere, and ignores binary files in the language soft-check.
- The deploy workflow now runs the repo-hygiene guard and installs the
  image-processing dependencies required for social cards.

## [0.1.3] - 2026-06-16

### Added

- SEO improvements: enriched page title, author/robots/keywords meta tags,
  JSON-LD structured data, and Google Search Console verification.

## [0.1.2] - 2026-06-16

### Added

- Imprint and Privacy Policy pages, linked from the site footer.

## [0.1.1] - 2026-06-16

### Added

- Site branding, web analytics with a cookie-consent banner, and a Code of
  Conduct.

### Changed

- Hardened privacy handling for analytics.

## [0.1.0] - 2026-06-15

### Added

- Initial APRICORE methodology specification (framework, four phases,
  cross-cutting disciplines, and canonical output schema).
- Model-agnostic prompt library.
- Two worked examples (a vague ticket and a politically framed stakeholder
  request).
- README and contributing guide.
- MkDocs Material documentation site with a GitHub Pages deployment workflow.
- Repo-hygiene guard against leaked internal references.

[Unreleased]: https://github.com/sebastianmompour-coder/apricore/compare/v0.1.3...HEAD
[0.1.3]: https://github.com/sebastianmompour-coder/apricore/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/sebastianmompour-coder/apricore/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/sebastianmompour-coder/apricore/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/sebastianmompour-coder/apricore/releases/tag/v0.1.0
