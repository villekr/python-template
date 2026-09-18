# Contributing

Thanks for contributing! This project uses [uv](https://docs.astral.sh/uv/) for
dependency management and a set of quality/security gates that run in both
pre-commit and CI.

## Setup

```bash
uv sync --group dev
uv run pre-commit install
```

## Development workflow

Run everything through `uv run`; never call `python`/`pip` directly.

```bash
uv run ruff format         # Format
uv run ruff check --fix    # Lint (incl. bandit security rules)
uv run ty check            # Type check
uv run pytest              # Tests (with coverage; 100% gate)
uv run pip-audit           # Dependency vulnerability audit
```

Add dependencies with uv (this keeps `uv.lock` in sync); never edit the
`pyproject.toml` dependency tables by hand:

```bash
uv add <pkg>               # runtime dependency
uv add --group dev <pkg>   # dev/tooling dependency
```

## Before opening a PR

- All pre-commit hooks pass: `uv run pre-commit run --all-files`.
- Tests cover new behavior and edge cases; the 100% coverage gate holds.
- Keep the change focused — no unrelated refactors.
- Don't push to `main` directly; open a branch and a PR.

## Conventions

- Match `line-length = 120` and the existing ruff rule set; don't loosen rules
  to pass lint.
- Type-hint public functions and return values.
- One test module per source module; name tests `test_<unit>_<behavior>`.

See [AGENTS.md](AGENTS.md) for the full engineering conduct guidelines (these
also apply to human contributors).
