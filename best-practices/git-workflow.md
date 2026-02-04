# Git 工作流最佳实践

## 提交前检查流程

### 1. 查看状态
```bash
# 查看未跟踪和修改的文件
git status

# 查看具体改动
git diff
git diff --staged
```

### 2. 分析变更
- 确认所有改动都是预期的
- 检查是否包含敏感信息
- 验证代码质量

### 3. 暂存文件
```bash
# ✅ 推荐：指定具体文件
git add src/components/Button.tsx
git add src/utils/helper.ts

# ⚠️ 谨慎使用：暂存所有文件
git add .
```

### 4. 编写提交信息
```bash
git commit -m "$(cat <<'EOF'
feat(auth): 添加用户登录功能

- 实现 JWT 认证
- 添加登录表单验证
- 集成 OAuth 2.0

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
EOF
)"
```

## 提交信息规范

### 格式
```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type 类型
- `feat`: 新功能
- `fix`: Bug 修复
- `docs`: 文档更新
- `refactor`: 代码重构
- `test`: 测试相关
- `chore`: 构建/工具变动
- `style`: 代码格式（不影响功能）
- `perf`: 性能优化

### 示例
```bash
# 简单提交
feat(api): 添加用户查询接口

# 详细提交
fix(auth): 修复登录超时问题

用户在网络较慢时登录会超时，现在增加了重试机制。

- 添加指数退避重试
- 超时时间从 5s 增加到 15s
- 添加错误提示

Closes #123
```

## 分支管理策略

### 分支命名
```bash
# 功能分支
feature/user-authentication
feature/payment-integration

# Bug 修复
bugfix/login-timeout
bugfix/memory-leak

# 紧急修复
hotfix/security-patch
hotfix/critical-bug
```

### 工作流程
```bash
# 1. 创建新分支
git checkout -b feature/new-feature

# 2. 开发并提交
git add .
git commit -m "feat: implement new feature"

# 3. 推送到远程
git push -u origin feature/new-feature

# 4. 创建 Pull Request
gh pr create --title "Add new feature" --body "Description"
```

## 安全规则

### 禁止操作
```bash
# ❌ 强制推送到主分支
git push --force origin main

# ❌ 硬重置（会丢失提交）
git reset --hard HEAD~1

# ❌ 跳过 hooks
git commit --no-verify
```

### 推荐操作
```bash
# ✅ 修改最近的提交
git commit --amend

# ✅ 软重置（保留改动）
git reset --soft HEAD~1

# ✅ 创建新提交而非修改历史
git revert <commit-hash>
```

## 常见场景处理

### 场景 1：提交了错误的文件
```bash
# 从暂存区移除
git reset HEAD sensitive-file.txt

# 从最近提交中移除
git rm --cached sensitive-file.txt
git commit --amend
```

### 场景 2：提交信息写错
```bash
# 修改最近的提交信息
git commit --amend -m "正确的提交信息"
```

### 场景 3：需要合并多个提交
```bash
# 交互式 rebase（合并最近 3 个提交）
git rebase -i HEAD~3
```

### 场景 4：Pre-commit hook 失败
```bash
# ❌ 错误做法：跳过 hook
git commit --no-verify

# ✅ 正确做法：修复问题后重新提交
# 1. 修复 lint 错误
npm run lint --fix

# 2. 重新暂存
git add .

# 3. 创建新提交（不是 amend）
git commit -m "fix: resolve lint errors"
```

## 检查清单

提交前确认：
- [ ] 运行了 `git status` 和 `git diff`
- [ ] 没有包含敏感信息（密钥、密码等）
- [ ] 提交信息清晰描述了改动
- [ ] 代码通过了 lint 和测试
- [ ] 只提交相关的文件
