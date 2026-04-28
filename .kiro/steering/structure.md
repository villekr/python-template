---
inclusion: always
---

# Project Structure

```
├── src/
│   └── python_template/    # Main package (src layout)
│       ├── __init__.py
│       └── main.py
├── tests/                  # Test files
│   ├── __init__.py
│   └── test_main.py
├── .github/workflows/      # CI/CD
│   └── pr.yml
├── .kiro/steering/         # Kiro steering files
├── .pre-commit-config.yaml
├── pyproject.toml
└── .python-version
```

## Conventions
- src/ layout for package code
- Tests mirror source structure in tests/
- All config in pyproject.toml where possible
