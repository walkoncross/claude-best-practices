# Frequently Asked Questions (FAQ)

## Configuration

### Q: What's the difference between global and project configuration?

**A:**
- **Global configuration** (`~/.claude/CLAUDE.md`): Universal rules for all projects
- **Project configuration** (`project/.claude/CLAUDE.md`): Project-specific rules that override global settings

### Q: Configuration not taking effect?

**A:** Check the following:
1. File path is correct: `ls -la ~/.claude/CLAUDE.md`
2. File encoding is UTF-8: `file -I ~/.claude/CLAUDE.md`
3. File permissions are readable: `chmod 644 ~/.claude/CLAUDE.md`
4. Restart Claude Code

### Q: How to validate configuration?

**A:**
```bash
# Use validation tool
./tools/validate-config.sh ~/.claude/CLAUDE.md

# Or test manually
# Ask Claude to perform file operations and observe if it uses Read/Edit/Write tools
```

## Usage

### Q: Why doesn't Claude use the rm command?

**A:** For safety, the configuration prohibits using `rm` commands. When deleting files, `mv` is used to move them to the `~/claude-temp` archive directory, allowing recovery at any time.

### Q: How to make Claude prioritize specialized tools?

**A:** Tool usage priority is already set in the global configuration. If Claude still uses bash commands, you can explicitly request:
```
Please use the Read tool to read the file, not the cat command
```

### Q: Large file processing is slow?

**A:** The configuration has set a segmented processing strategy for large files (1000 lines/batch). If still slow:
1. Reduce lines read per batch
2. Only read needed sections
3. Use Grep tool to locate key positions first

## Workflow

### Q: How to configure Git commit conventions?

**A:** See `best-practices/git-workflow.md`, the configuration includes:
- Conventional Commits format
- Commit message templates (English/Chinese)
- Pre-commit hook examples

### Q: How to configure for different project types?

**A:**
```bash
# Use configuration script
./tools/setup.sh --type frontend --project /path/to/project

# Or manually copy template
cp configs/project/frontend.md your-project/.claude/CLAUDE.md
```

## Troubleshooting

### Q: Claude reports insufficient permissions

**A:**
```bash
# Check file permissions
ls -la ~/.claude/CLAUDE.md

# Fix permissions
chmod 644 ~/.claude/CLAUDE.md
```

### Q: Configuration file encoding error

**A:**
```bash
# Check encoding
file -I ~/.claude/CLAUDE.md

# Convert to UTF-8
iconv -f GBK -t UTF-8 ~/.claude/CLAUDE.md > temp.md
mv temp.md ~/.claude/CLAUDE.md
```

### Q: Archive directory taking up too much space

**A:**
```bash
# Check archive directory size
du -sh ~/claude-temp

# Clean archive directory
rm -rf ~/claude-temp/*
# Or move to another location
mv ~/claude-temp ~/claude-temp-backup-$(date +%Y%m%d)
mkdir ~/claude-temp
```

## More Help

- See [Quick Start Guide](quick-start.en.md)
- Browse [Best Practices](../best-practices/)
- Submit Issue: https://github.com/your-username/claude-best-practices/issues
