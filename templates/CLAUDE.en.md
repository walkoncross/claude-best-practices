# Project-Level Configuration Template

> Copy this file to your project's `.claude/CLAUDE.md` to customize project configuration

## Project Information

- **Project Name**: [Fill in project name]
- **Project Type**: [frontend/backend/fullstack/data-science]
- **Main Tech Stack**: [React/Vue/Python/Go/Java, etc.]

## Project-Specific Rules

### Code Style
- Follow ESLint/Prettier configuration in project
- Naming conventions: [Describe project naming conventions]
- Comment language: [Chinese/English]

### File Organization
```
src/
├── components/     # Components directory
├── utils/          # Utility functions
├── types/          # Type definitions
└── ...
```

### Common Commands
```bash
# Install dependencies
[npm install / pip install -r requirements.txt]

# Start development server
[npm run dev / python manage.py runserver]

# Run tests
[npm test / pytest]

# Lint
[npm run lint / flake8]
```

## Project Conventions

### Commit Standards
- Commit message language: [Chinese/English]
- Commit format: Follow Conventional Commits

### Branch Strategy
- Main branch: `main` / `master`
- Development branch: `develop`
- Feature branches: `feature/*`
- Fix branches: `bugfix/*`

### Code Review
- PRs must be reviewed
- Must pass CI/CD checks
- At least one approval required

## Special Notes

- [List project-specific considerations]
- [Example: Don't modify code in legacy/ directory]
- [Example: API calls must go through unified request wrapper]

---

*This configuration will override the same items in global configuration*
