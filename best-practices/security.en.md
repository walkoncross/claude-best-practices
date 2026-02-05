# Security Best Practices

## Sensitive Information Protection

### Identifying Sensitive Information
- API keys and tokens
- Database passwords
- Private keys and certificates
- User personal information
- Internal URLs and IP addresses

### Handling Principles
```bash
# ✅ Use environment variables
DATABASE_URL=postgresql://user:pass@localhost/db

# ❌ Hardcode in code
const dbUrl = "postgresql://user:pass@localhost/db"
```

## Environment Variable Management

### .env File
```bash
# .env
API_KEY=your-api-key
DATABASE_URL=postgresql://localhost/db
SECRET_KEY=your-secret-key
```

### .env.example Template
```bash
# .env.example (commit to version control)
API_KEY=your-api-key-here
DATABASE_URL=postgresql://localhost/dbname
SECRET_KEY=generate-a-secret-key
```

### .gitignore Configuration
```
# Environment variables
.env
.env.local
.env.*.local
```

## Code Security

### Input Validation
```javascript
// ✅ Validate and sanitize input
function getUserById(id) {
  const sanitizedId = parseInt(id, 10);
  if (isNaN(sanitizedId)) {
    throw new Error('Invalid ID');
  }
  return db.query('SELECT * FROM users WHERE id = ?', [sanitizedId]);
}

// ❌ Direct use of user input
function getUserById(id) {
  return db.query(`SELECT * FROM users WHERE id = ${id}`);
}
```

### SQL Injection Prevention
```python
# ✅ Use parameterized queries
cursor.execute("SELECT * FROM users WHERE id = ?", (user_id,))

# ❌ String concatenation
cursor.execute(f"SELECT * FROM users WHERE id = {user_id}")
```

### XSS Prevention
```javascript
// ✅ Escape user input
const escaped = escapeHtml(userInput);
element.textContent = userInput; // Use textContent

// ❌ Direct HTML insertion
element.innerHTML = userInput;
```

## Dependency Security

### Regular Updates
```bash
# Check outdated dependencies
npm outdated

# Check security vulnerabilities
npm audit

# Fix vulnerabilities
npm audit fix
```

### Lock Versions
```json
// package.json
{
  "dependencies": {
    "express": "4.18.2"  // Exact version
  }
}
```

## File Permissions

### Permission Settings
```bash
# Regular files
chmod 644 file.txt

# Sensitive configuration
chmod 600 .env

# Executable scripts
chmod 755 script.sh

# Private key files
chmod 400 private.key
```

## Log Security

### Data Masking
```javascript
// ✅ Mask sensitive information
logger.info(`User login: ${email.replace(/(?<=.{2}).(?=.*@)/g, '*')}`);

// ❌ Log complete information
logger.info(`User login: ${email}, password: ${password}`);
```

## Checklist

Before code commit:
- [ ] No hardcoded keys and passwords
- [ ] .env file added to .gitignore
- [ ] User input validated and sanitized
- [ ] Using parameterized queries
- [ ] Sensitive file permissions correct
- [ ] No sensitive information in logs
