# Debugging Best Practices

## Problem Localization Strategy

### 1. Reproduce the Issue
```bash
# Document reproduction steps
1. Perform action A
2. Input data B
3. Observe error C
```

### 2. Collect Information
```bash
# View error logs
tail -f logs/error.log

# Check system status
ps aux | grep process-name
netstat -tulpn | grep port
```

### 3. Narrow Down Scope
- Binary search approach
- Isolate variables
- Compare normal/abnormal situations

## Common Debugging Tools

### Log Debugging
```javascript
// Add debug logs
console.log('Debug:', { variable, state });

// Use debug library
const debug = require('debug')('app:module');
debug('Processing data:', data);
```

### Breakpoint Debugging
```javascript
// Node.js
node --inspect-brk app.js

// Python
import pdb; pdb.set_trace()

// Go
import "runtime/debug"
debug.PrintStack()
```

### Network Debugging
```bash
# View HTTP requests
curl -v https://api.example.com

# Packet capture analysis
tcpdump -i any port 80
```

## Common Issue Troubleshooting

### Dependency Issues
```bash
# Clean and reinstall
rm -rf node_modules package-lock.json
npm install

# Check version conflicts
npm ls package-name
```

### Environment Issues
```bash
# Check environment variables
printenv | grep VAR_NAME

# Verify configuration
cat .env
```

### Performance Issues
```bash
# Performance profiling
node --prof app.js
node --prof-process isolate-*.log

# Memory analysis
node --inspect app.js
# Chrome DevTools -> Memory
```

## Debugging Checklist

- [ ] Can it be reproduced consistently?
- [ ] What is the error message?
- [ ] What recent changes were made?
- [ ] Does it work in other environments?
- [ ] What clues are in the logs?
