#!/bin/bash
# Claude Code Quick Configuration Script

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

print_info() {
    echo -e "${YELLOW}ℹ${NC} $1"
}

# Show help information
show_help() {
    cat << EOF
Claude Code Quick Configuration Script

Usage:
    ./setup.en.sh [options]

Options:
    --type TYPE         Project type (frontend/backend/fullstack/data-science)
    --project PATH      Project path
    --global            Install global configuration
    --lang LANG         Language (zh/en), default zh
    -h, --help          Show help information

Examples:
    # Install Chinese global configuration
    ./setup.en.sh --global --lang zh

    # Configure for frontend project
    ./setup.en.sh --type frontend --project /path/to/project

    # Configure for backend project (English)
    ./setup.en.sh --type backend --project /path/to/project --lang en
EOF
}

# Default values
PROJECT_TYPE=""
PROJECT_PATH=""
INSTALL_GLOBAL=false
LANG="zh"

# Parse arguments
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
            print_error "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

# Install global configuration
install_global_config() {
    print_info "Installing global configuration..."

    # Ensure directory exists
    mkdir -p ~/.claude

    # Select configuration file
    if [ "$LANG" = "en" ]; then
        CONFIG_FILE="$REPO_ROOT/configs/global/CLAUDE.en.md"
    else
        CONFIG_FILE="$REPO_ROOT/configs/global/CLAUDE.md"
    fi

    if [ ! -f "$CONFIG_FILE" ]; then
        print_error "Configuration file does not exist: $CONFIG_FILE"
        exit 1
    fi

    # Backup existing configuration
    if [ -f ~/.claude/CLAUDE.md ]; then
        mv ~/.claude/CLAUDE.md ~/.claude/CLAUDE.md.bak
        print_info "Backed up existing configuration to ~/.claude/CLAUDE.md.bak"
    fi

    # Copy configuration
    cp "$CONFIG_FILE" ~/.claude/CLAUDE.md
    print_success "Global configuration installed to ~/.claude/CLAUDE.md"
}

# Install project configuration
install_project_config() {
    print_info "Configuring Claude Code for project..."

    if [ -z "$PROJECT_PATH" ]; then
        print_error "Please specify project path (--project)"
        exit 1
    fi

    if [ ! -d "$PROJECT_PATH" ]; then
        print_error "Project path does not exist: $PROJECT_PATH"
        exit 1
    fi

    # Create .claude directory
    mkdir -p "$PROJECT_PATH/.claude"

    # Copy project configuration template
    cp "$REPO_ROOT/templates/CLAUDE.md" "$PROJECT_PATH/.claude/CLAUDE.md"

    # If project type is specified, append type-specific configuration
    if [ -n "$PROJECT_TYPE" ]; then
        TYPE_CONFIG="$REPO_ROOT/configs/project/${PROJECT_TYPE}.md"
        if [ -f "$TYPE_CONFIG" ]; then
            echo "" >> "$PROJECT_PATH/.claude/CLAUDE.md"
            echo "---" >> "$PROJECT_PATH/.claude/CLAUDE.md"
            echo "" >> "$PROJECT_PATH/.claude/CLAUDE.md"
            cat "$TYPE_CONFIG" >> "$PROJECT_PATH/.claude/CLAUDE.md"
            print_success "Added $PROJECT_TYPE project-specific configuration"
        fi
    fi

    print_success "Project configuration created: $PROJECT_PATH/.claude/CLAUDE.md"
    print_info "Please edit this file to customize project configuration"
}

# Main logic
main() {
    echo "Claude Code Configuration Tool"
    echo "=============================="
    echo ""

    if [ "$INSTALL_GLOBAL" = true ]; then
        install_global_config
    fi

    if [ -n "$PROJECT_PATH" ]; then
        install_project_config
    fi

    if [ "$INSTALL_GLOBAL" = false ] && [ -z "$PROJECT_PATH" ]; then
        print_error "Please specify --global or --project"
        show_help
        exit 1
    fi

    echo ""
    print_success "Configuration complete!"
}

main
