# 安全规范最佳实践

## 敏感信息保护

### 识别敏感信息
- API 密钥和令牌
- 数据库密码
- 私钥和证书
- 用户个人信息
- 内部 URL 和 IP 地址

### 处理原则
```bash
# ✅ 使用环境变量
DATABASE_URL=postgresql://user:pass@localhost/db

# ❌ 硬编码在代码中
const dbUrl = "postgresql://user:pass@localhost/db"
```

## 环境变量管理

### .env 文件
```bash
# .env
API_KEY=your-api-key
DATABASE_URL=postgresql://localhost/db
SECRET_KEY=your-secret-key
```

### .env.example 模板
```bash
# .env.example（提交到版本控制）
API_KEY=your-api-key-here
DATABASE_URL=postgresql://localhost/dbname
SECRET_KEY=generate-a-secret-key
```

### .gitignore 配置
```
# 环境变量
.env
.env.local
.env.*.local
```

## 代码安全

### 输入验证
```javascript
// ✅ 验证和清理输入
function getUserById(id) {
  const sanitizedId = parseInt(id, 10);
  if (isNaN(sanitizedId)) {
    throw new Error('Invalid ID');
  }
  return db.query('SELECT * FROM users WHERE id = ?', [sanitizedId]);
}

// ❌ 直接使用用户输入
function getUserById(id) {
  return db.query(`SELECT * FROM users WHERE id = ${id}`);
}
```

### SQL 注入防护
```python
# ✅ 使用参数化查询
cursor.execute("SELECT * FROM users WHERE id = ?", (user_id,))

# ❌ 字符串拼接
cursor.execute(f"SELECT * FROM users WHERE id = {user_id}")
```

### XSS 防护
```javascript
// ✅ 转义用户输入
const escaped = escapeHtml(userInput);
element.textContent = userInput; // 使用 textContent

// ❌ 直接插入 HTML
element.innerHTML = userInput;
```

## 依赖安全

### 定期更新
```bash
# 检查过时的依赖
npm outdated

# 检查安全漏洞
npm audit

# 修复漏洞
npm audit fix
```

### 锁定版本
```json
// package.json
{
  "dependencies": {
    "express": "4.18.2"  // 精确版本
  }
}
```

## 文件权限

### 权限设置
```bash
# 普通文件
chmod 644 file.txt

# 敏感配置
chmod 600 .env

# 可执行脚本
chmod 755 script.sh

# 私钥文件
chmod 400 private.key
```

## 日志安全

### 脱敏处理
```javascript
// ✅ 脱敏敏感信息
logger.info(`User login: ${email.replace(/(?<=.{2}).(?=.*@)/g, '*')}`);

// ❌ 记录完整信息
logger.info(`User login: ${email}, password: ${password}`);
```

## 检查清单

代码提交前：
- [ ] 没有硬编码的密钥和密码
- [ ] .env 文件已添加到 .gitignore
- [ ] 用户输入已验证和清理
- [ ] 使用参数化查询
- [ ] 敏感文件权限正确
- [ ] 日志中没有敏感信息
