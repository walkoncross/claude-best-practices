# Installation Guide

## System Requirements

- Claude Code CLI installed
- Bash shell (macOS/Linux) or Git Bash (Windows)
- Git (for version control)

## Installation Steps

### 1. Clone Repository

```bash
git clone https://github.com/your-username/claude-best-practices.git
cd claude-best-practices
```

### 2. Install Global Configuration

#### English Environment

```bash
./tools/setup.sh --global --lang en
```

#### Chinese Environment

```bash
./tools/setup.sh --global --lang zh
```

### 3. Verify Installation

```bash
# Check if configuration file exists
ls -la ~/.claude/CLAUDE.md

# Check file encoding
file -I ~/.claude/CLAUDE.md
```

### 4. Project-Level Configuration (Optional)

```bash
# Add configuration to existing project
./tools/setup.sh --type frontend --project /path/to/your-project
```

## Manual Installation

If the automatic script is not available, you can install manually:

```bash
# Create configuration directory
mkdir -p ~/.claude

# Copy configuration file
cp configs/global/CLAUDE.en.md ~/.claude/CLAUDE.md

# Ensure correct file permissions
chmod 644 ~/.claude/CLAUDE.md
```

## Update Configuration

```bash
# Pull latest version
git pull origin main

# Reinstall
./tools/setup.sh --global --lang en
```

## Uninstall

```bash
# Remove global configuration
rm ~/.claude/CLAUDE.md

# Restore backup (if exists)
mv ~/.claude/CLAUDE.md.bak ~/.claude/CLAUDE.md
```

## Troubleshooting

See [FAQ](faq.en.md) for common issues and solutions.
