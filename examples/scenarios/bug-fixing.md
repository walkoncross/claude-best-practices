# Bug 修复场景

## 场景描述

用户报告了一个 bug，需要定位问题并修复。

## 操作步骤

### 1. 理解问题

```
用户反馈：点击登录按钮后页面无响应
环境：Chrome 浏览器，生产环境
复现步骤：输入用户名密码 -> 点击登录 -> 无反应
```

### 2. 定位问题

```bash
# 搜索登录相关代码
Grep "login" --glob "*.js" --output_mode content

# 查看登录组件
Read src/components/LoginForm.jsx

# 检查 API 调用
Read src/api/auth.js
```

### 3. 分析原因

- 检查浏览器控制台错误
- 查看网络请求
- 检查代码逻辑

### 4. 修复 Bug

```javascript
// 发现问题：缺少错误处理
async function handleLogin() {
  const response = await api.login(username, password);
  // 如果 response 是 undefined 会导致后续代码失败
  setUser(response.data);
}

// 修复：添加错误处理
async function handleLogin() {
  try {
    const response = await api.login(username, password);
    if (response && response.data) {
      setUser(response.data);
    } else {
      showError('登录失败，请重试');
    }
  } catch (error) {
    console.error('Login error:', error);
    showError('登录失败：' + error.message);
  }
}
```

### 5. 验证修复

```bash
# 运行测试
npm test -- LoginForm.test.js

# 本地验证
npm run dev
# 手动测试登录流程
```

### 6. 提交修复

```bash
git add src/components/LoginForm.jsx
git commit -m "fix(auth): 添加登录错误处理

- 添加 try-catch 错误捕获
- 验证响应数据有效性
- 显示用户友好的错误信息

Fixes #123"
```

## 最佳实践

1. **先复现**：确保能稳定复现问题
2. **小范围修改**：只修复问题，不做额外改动
3. **添加测试**：防止问题再次出现
4. **详细记录**：提交信息说明修复内容

## 提示词示例

```
用户报告登录功能有问题，请帮我：
1. 搜索登录相关代码
2. 分析可能的问题原因
3. 提供修复方案
4. 添加必要的错误处理
```
