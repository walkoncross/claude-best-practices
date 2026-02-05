#!/bin/bash
# Claude Code 配置文件验证脚本

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

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${YELLOW}ℹ${NC} $1"
}

# 显示帮助信息
show_help() {
    cat << EOF
Claude Code 配置文件验证脚本

用法:
    ./validate-config.sh <config-file>

参数:
    config-file     配置文件路径（例如：~/.claude/CLAUDE.md）

示例:
    # 验证全局配置
    ./validate-config.sh ~/.claude/CLAUDE.md

    # 验证项目配置
    ./validate-config.sh /path/to/project/.claude/CLAUDE.md
EOF
}

# 验证计数器
ERRORS=0
WARNINGS=0

# 检查文件是否存在
check_file_exists() {
    local file="$1"

    if [ ! -f "$file" ]; then
        print_error "文件不存在: $file"
        ((ERRORS++))
        return 1
    fi

    print_success "文件存在"
    return 0
}

# 检查文件编码
check_encoding() {
    local file="$1"

    # 使用 file 命令检查编码
    local encoding=$(file -I "$file" | grep -o "charset=[^ ]*" | cut -d= -f2)

    if [[ "$encoding" =~ ^(utf-8|us-ascii)$ ]]; then
        print_success "文件编码正确: $encoding"
    else
        print_error "文件编码不正确: $encoding (应为 utf-8)"
        ((ERRORS++))
    fi
}

# 检查文件权限
check_permissions() {
    local file="$1"

    # 获取文件权限（八进制）
    local perms=$(stat -f "%Lp" "$file" 2>/dev/null || stat -c "%a" "$file" 2>/dev/null)

    if [ "$perms" = "644" ] || [ "$perms" = "664" ] || [ "$perms" = "600" ]; then
        print_success "文件权限正确: $perms"
    else
        print_warning "文件权限: $perms (建议: 644)"
        ((WARNINGS++))
    fi
}

# 检查文件大小
check_file_size() {
    local file="$1"

    # 获取文件大小（字节）
    local size=$(wc -c < "$file" | tr -d ' ')
    local size_kb=$((size / 1024))

    if [ $size_kb -gt 500 ]; then
        print_warning "文件较大: ${size_kb}KB (建议小于 500KB)"
        ((WARNINGS++))
    else
        print_success "文件大小合适: ${size_kb}KB"
    fi
}

# 检查 Markdown 格式
check_markdown_format() {
    local file="$1"

    # 检查是否有标题
    if ! grep -q "^#" "$file"; then
        print_error "文件缺少 Markdown 标题"
        ((ERRORS++))
    else
        print_success "包含 Markdown 标题"
    fi

    # 检查是否有代码块
    if grep -q '```' "$file"; then
        print_success "包含代码块"
    fi
}

# 检查必要的章节（针对 CLAUDE.md）
check_required_sections() {
    local file="$1"
    local filename=$(basename "$file")

    # 只对 CLAUDE.md 文件进行章节检查
    if [[ "$filename" != "CLAUDE.md" ]]; then
        return 0
    fi

    print_info "检查必要章节..."

    local required_sections=(
        "文件操作"
        "工具使用"
        "最佳实践"
    )

    for section in "${required_sections[@]}"; do
        if grep -qi "$section" "$file"; then
            print_success "包含章节: $section"
        else
            print_warning "可能缺少章节: $section"
            ((WARNINGS++))
        fi
    done
}

# 主函数
main() {
    echo "Claude Code 配置文件验证工具"
    echo "=============================="
    echo ""

    # 检查参数
    if [ $# -eq 0 ]; then
        print_error "请指定配置文件路径"
        echo ""
        show_help
        exit 1
    fi

    if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        show_help
        exit 0
    fi

    local config_file="$1"

    # 展开 ~ 路径
    config_file="${config_file/#\~/$HOME}"

    echo "验证配置文件: $config_file"
    echo ""

    # 执行检查
    if check_file_exists "$config_file"; then
        check_encoding "$config_file"
        check_permissions "$config_file"
        check_file_size "$config_file"
        check_markdown_format "$config_file"
        check_required_sections "$config_file"
    fi

    # 输出结果
    echo ""
    echo "=============================="
    if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
        print_success "验证通过！配置文件完全正常。"
        exit 0
    elif [ $ERRORS -eq 0 ]; then
        print_warning "验证完成，有 $WARNINGS 个警告。"
        exit 0
    else
        print_error "验证失败，有 $ERRORS 个错误和 $WARNINGS 个警告。"
        exit 1
    fi
}

main "$@"
