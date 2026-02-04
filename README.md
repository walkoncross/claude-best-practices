# Claude Code 最佳实践与配置管理

> 收集和管理 Claude Code 使用过程中的配置项、最佳实践和使用技巧

[English](#english) | [中文](#中文)

---

## 中文

### 📖 项目简介

本仓库旨在为 Claude Code 用户提供：
- **全局配置模板**：适用于不同语言环境的全局配置
- **项目配置示例**：针对不同项目类型的配置方案
- **最佳实践文档**：文件操作、Git 工作流、安全规范等
- **使用场景示例**：常见开发场景的实战案例
- **Hooks 配置**：自动化工作流配置示例

### 🚀 快速开始

#### 1. 安装全局配置

**中文环境：**
```bash
# 复制全局配置到 Claude 配置目录
cp configs/global/CLAUDE.md ~/.claude/CLAUDE.md
```

**英文环境：**
```bash
# Copy global config to Claude config directory
cp configs/global/CLAUDE.en.md ~/.claude/CLAUDE.md
```

#### 2. 项目级配置

根据项目类型选择合适的配置模板：

```bash
# 前端项目
cp templates/CLAUDE.md your-project/.claude/CLAUDE.md

# 或使用快速配置脚本
./tools/setup.sh --type frontend --project /path/to/your-project
```

#### 3. 验证配置

```bash
# 验证配置文件格式
./tools/validate-config.sh ~/.claude/CLAUDE.md
```

### 📂 目录结构

```
├── configs/              # 配置文件
│   ├── global/          # 全局配置（中英文）
│   ├── project/         # 项目级配置模板
│   └── hooks/           # Hooks 配置示例
├── best-practices/      # 最佳实践文档
├── examples/            # 使用场景和提示词示例
├── templates/           # 配置模板
├── tools/               # 辅助工具脚本
└── docs/                # 详细文档
```

### 📚 文档导航

- [快速开始指南](docs/quick-start.md)
- [安装配置](docs/installation.md)
- [常见问题](docs/faq.md)
- [贡献指南](docs/contributing.md)

### 🎯 最佳实践

- [文件操作最佳实践](best-practices/file-operations.md)
- [Git 工作流](best-practices/git-workflow.md)
- [安全规范](best-practices/security.md)
- [调试技巧](best-practices/debugging.md)

### 💡 使用场景

- [代码重构](examples/scenarios/refactoring.md)
- [Bug 修复](examples/scenarios/bug-fixing.md)
- [功能开发](examples/scenarios/feature-development.md)
- [代码审查](examples/scenarios/code-review.md)

### 🤝 贡献

欢迎提交 Issue 和 Pull Request！请查看 [贡献指南](docs/contributing.md)。

### 📝 更新日志

查看 [CHANGELOG.md](CHANGELOG.md) 了解版本变更。

### 📄 许可证

MIT License

---

## English

### 📖 About

This repository provides Claude Code users with:
- **Global configuration templates** for different language environments
- **Project-specific configuration examples** for various project types
- **Best practices documentation** for file operations, Git workflows, security, etc.
- **Usage scenario examples** with real-world cases
- **Hooks configuration** for workflow automation

### 🚀 Quick Start

#### 1. Install Global Configuration

```bash
# Copy global config to Claude config directory
cp configs/global/CLAUDE.en.md ~/.claude/CLAUDE.md
```

#### 2. Project Configuration

Choose the appropriate template for your project type:

```bash
# Frontend project
cp templates/CLAUDE.md your-project/.claude/CLAUDE.md

# Or use the setup script
./tools/setup.sh --type frontend --project /path/to/your-project
```

#### 3. Validate Configuration

```bash
# Validate config file format
./tools/validate-config.sh ~/.claude/CLAUDE.md
```

### 📂 Directory Structure

```
├── configs/              # Configuration files
│   ├── global/          # Global configs (multilingual)
│   ├── project/         # Project-level config templates
│   └── hooks/           # Hooks configuration examples
├── best-practices/      # Best practices documentation
├── examples/            # Usage scenarios and prompt templates
├── templates/           # Configuration templates
├── tools/               # Utility scripts
└── docs/                # Detailed documentation
```

### 📚 Documentation

- [Quick Start Guide](docs/quick-start.md)
- [Installation](docs/installation.md)
- [FAQ](docs/faq.md)
- [Contributing Guide](docs/contributing.md)

### 🤝 Contributing

Issues and Pull Requests are welcome! Please see [Contributing Guide](docs/contributing.md).

### 📝 Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.

### 📄 License

MIT License
