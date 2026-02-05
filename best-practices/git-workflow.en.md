# Git Workflow Best Practices

## Pre-Commit Checklist

### 1. Check Status
```bash
# View untracked and modified files
git status

# View specific changes
git diff
git diff --staged
```

### 2. Analyze Changes
- Confirm all changes are expected
- Check for sensitive information
- Verify code quality

### 3. Stage Files
```bash
# ✅ Recommended: Specify files explicitly
git add src/components/Button.tsx
git add src/utils/helper.ts

# ⚠️ Use with caution: Stage all files
git add .
```

### 4. Write Commit Message
```bash
git commit -m "$(cat <<'EOF'
feat(auth): add user login functionality

- Implement JWT authentication
- Add login form validation
- Integrate OAuth 2.0

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
EOF
)"
```

## Commit Message Format

### Format
```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type Categories
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation update
- `refactor`: Code refactoring
- `test`: Test related
- `chore`: Build/tool changes
- `style`: Code formatting (no functional change)
- `perf`: Performance optimization

### Examples
```bash
# Simple commit
feat(api): add user query endpoint

# Detailed commit
fix(auth): fix login timeout issue

Users experience timeout on slow networks, now added retry mechanism.

- Add exponential backoff retry
- Increase timeout from 5s to 15s
- Add error notification

Closes #123
```

## Branch Management Strategy

### Branch Naming
```bash
# Feature branches
feature/user-authentication
feature/payment-integration

# Bug fixes
bugfix/login-timeout
bugfix/memory-leak

# Hotfixes
hotfix/security-patch
hotfix/critical-bug
```

### Workflow
```bash
# 1. Create new branch
git checkout -b feature/new-feature

# 2. Develop and commit
git add .
git commit -m "feat: implement new feature"

# 3. Push to remote
git push -u origin feature/new-feature

# 4. Create Pull Request
gh pr create --title "Add new feature" --body "Description"
```

## Safety Rules

### Prohibited Operations
```bash
# ❌ Force push to main branch
git push --force origin main

# ❌ Hard reset (loses commits)
git reset --hard HEAD~1

# ❌ Skip hooks
git commit --no-verify
```

### Recommended Operations
```bash
# ✅ Amend recent commit
git commit --amend

# ✅ Soft reset (keeps changes)
git reset --soft HEAD~1

# ✅ Create new commit instead of modifying history
git revert <commit-hash>
```

## Common Scenarios

### Scenario 1: Committed wrong file
```bash
# Remove from staging area
git reset HEAD sensitive-file.txt

# Remove from recent commit
git rm --cached sensitive-file.txt
git commit --amend
```

### Scenario 2: Wrong commit message
```bash
# Modify recent commit message
git commit --amend -m "Correct commit message"
```

### Scenario 3: Merge multiple commits
```bash
# Interactive rebase (merge last 3 commits)
git rebase -i HEAD~3
```

### Scenario 4: Pre-commit hook failed
```bash
# ❌ Wrong approach: Skip hook
git commit --no-verify

# ✅ Correct approach: Fix issue then commit again
# 1. Fix lint errors
npm run lint --fix

# 2. Re-stage
git add .

# 3. Create new commit (not amend)
git commit -m "fix: resolve lint errors"
```

## Checklist

Before committing:
- [ ] Ran `git status` and `git diff`
- [ ] No sensitive information (keys, passwords, etc.)
- [ ] Commit message clearly describes changes
- [ ] Code passes lint and tests
- [ ] Only committing relevant files
