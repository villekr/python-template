# AGENTS.md

Instructions for AI coding agents working in this repository. This is the single
source of truth; agent-specific files (`CLAUDE.md`, `.cursorrules`, etc.) are
symlinks to it, and Kiro loads it automatically.

## Tech & Workflow

Stack: Python >=3.14, uv (deps), ruff (lint+format), pytest (tests), pre-commit + GitHub Actions (CI).

- `uv sync --group dev` — install/refresh env
- `uv add <pkg>` / `uv add --group dev <pkg>` — add deps (never edit `pyproject.toml` deps by hand)
- `uv run pytest` — run tests
- `uv run ruff format` / `uv run ruff check --fix` — format + lint

Rules:
- Run everything through `uv run`; never call `python`/`pip` directly.
- Keep `uv.lock` committed and in sync with `pyproject.toml`.
- Match `line-length = 120` and the existing ruff rule set; don't loosen rules to pass lint.

## Structure

```
src/python_template/   # package source (src layout — import as python_template)
tests/                 # pytest tests, mirror source module names
.github/workflows/     # CI (mirrors pre-commit)
AGENTS.md               # this file — CLAUDE.md, GEMINI.md, .cursorrules, .github/copilot-instructions.md symlink to it
scripts/setup-once.sh   # one-time rename; deletes itself after use
```

- Source lives under `src/`; import via the package name, not relative path hacks.
- One test module per source module; name tests `test_<unit>_<behavior>`.
- New public modules get a matching test file before the change is considered done.
- Don't add top-level packages outside `src/`; keep the src layout intact.

## Engineering Conduct

Approach:
- Investigate before editing: read the relevant code; don't guess at APIs.
- Make the smallest change that fully solves the task. No unrequested refactors, abstractions, or defensive code.
- Prefer editing existing files over creating new ones. Create files only when the task requires it.
- If an approach fails twice, stop and diagnose the root cause before trying again.

Code:
- Type-hint public functions and return values. Prefer explicit over clever.
- Fail loudly: raise specific exceptions with context; don't swallow errors.
- No secrets, tokens, or credentials in code, tests, or commits.
- Validate external input; never build shell/SQL strings via interpolation.

## Verification (definition of done)

- `uv run ruff format` + `uv run ruff check` clean.
- `uv run pytest` green, with tests covering new behavior and edge cases.
- Remove temp/scratch files before finishing.

## Git

- Commit only when asked. Stage specific files, not `git add .`.
- No force-push, hard reset, or history rewrite without explicit approval.
- Don't push to `main` directly; use a branch + PR.

## Communication

- Be concise; results over explanations.
- Only create files when explicitly asked — no unsolicited docs, summaries, or extras.
