# 工具使用说明

本目录包含用于配置和管理 Claude Code 的辅助工具。

## setup.sh

快速配置脚本，用于安装全局配置或项目配置。

### 使用方法

```bash
# 安装中文全局配置
./tools/setup.sh --global --lang zh

# 安装英文全局配置
./tools/setup.sh --global --lang en

# 为前端项目配置
./tools/setup.sh --type frontend --project /path/to/project

# 为后端项目配置（英文）
./tools/setup.sh --type backend --project /path/to/project --lang en
```

### 参数说明

- `--global`: 安装全局配置到 `~/.claude/CLAUDE.md`
- `--type TYPE`: 项目类型（frontend/backend/fullstack/data-science）
- `--project PATH`: 项目路径
- `--lang LANG`: 语言（zh/en），默认 zh
- `-h, --help`: 显示帮助信息

## validate-config.sh

配置验证工具（待实现）

用于验证配置文件格式是否正确。

```bash
./tools/validate-config.sh ~/.claude/CLAUDE.md
```

## 开发新工具

欢迎贡献新的工具脚本！请遵循以下规范：

1. 使用 bash 编写
2. 添加详细的注释
3. 提供 `--help` 选项
4. 错误处理完善
5. 更新本文档
