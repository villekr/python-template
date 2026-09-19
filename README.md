# python-template

[![PR Checks](https://github.com/villekr/python-template/actions/workflows/pr.yml/badge.svg)](https://github.com/villekr/python-template/actions/workflows/pr.yml)

Python project template with modern defaults: uv, ruff, ty, pytest, pip-audit, gitleaks, zizmor, pre-commit, GitHub Actions.

## Getting Started

1. Create a new repo from this template (GitHub "Use this template" button)
2. Clone your new repo
3. Run the one-time setup to rename the package to match your project:

```bash
./scripts/setup-once.sh
```

4. Install dependencies and activate pre-commit hooks:

```bash
uv sync --group dev
uv run pre-commit install
```

## Commands

```bash
uv run pytest              # Run tests (with coverage; 100% gate)
uv run ruff format --check # Check formatting without changes
uv run ruff format         # Format code
uv run ruff check          # Lint (incl. bandit security rules)
uv run ty check            # Type check
uv run pip-audit           # Audit dependencies for known vulnerabilities
```

## Tools

- **uv** — Project and dependency management
- **ruff** — Linting (incl. bandit security rules) and formatting
- **ty** — Type checking
- **pytest** — Testing (with coverage via pytest-cov; 100% gate)
- **pip-audit** — Dependency vulnerability auditing
- **gitleaks** — Secret scanning
- **zizmor** — GitHub Actions workflow security auditing
- **CycloneDX** — SBOM generation (CI artifact, from the synced environment)
- **OpenSSF Scorecard** — Supply-chain posture scoring (scheduled + on push to main)
- **pre-commit** — Git hooks (format, lint, type check, secret scan, workflow audit, dependency audit, tests)
- **GitHub Actions** — PR checks (same as pre-commit) with least-privilege permissions

## Profiling & Benchmarking (opt-in)

**Decision:** no performance tooling ships as a default dependency. A generic
template can't know the target workload, so a benchmark suite or profiler choice
would be premature and add dev-dependency weight (and CI time) with no signal on
a "hello world" package. Adopt these per project, on demand:

```bash
# Ad-hoc sampling profiler — attach to a running process, no code changes.
uv run --with py-spy py-spy top -- python -m python_template

# CPU + memory profiler with line-level attribution (deeper investigations).
uv run --with scalene scalene -m python_template

# Deterministic per-line timing for a hot function (decorate with @profile).
uv run --with line_profiler kernprof -lv your_script.py

# Microbenchmarks in the test suite — add as a dev dependency when adopting.
uv add --group dev pytest-benchmark
```

Guidance: reach for `py-spy` first (zero-instrumentation), `scalene` for
CPU/memory attribution, `line_profiler` for pinpoint per-line timing, and adopt
`pytest-benchmark` only once there are perf-sensitive paths worth guarding
against regressions.

## Project Structure

```
src/python_template/   # Package source
tests/                 # Tests
.github/workflows/     # CI (parallel lint / type-check / test / audit / secrets / workflow / SBOM jobs) + OpenSSF Scorecard
.github/dependabot.yml # Weekly dependency + action updates
.github/zizmor.yml     # zizmor (GitHub Actions audit) config
.github/ISSUE_TEMPLATE/ # Bug report + feature request forms
CONTRIBUTING.md        # Contributor guide
SECURITY.md            # Vulnerability disclosure policy
AGENTS.md              # Instructions for AI coding agents (CLAUDE.md, GEMINI.md, .cursorrules are pointer files to it)
```
