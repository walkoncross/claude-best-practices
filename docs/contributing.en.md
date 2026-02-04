# Contributing Guide

Thank you for your interest in this project! We welcome all forms of contributions.

## How to Contribute

### Report Issues

If you find a bug or have a feature suggestion:

1. Check if it already exists in [Issues](https://github.com/your-username/claude-best-practices/issues)
2. If not, create a new Issue
3. Clearly describe the problem or suggestion
4. Provide reproduction steps (if it's a bug)

### Submit Code

1. **Fork this repository**
2. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make changes**
4. **Commit changes**
   ```bash
   git commit -m "feat: add your feature"
   ```
5. **Push to Fork**
   ```bash
   git push origin feature/your-feature-name
   ```
6. **Create Pull Request**

## Contribution Types

### 1. Configuration Templates
- New project type configurations
- Scenario-specific configuration examples
- Multi-language configuration translations

### 2. Best Practices Documentation
- Usage tips and experience summaries
- Common problem solutions
- Performance optimization suggestions

### 3. Usage Scenario Examples
- Real-world project application cases
- Prompt templates
- Workflow examples

### 4. Tool Scripts
- Configuration validation tools
- Automation scripts
- Utility tools

## Documentation Standards

### File Naming
- Use lowercase letters and hyphens: `file-name.md`
- English filenames, content can be in any language
- Language suffix: `.en.md` for English, `.md` for Chinese

### Markdown Format
- Use standard Markdown syntax
- Specify language for code blocks
- Add table of contents (for 3+ sections)

### Example Format
```markdown
# Title

## Section 1

Content...

### Subsection

Content...
```

## Bilingual Contribution Guidelines

### When Updating Chinese Documents
1. Update `filename.md`
2. Synchronize `filename.en.md` (or mark TODO)
3. Indicate in PR whether English version is synchronized

### Translation Contributions
- Can submit English translation PRs separately
- Use `.en.md` suffix for filenames
- Maintain consistency with original content structure

## Commit Standards

Follow Conventional Commits:

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type Categories
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Formatting
- `refactor`: Refactoring
- `test`: Testing
- `chore`: Build/tools

### Examples
```bash
docs(best-practices): add debugging tips documentation
feat(config): add Rust project configuration template
fix(tools): fix setup.sh path issue
```

## Code Review

All PRs require:
- Pass automated checks
- At least one maintainer review
- Resolve all comments

## Code of Conduct

- Respect others
- Constructive feedback
- Embrace diverse perspectives
- Focus on project goals

## License

Contributions will be licensed under MIT License.

## Contact

- Issue: https://github.com/your-username/claude-best-practices/issues
- Email: your-email@example.com

Thank you for your contribution!
