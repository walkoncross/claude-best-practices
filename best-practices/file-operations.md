# 文件操作最佳实践

## 工具选择优先级

### 1. 读取文件
**优先使用 `Read` 工具**
```
✅ 正确：使用 Read 工具
❌ 错误：使用 cat/head/tail 命令
```

**优势：**
- 支持分段读取（offset/limit）
- 自动处理大文件
- 支持图片、PDF 等多种格式

### 2. 编辑文件
**优先使用 `Edit` 工具**
```
✅ 正确：使用 Edit 工具精确替换
❌ 错误：使用 sed/awk 命令
```

**注意事项：**
- 必须先用 `Read` 读取文件
- 确保 old_string 在文件中唯一
- 保持原有缩进格式

### 3. 创建文件
**优先使用 `Write` 工具**
```
✅ 正确：使用 Write 工具
❌ 错误：使用 echo 重定向或 cat heredoc
```

**注意事项：**
- 已存在的文件必须先 `Read`
- 优先编辑而非重写
- 确保 UTF-8 编码

## 大文件处理策略

### 阈值判断
- 文件超过 **1000 行** 或 **100KB** 必须分段处理

### 读取策略
```bash
# 第一次读取：前 1000 行
Read(file_path, offset=0, limit=1000)

# 第二次读取：1000-2000 行
Read(file_path, offset=1000, limit=1000)
```

### 编辑策略
- 每次修改不超过 1000 行
- 使用精确的 old_string 定位
- 避免全文替换

## 安全操作规范

### 删除文件
```bash
# ✅ 正确：移动到归档目录
mv unwanted_file.txt ~/claude-temp/

# ❌ 错误：直接删除
rm unwanted_file.txt
```

### 备份重要文件
```bash
# 修改前备份
cp important_file.txt ~/claude-temp/important_file.txt.bak
```

### 权限设置
```bash
# 普通文件
chmod 644 file.txt

# 敏感文件
chmod 600 secret.key

# 可执行脚本
chmod +x script.sh
```

## 常见错误与解决

### 错误 1：未读取就编辑
```
❌ 直接使用 Edit 工具
✅ 先 Read 再 Edit
```

### 错误 2：old_string 不唯一
```
❌ old_string 太短，匹配多处
✅ 包含足够上下文确保唯一
```

### 错误 3：破坏文件编码
```
❌ 使用非 UTF-8 编码
✅ 始终使用 UTF-8（无 BOM）
```

## 检查清单

操作前确认：
- [ ] 是否需要先读取文件？
- [ ] 文件是否超过 1000 行？
- [ ] 是否需要备份？
- [ ] 编码是否为 UTF-8？
- [ ] 权限设置是否正确？
