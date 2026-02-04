# Quick Start Guide

This guide helps you configure Claude Code in 5 minutes.

## Step 1: Install Global Configuration

### For English Environment

```bash
# Copy English global configuration
cp configs/global/CLAUDE.en.md ~/.claude/CLAUDE.md
```

### For Chinese Environment

```bash
# Copy Chinese global configuration
cp configs/global/CLAUDE.md ~/.claude/CLAUDE.md
```

## Step 2: Verify Configuration

```bash
# Start Claude Code and test
claude

# Test file operations
# Claude should prioritize Read/Edit/Write tools over bash commands
```

## Step 3: Project-Level Configuration (Optional)

If you need to customize configuration for a specific project:

```bash
# Create configuration in project root
mkdir -p your-project/.claude
cp templates/CLAUDE.md your-project/.claude/CLAUDE.md

# Edit configuration based on project type
```

## Common Project Type Configurations

- **Frontend Projects**: See `configs/project/frontend.md`
- **Backend Projects**: See `configs/project/backend.md`
- **Fullstack Projects**: See `configs/project/fullstack.md`
- **Data Science**: See `configs/project/data-science.md`

## Next Steps

- Check [Best Practices](../best-practices/) for usage tips
- Browse [Usage Scenarios](../examples/scenarios/) for real-world examples
- Configure [Hooks](../configs/hooks/) for automated workflows

## Troubleshooting

### Configuration Not Taking Effect

1. Check file path: `ls -la ~/.claude/CLAUDE.md`
2. Check file encoding: `file -I ~/.claude/CLAUDE.md` (should be UTF-8)
3. Restart Claude Code

### Permission Issues

```bash
# Ensure configuration file is readable
chmod 644 ~/.claude/CLAUDE.md
```

For more issues, see [FAQ](faq.en.md).
