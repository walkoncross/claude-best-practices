#!/bin/bash
# Claude Code 快速配置脚本

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 打印函数
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${YELLOW}ℹ${NC} $1"
}

# 显示帮助信息
show_help() {
    cat << EOF
Claude Code 快速配置脚本

用法:
    ./setup.sh [选项]

选项:
    --type TYPE         项目类型 (frontend/backend/fullstack/data-science)
    --project PATH      项目路径
    --global            安装全局配置
    --lang LANG         语言 (zh/en)，默认 zh
    -h, --help          显示帮助信息

示例:
    # 安装中文全局配置
    ./setup.sh --global --lang zh

    # 为前端项目配置
    ./setup.sh --type frontend --project /path/to/project

    # 为后端项目配置（英文）
    ./setup.sh --type backend --project /path/to/project --lang en
EOF
}

# 默认值
PROJECT_TYPE=""
PROJECT_PATH=""
INSTALL_GLOBAL=false
LANG="zh"

# 解析参数
while [[ $# -gt 0 ]]; do
    case $1 in
        --type)
            PROJECT_TYPE="$2"
            shift 2
            ;;
        --project)
            PROJECT_PATH="$2"
            shift 2
            ;;
        --global)
            INSTALL_GLOBAL=true
            shift
            ;;
        --lang)
            LANG="$2"
            shift 2
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            print_error "未知选项: $1"
            show_help
            exit 1
            ;;
    esac
done

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

# 安装全局配置
install_global_config() {
    print_info "安装全局配置..."

    # 确保目录存在
    mkdir -p ~/.claude

    # 选择配置文件
    if [ "$LANG" = "en" ]; then
        CONFIG_FILE="$REPO_ROOT/configs/global/CLAUDE.en.md"
    else
        CONFIG_FILE="$REPO_ROOT/configs/global/CLAUDE.md"
    fi

    if [ ! -f "$CONFIG_FILE" ]; then
        print_error "配置文件不存在: $CONFIG_FILE"
        exit 1
    fi

    # 备份现有配置
    if [ -f ~/.claude/CLAUDE.md ]; then
        mv ~/.claude/CLAUDE.md ~/.claude/CLAUDE.md.bak
        print_info "已备份现有配置到 ~/.claude/CLAUDE.md.bak"
    fi

    # 复制配置
    cp "$CONFIG_FILE" ~/.claude/CLAUDE.md
    print_success "全局配置已安装到 ~/.claude/CLAUDE.md"
}

# 安装项目配置
install_project_config() {
    print_info "为项目配置 Claude Code..."

    if [ -z "$PROJECT_PATH" ]; then
        print_error "请指定项目路径 (--project)"
        exit 1
    fi

    if [ ! -d "$PROJECT_PATH" ]; then
        print_error "项目路径不存在: $PROJECT_PATH"
        exit 1
    fi

    # 创建 .claude 目录
    mkdir -p "$PROJECT_PATH/.claude"

    # 复制项目配置模板
    cp "$REPO_ROOT/templates/CLAUDE.md" "$PROJECT_PATH/.claude/CLAUDE.md"

    # 如果指定了项目类型，追加类型特定配置
    if [ -n "$PROJECT_TYPE" ]; then
        TYPE_CONFIG="$REPO_ROOT/configs/project/${PROJECT_TYPE}.md"
        if [ -f "$TYPE_CONFIG" ]; then
            echo "" >> "$PROJECT_PATH/.claude/CLAUDE.md"
            echo "---" >> "$PROJECT_PATH/.claude/CLAUDE.md"
            echo "" >> "$PROJECT_PATH/.claude/CLAUDE.md"
            cat "$TYPE_CONFIG" >> "$PROJECT_PATH/.claude/CLAUDE.md"
            print_success "已添加 $PROJECT_TYPE 项目特定配置"
        fi
    fi

    print_success "项目配置已创建: $PROJECT_PATH/.claude/CLAUDE.md"
    print_info "请编辑该文件以自定义项目配置"
}

# 主逻辑
main() {
    echo "Claude Code 配置工具"
    echo "===================="
    echo ""

    if [ "$INSTALL_GLOBAL" = true ]; then
        install_global_config
    fi

    if [ -n "$PROJECT_PATH" ]; then
        install_project_config
    fi

    if [ "$INSTALL_GLOBAL" = false ] && [ -z "$PROJECT_PATH" ]; then
        print_error "请指定 --global 或 --project"
        show_help
        exit 1
    fi

    echo ""
    print_success "配置完成！"
}

main
