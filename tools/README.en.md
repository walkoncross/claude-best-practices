# Tools Usage Guide

This directory contains utility tools for configuring and managing Claude Code.

## setup.sh

Quick configuration script for installing global or project configurations.

### Usage

```bash
# Install Chinese global configuration
./tools/setup.sh --global --lang zh

# Install English global configuration
./tools/setup.sh --global --lang en

# Configure for frontend project
./tools/setup.sh --type frontend --project /path/to/project

# Configure for backend project (English)
./tools/setup.sh --type backend --project /path/to/project --lang en
```

### Parameters

- `--global`: Install global configuration to `~/.claude/CLAUDE.md`
- `--type TYPE`: Project type (frontend/backend/fullstack/data-science)
- `--project PATH`: Project path
- `--lang LANG`: Language (zh/en), default zh
- `-h, --help`: Show help information

## validate-config.sh

Configuration validation tool (to be implemented)

Used to validate configuration file format.

```bash
./tools/validate-config.sh ~/.claude/CLAUDE.md
```

## Developing New Tools

Contributions of new tool scripts are welcome! Please follow these guidelines:

1. Write in bash
2. Add detailed comments
3. Provide `--help` option
4. Comprehensive error handling
5. Update this documentation
