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
- **pre-commit** — Git hooks (format, lint, type check, secret scan, workflow audit, dependency audit, tests)
- **GitHub Actions** — PR checks (same as pre-commit) with least-privilege permissions

## Project Structure

```
src/python_template/   # Package source
tests/                 # Tests
.github/workflows/     # CI (parallel lint / type-check / test / audit / secrets / workflow jobs)
.github/dependabot.yml # Weekly dependency + action updates
.github/zizmor.yml     # zizmor (GitHub Actions audit) config
.github/ISSUE_TEMPLATE/ # Bug report + feature request forms
CONTRIBUTING.md        # Contributor guide
AGENTS.md              # Instructions for AI coding agents (CLAUDE.md, GEMINI.md, .cursorrules symlink to it)
```
