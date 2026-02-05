# Bug Fixing Scenario

## Scenario Description

User reported a bug that needs to be located and fixed.

## Steps

### 1. Understand the Problem

```
User feedback: Page unresponsive after clicking login button
Environment: Chrome browser, production environment
Reproduction steps: Enter username and password -> Click login -> No response
```

### 2. Locate the Issue

```bash
# Search login-related code
Grep "login" --glob "*.js" --output_mode content

# View login component
Read src/components/LoginForm.jsx

# Check API calls
Read src/api/auth.js
```

### 3. Analyze the Cause

- Check browser console errors
- View network requests
- Check code logic

### 4. Fix the Bug

```javascript
// Found issue: Missing error handling
async function handleLogin() {
  const response = await api.login(username, password);
  // If response is undefined, subsequent code will fail
  setUser(response.data);
}

// Fix: Add error handling
async function handleLogin() {
  try {
    const response = await api.login(username, password);
    if (response && response.data) {
      setUser(response.data);
    } else {
      showError('Login failed, please try again');
    }
  } catch (error) {
    console.error('Login error:', error);
    showError('Login failed: ' + error.message);
  }
}
```

### 5. Verify the Fix

```bash
# Run tests
npm test -- LoginForm.test.js

# Local verification
npm run dev
# Manually test login flow
```

### 6. Commit the Fix

```bash
git add src/components/LoginForm.jsx
git commit -m "fix(auth): add login error handling

- Add try-catch error capture
- Validate response data validity
- Display user-friendly error messages

Fixes #123"
```

## Best Practices

1. **Reproduce first**: Ensure the issue can be reproduced consistently
2. **Small scope changes**: Only fix the problem, no extra modifications
3. **Add tests**: Prevent the issue from recurring
4. **Detailed documentation**: Commit message explains the fix

## Prompt Example

```
User reported login functionality issue, please help me:
1. Search login-related code
2. Analyze possible causes
3. Provide fix solution
4. Add necessary error handling
```
