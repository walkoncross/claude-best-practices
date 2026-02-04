# 调试技巧最佳实践

## 问题定位策略

### 1. 复现问题
```bash
# 记录复现步骤
1. 执行操作 A
2. 输入数据 B
3. 观察到错误 C
```

### 2. 收集信息
```bash
# 查看错误日志
tail -f logs/error.log

# 检查系统状态
ps aux | grep process-name
netstat -tulpn | grep port
```

### 3. 缩小范围
- 二分法排查
- 隔离变量
- 对比正常/异常情况

## 常用调试工具

### 日志调试
```javascript
// 添加调试日志
console.log('Debug:', { variable, state });

// 使用调试库
const debug = require('debug')('app:module');
debug('Processing data:', data);
```

### 断点调试
```javascript
// Node.js
node --inspect-brk app.js

// Python
import pdb; pdb.set_trace()

// Go
import "runtime/debug"
debug.PrintStack()
```

### 网络调试
```bash
# 查看 HTTP 请求
curl -v https://api.example.com

# 抓包分析
tcpdump -i any port 80
```

## 常见问题排查

### 依赖问题
```bash
# 清理并重装
rm -rf node_modules package-lock.json
npm install

# 检查版本冲突
npm ls package-name
```

### 环境问题
```bash
# 检查环境变量
printenv | grep VAR_NAME

# 验证配置
cat .env
```

### 性能问题
```bash
# 性能分析
node --prof app.js
node --prof-process isolate-*.log

# 内存分析
node --inspect app.js
# Chrome DevTools -> Memory
```

## 调试清单

- [ ] 能否稳定复现？
- [ ] 错误信息是什么？
- [ ] 最近有什么改动？
- [ ] 其他环境是否正常？
- [ ] 日志中有什么线索？
