# Claude Usage Guidelines v1.0

> Global configuration for Claude Code in English environment
> Last updated: 2026-02-04

## 📑 Table of Contents

1. [Communication Guidelines](#communication-guidelines)
2. [Tool Usage Priority](#tool-usage-priority)
3. [File Operation Safety Rules](#file-operation-safety-rules)
4. [Git Operation Guidelines](#git-operation-guidelines)
5. [Project Types & Environment](#project-types--environment)
6. [Error Handling & Debugging](#error-handling--debugging)
7. [Security & Privacy Guidelines](#security--privacy-guidelines)
8. [Best Practices](#best-practices)

---

## Communication Guidelines

### Response Style
- **Concise and clear**: Provide direct solutions without lengthy explanations
- **Technical accuracy**: Prioritize correctness over validation
- **Code comments**: Add comments for complex logic
- **Progress feedback**: Communicate current step for complex operations

### Emoji Usage
- **Default disabled**: Do not use emojis unless explicitly requested
- **Exceptions**: Document titles and critical warnings may use emojis moderately

---

## Tool Usage Priority

### File Operations
1. **Read files**: Use `Read` tool, avoid `cat`/`head`/`tail`
2. **Edit files**: Use `Edit` tool, avoid `sed`/`awk`
3. **Create files**: Use `Write` tool, avoid `echo` redirection
4. **Search files**: Use `Glob` tool (pattern matching) or `Grep` tool (content search)

### Code Exploration
- **Project structure**: Use `Task` tool (subagent_type=Explore)
- **Specific files**: Use `Read` or `Glob` for direct location
- **Keyword search**: Use `Grep` tool, avoid bash grep command

### Parallel Execution
- **Independent operations**: Execute multiple tool calls in parallel within single response
- **Dependent operations**: Execute sequentially, never use placeholders

---

## File Operation Safety Rules

### 🚫 Strictly Prohibited
- **Never use `rm` command**: Do not use `rm` or `rm -rf` under any circumstances

### ✅ Recommended Practices
- **File deletion**: Use `mv` command to move files to archive directory `~/claude-temp`
  ```bash
  # Example: mv unwanted_file.txt ~/claude-temp/
  ```
- **Archive directory**: Ensure `~/claude-temp` exists for temporarily storing "deleted" files

### 🔧 Bash Command Usage Guidelines
- **Strictly prohibited**: Never use `rm` or `rm -rf` commands
- **Prioritize specialized tools**: Use Read/Edit/Write/Glob/Grep tools for file operations
- **Applicable scenarios**: Bash tool only for:
  - Git operations (`git status`, `git commit`, etc.)
  - Package management (`npm install`, `pip install`, etc.)
  - System commands (`ls`, `wc`, `file`, etc.)
  - Project build and testing (`npm run build`, `pytest`, etc.)
- **No communication**: Do not use `echo` to communicate with users, output text directly

### 📋 File Permission Settings
- **Default permissions**: New files default to `644` (owner read/write, others read-only)
- **Sensitive files**: Files with keys should be `600` (owner read/write only)
- **Executable files**: Use `chmod +x` for scripts requiring execution
- **Permission adjustment**: Adjust as needed, follow principle of least privilege

### 📝 File Encoding Standards
- **Default encoding**: All text files must use UTF-8 encoding (without BOM)
- **Verification**: Use `file -I <filename>` to verify encoding after creation/modification
- **Encoding conversion**: Use `iconv -f <source-encoding> -t UTF-8 <file>` if needed

---

## Git Operation Guidelines

### Commit Message Format
- **Format**: `<type>(<scope>): <subject>`
- **Types**:
  - `feat`: New feature
  - `fix`: Bug fix
  - `docs`: Documentation update
  - `refactor`: Code refactoring
  - `test`: Test related
  - `chore`: Build/tool changes
- **Language**: Use English, keep concise (under 50 characters)
- **Examples**:
  ```bash
  feat(auth): add user login functionality
  fix(api): resolve data query timeout issue
  docs(readme): update installation instructions
  ```

### Branch Management
- **Naming convention**:
  - `feature/feature-name`: New feature development
  - `bugfix/issue-description`: Bug fixes
  - `hotfix/urgent-fix`: Production emergency fixes
- **Main branch protection**: Do not push directly to main/master branch
- **Pre-commit check**: Run `git status` and `git diff` to confirm changes

### Safety Rules
- **Prohibited operations**:
  - Do not use `git push --force` to main branch
  - Do not use `git reset --hard` unless explicitly needed
  - Do not skip hooks (`--no-verify`) unless user explicitly requests
- **Sensitive files**: Do not commit `.env`, `credentials.json`, or files with sensitive information

---

## Project Types & Environment

### Auto-detection Rules
- **Frontend projects**: Detect `package.json`, `tsconfig.json`, `vite.config.js`
- **Python projects**: Detect `requirements.txt`, `pyproject.toml`, `setup.py`
- **Go projects**: Detect `go.mod`, `go.sum`
- **Java projects**: Detect `pom.xml`, `build.gradle`
- **Rust projects**: Detect `Cargo.toml`

### Environment Configuration Check
- **Dependency installation**: Confirm dependencies are installed before operations
- **Environment variables**: Use `.env` file for sensitive info, do not commit to version control
- **Configuration priority**: Local config > Project config > Global config > Default config

---

## Error Handling & Debugging

### Error Analysis Process
1. **Locate issue**: Use `Grep` tool to search error messages
2. **Check logs**: Read relevant log files
3. **Reproduce issue**: Confirm trigger conditions
4. **Provide solutions**: Offer 2-3 solutions with pros/cons

### Debugging Strategy
- **Incremental testing**: Verify immediately after modifications
- **Rollback mechanism**: Backup or create Git branch before important changes
- **Log output**: Add necessary logs for future troubleshooting
- **Avoid over-engineering**: Only modify necessary parts, no unrelated "optimizations"

---

## Security & Privacy Guidelines

### Sensitive Information Handling
- **Never record**: API keys, passwords, tokens, or sensitive information
- **Configuration files**: Do not commit `.env`, `credentials.json` to repository
- **Data masking**: Replace sensitive data in logs with `***`

### Code Security
- **Input validation**: Prevent SQL injection, XSS, command injection, and OWASP Top 10 vulnerabilities
- **Dependency check**: Use known secure libraries and versions
- **Minimize permissions**: Follow principle of least privilege for file permissions (default 644)
- **Immediate fix**: Fix security vulnerabilities immediately upon discovery

---

## Best Practices

### File Operations
1. **Confirm before action**: Use `Read` tool to confirm target file content before operations
2. **Keep backups**: Copy important files to `~/claude-temp` before modifications
3. **Clean archive**: Manually check and clean `~/claude-temp` directory regularly
4. **Path validation**: Ensure correct paths when using absolute paths

### Large File Handling
- **Unified threshold**: Must process in segments for files over 1000 lines or 100KB
- **Read strategy**: Use `Read` tool's `offset` and `limit` parameters, max 1000 lines per batch
- **Write strategy**: Use `Edit` tool for segment modifications, max 1000 lines per modification
- **Verification check**: Use `wc -l` or `ls -lh` to confirm file size before segmented operations

### Code Modification Principles
- **Minimize changes**: Only modify necessary parts, avoid over-engineering
- **Maintain consistency**: Follow existing code style and architecture patterns
- **Read before write**: Must use `Read` tool before modifying files
- **Avoid redundancy**: Do not add unused features, comments, or abstraction layers

### Task Execution
- **Parallel priority**: Execute independent tasks in parallel within single response
- **Incremental verification**: Test and verify immediately after each modification
- **Clear feedback**: Communicate current progress and next steps for complex operations

---

*Follow these guidelines to ensure file safety, improve work efficiency, and avoid accidental data loss*
