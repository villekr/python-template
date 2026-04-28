# python-template

Python project template with modern defaults: uv, ruff, pytest, pre-commit, GitHub Actions.

## Getting Started

1. Create a new repo from this template (GitHub "Use this template" button)
2. Clone your new repo
3. Run the one-time setup to rename the package to match your project:

```bash
./scripts/setup-once.sh
```

4. Install dependencies and activate pre-commit hooks:

```bash
uv sync
uv run pre-commit install
```

## Commands

```bash
uv run pytest              # Run tests
uv run ruff format --check # Check formatting without changes
uv run ruff format         # Format code
uv run ruff check          # Lint
```

## Tools

- **uv** — Project and dependency management
- **ruff** — Linting and formatting
- **pytest** — Testing
- **pre-commit** — Git hooks (format check, lint, tests)
- **GitHub Actions** — PR checks (same as pre-commit)

## Project Structure

```
src/python_template/   # Package source
tests/                 # Tests
.github/workflows/     # CI
.kiro/steering/        # Kiro AI steering files
```
