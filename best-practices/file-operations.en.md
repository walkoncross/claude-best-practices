# File Operations Best Practices

## Tool Selection Priority

### 1. Reading Files
**Prioritize `Read` tool**
```
✅ Correct: Use Read tool
❌ Wrong: Use cat/head/tail commands
```

**Advantages:**
- Supports segmented reading (offset/limit)
- Automatic large file handling
- Supports multiple formats (images, PDFs, etc.)

### 2. Editing Files
**Prioritize `Edit` tool**
```
✅ Correct: Use Edit tool for precise replacement
❌ Wrong: Use sed/awk commands
```

**Important notes:**
- Must use `Read` first
- Ensure old_string is unique in file
- Preserve original indentation

### 3. Creating Files
**Prioritize `Write` tool**
```
✅ Correct: Use Write tool
❌ Wrong: Use echo redirection or cat heredoc
```

**Important notes:**
- Must `Read` existing files first
- Prefer editing over rewriting
- Ensure UTF-8 encoding

## Large File Handling Strategy

### Threshold Determination
- Files exceeding **1000 lines** or **100KB** must be processed in segments

### Reading Strategy
```bash
# First read: lines 0-1000
Read(file_path, offset=0, limit=1000)

# Second read: lines 1000-2000
Read(file_path, offset=1000, limit=1000)
```

### Editing Strategy
- Each modification should not exceed 1000 lines
- Use precise old_string for location
- Avoid full file replacement

## Safe Operation Guidelines

### Deleting Files
```bash
# ✅ Correct: Move to archive directory
mv unwanted_file.txt ~/claude-temp/

# ❌ Wrong: Direct deletion
rm unwanted_file.txt
```

### Backup Important Files
```bash
# Backup before modification
cp important_file.txt ~/claude-temp/important_file.txt.bak
```

### Permission Settings
```bash
# Regular files
chmod 644 file.txt

# Sensitive files
chmod 600 secret.key

# Executable scripts
chmod +x script.sh
```

## Common Errors and Solutions

### Error 1: Editing without reading
```
❌ Direct use of Edit tool
✅ Read first, then Edit
```

### Error 2: old_string not unique
```
❌ old_string too short, matches multiple locations
✅ Include enough context to ensure uniqueness
```

### Error 3: Breaking file encoding
```
❌ Using non-UTF-8 encoding
✅ Always use UTF-8 (without BOM)
```

## Checklist

Before operations:
- [ ] Need to read file first?
- [ ] Does file exceed 1000 lines?
- [ ] Need backup?
- [ ] Is encoding UTF-8?
- [ ] Are permissions correct?
