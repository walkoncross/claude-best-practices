# 安装配置指南

## 系统要求

- Claude Code CLI 已安装
- Bash shell（macOS/Linux）或 Git Bash（Windows）
- Git（用于版本控制）

## 安装步骤

### 1. 克隆仓库

```bash
git clone https://github.com/your-username/claude-best-practices.git
cd claude-best-practices
```

### 2. 安装全局配置

#### 中文环境

```bash
./tools/setup.sh --global --lang zh
```

#### 英文环境

```bash
./tools/setup.sh --global --lang en
```

### 3. 验证安装

```bash
# 检查配置文件是否存在
ls -la ~/.claude/CLAUDE.md

# 检查文件编码
file -I ~/.claude/CLAUDE.md
```

### 4. 项目级配置（可选）

```bash
# 为现有项目添加配置
./tools/setup.sh --type frontend --project /path/to/your-project
```

## 手动安装

如果自动脚本不可用，可以手动安装：

```bash
# 创建配置目录
mkdir -p ~/.claude

# 复制配置文件
cp configs/global/CLAUDE.md ~/.claude/CLAUDE.md

# 确保文件权限正确
chmod 644 ~/.claude/CLAUDE.md
```

## 更新配置

```bash
# 拉取最新版本
git pull origin main

# 重新安装
./tools/setup.sh --global --lang zh
```

## 卸载

```bash
# 删除全局配置
rm ~/.claude/CLAUDE.md

# 恢复备份（如果有）
mv ~/.claude/CLAUDE.md.bak ~/.claude/CLAUDE.md
```

## 故障排查

参考 [FAQ 文档](faq.md) 获取常见问题的解决方案。
