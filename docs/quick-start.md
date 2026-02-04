# 快速开始指南

本指南帮助你在 5 分钟内配置好 Claude Code。

## 步骤 1：安装全局配置

### 中文环境

```bash
# 复制中文全局配置
cp configs/global/CLAUDE.md ~/.claude/CLAUDE.md
```

### 英文环境

```bash
# 复制英文全局配置
cp configs/global/CLAUDE.en.md ~/.claude/CLAUDE.md
```

## 步骤 2：验证配置

```bash
# 启动 Claude Code 并测试
claude

# 测试文件操作
# Claude 应该优先使用 Read/Edit/Write 工具而非 bash 命令
```

## 步骤 3：项目级配置（可选）

如果需要为特定项目定制配置：

```bash
# 在项目根目录创建配置
mkdir -p your-project/.claude
cp templates/CLAUDE.md your-project/.claude/CLAUDE.md

# 根据项目类型编辑配置
```

## 常见项目类型配置

- **前端项目**：参考 `configs/project/frontend.md`
- **后端项目**：参考 `configs/project/backend.md`
- **全栈项目**：参考 `configs/project/fullstack.md`
- **数据科学**：参考 `configs/project/data-science.md`

## 下一步

- 查看 [最佳实践](../best-practices/) 了解使用技巧
- 浏览 [使用场景](../examples/scenarios/) 学习实战案例
- 配置 [Hooks](../configs/hooks/) 实现自动化工作流

## 故障排查

### 配置未生效

1. 检查文件路径：`ls -la ~/.claude/CLAUDE.md`
2. 检查文件编码：`file -I ~/.claude/CLAUDE.md`（应为 UTF-8）
3. 重启 Claude Code

### 权限问题

```bash
# 确保配置文件可读
chmod 644 ~/.claude/CLAUDE.md
```

更多问题请查看 [FAQ](faq.md)。
