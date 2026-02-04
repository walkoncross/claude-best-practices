# 常见问题 FAQ

## 配置相关

### Q: 全局配置和项目配置有什么区别？

**A:**
- **全局配置** (`~/.claude/CLAUDE.md`)：适用于所有项目的通用规则
- **项目配置** (`项目/.claude/CLAUDE.md`)：特定项目的自定义规则，会覆盖全局配置

### Q: 配置文件不生效怎么办？

**A:** 检查以下几点：
1. 文件路径是否正确：`ls -la ~/.claude/CLAUDE.md`
2. 文件编码是否为 UTF-8：`file -I ~/.claude/CLAUDE.md`
3. 文件权限是否可读：`chmod 644 ~/.claude/CLAUDE.md`
4. 重启 Claude Code

### Q: 如何验证配置是否正确？

**A:**
```bash
# 使用验证工具
./tools/validate-config.sh ~/.claude/CLAUDE.md

# 或手动测试
# 让 Claude 执行文件操作，观察是否使用 Read/Edit/Write 工具
```

## 使用相关

### Q: Claude 为什么不使用 rm 命令？

**A:** 为了安全，配置中禁止使用 `rm` 命令。删除文件时会使用 `mv` 移动到 `~/claude-temp` 归档目录，可以随时恢复。

### Q: 如何让 Claude 优先使用专用工具？

**A:** 在全局配置中已设置工具使用优先级。如果 Claude 仍使用 bash 命令，可以在提示中明确要求：
```
请使用 Read 工具读取文件，不要使用 cat 命令
```

### Q: 大文件处理很慢怎么办？

**A:** 配置中已设置大文件分段处理策略（1000 行/次）。如果仍然慢，可以：
1. 减小每次读取的行数
2. 只读取需要的部分
3. 使用 Grep 工具先定位关键位置

## 工作流相关

### Q: 如何配置 Git 提交规范？

**A:** 参考 `best-practices/git-workflow.md`，配置中已包含：
- Conventional Commits 格式
- 中英文提交信息模板
- Pre-commit hook 示例

### Q: 如何为不同项目类型配置？

**A:**
```bash
# 使用配置脚本
./tools/setup.sh --type frontend --project /path/to/project

# 或手动复制模板
cp configs/project/frontend.md your-project/.claude/CLAUDE.md
```

## 故障排查

### Q: Claude 提示权限不足

**A:**
```bash
# 检查文件权限
ls -la ~/.claude/CLAUDE.md

# 修复权限
chmod 644 ~/.claude/CLAUDE.md
```

### Q: 配置文件编码错误

**A:**
```bash
# 检查编码
file -I ~/.claude/CLAUDE.md

# 转换为 UTF-8
iconv -f GBK -t UTF-8 ~/.claude/CLAUDE.md > temp.md
mv temp.md ~/.claude/CLAUDE.md
```

### Q: 归档目录占用空间过大

**A:**
```bash
# 查看归档目录大小
du -sh ~/claude-temp

# 清理归档目录
rm -rf ~/claude-temp/*
# 或移动到其他位置
mv ~/claude-temp ~/claude-temp-backup-$(date +%Y%m%d)
mkdir ~/claude-temp
```

## 更多帮助

- 查看 [快速开始指南](quick-start.md)
- 浏览 [最佳实践](../best-practices/)
- 提交 Issue: https://github.com/your-username/claude-best-practices/issues
