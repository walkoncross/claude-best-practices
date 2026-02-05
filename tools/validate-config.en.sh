#!/bin/bash
# Claude Code Configuration File Validation Script

set -e

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Print functions
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

# Show help information
show_help() {
    cat << EOF
Claude Code Configuration File Validation Script

Usage:
    ./validate-config.en.sh <config-file>

Arguments:
    config-file     Configuration file path (e.g., ~/.claude/CLAUDE.md)

Examples:
    # Validate global configuration
    ./validate-config.en.sh ~/.claude/CLAUDE.md

    # Validate project configuration
    ./validate-config.en.sh /path/to/project/.claude/CLAUDE.md
EOF
}

# Validation counters
ERRORS=0
WARNINGS=0

# Check if file exists
check_file_exists() {
    local file="$1"

    if [ ! -f "$file" ]; then
        print_error "File does not exist: $file"
        ((ERRORS++))
        return 1
    fi

    print_success "File exists"
    return 0
}

# Check file encoding
check_encoding() {
    local file="$1"

    # Use file command to check encoding
    local encoding=$(file -I "$file" | grep -o "charset=[^ ]*" | cut -d= -f2)

    if [[ "$encoding" =~ ^(utf-8|us-ascii)$ ]]; then
        print_success "File encoding correct: $encoding"
    else
        print_error "File encoding incorrect: $encoding (should be utf-8)"
        ((ERRORS++))
    fi
}

# Check file permissions
check_permissions() {
    local file="$1"

    # Get file permissions (octal)
    local perms=$(stat -f "%Lp" "$file" 2>/dev/null || stat -c "%a" "$file" 2>/dev/null)

    if [ "$perms" = "644" ] || [ "$perms" = "664" ] || [ "$perms" = "600" ]; then
        print_success "File permissions correct: $perms"
    else
        print_warning "File permissions: $perms (recommended: 644)"
        ((WARNINGS++))
    fi
}

# Check file size
check_file_size() {
    local file="$1"

    # Get file size (bytes)
    local size=$(wc -c < "$file" | tr -d ' ')
    local size_kb=$((size / 1024))

    if [ $size_kb -gt 500 ]; then
        print_warning "File is large: ${size_kb}KB (recommended < 500KB)"
        ((WARNINGS++))
    else
        print_success "File size appropriate: ${size_kb}KB"
    fi
}

# Check Markdown format
check_markdown_format() {
    local file="$1"

    # Check for headings
    if ! grep -q "^#" "$file"; then
        print_error "File missing Markdown headings"
        ((ERRORS++))
    else
        print_success "Contains Markdown headings"
    fi

    # Check for code blocks
    if grep -q '```' "$file"; then
        print_success "Contains code blocks"
    fi
}

# Check required sections (for CLAUDE.md files)
check_required_sections() {
    local file="$1"
    local filename=$(basename "$file")

    # Only check sections for CLAUDE.md files
    if [[ "$filename" != "CLAUDE.md" ]]; then
        return 0
    fi

    print_info "Checking required sections..."

    local required_sections=(
        "File Operation"
        "Tool Usage"
        "Best Practices"
    )

    for section in "${required_sections[@]}"; do
        if grep -qi "$section" "$file"; then
            print_success "Contains section: $section"
        else
            print_warning "May be missing section: $section"
            ((WARNINGS++))
        fi
    done
}

# Main function
main() {
    echo "Claude Code Configuration File Validation Tool"
    echo "=============================================="
    echo ""

    # Check arguments
    if [ $# -eq 0 ]; then
        print_error "Please specify configuration file path"
        echo ""
        show_help
        exit 1
    fi

    if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        show_help
        exit 0
    fi

    local config_file="$1"

    # Expand ~ path
    config_file="${config_file/#\~/$HOME}"

    echo "Validating configuration file: $config_file"
    echo ""

    # Execute checks
    if check_file_exists "$config_file"; then
        check_encoding "$config_file"
        check_permissions "$config_file"
        check_file_size "$config_file"
        check_markdown_format "$config_file"
        check_required_sections "$config_file"
    fi

    # Output results
    echo ""
    echo "=============================================="
    if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
        print_success "Validation passed! Configuration file is completely normal."
        exit 0
    elif [ $ERRORS -eq 0 ]; then
        print_warning "Validation completed with $WARNINGS warning(s)."
        exit 0
    else
        print_error "Validation failed with $ERRORS error(s) and $WARNINGS warning(s)."
        exit 1
    fi
}

main "$@"
