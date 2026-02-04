# 代码重构场景

## 场景描述

需要重构一个复杂的函数，提高代码可读性和可维护性。

## 操作步骤

### 1. 理解现有代码

```bash
# 读取目标文件
Read src/utils/dataProcessor.js

# 搜索相关依赖
Grep "dataProcessor" --glob "*.js"
```

### 2. 分析重构需求

- 识别代码异味（过长函数、重复代码等）
- 确定重构目标（拆分函数、提取公共逻辑等）
- 评估影响范围

### 3. 执行重构

```javascript
// 重构前
function processData(data) {
  // 100+ 行复杂逻辑
  // 包含验证、转换、计算等多个职责
}

// 重构后
function processData(data) {
  const validated = validateData(data);
  const transformed = transformData(validated);
  return calculateResult(transformed);
}

function validateData(data) {
  // 验证逻辑
}

function transformData(data) {
  // 转换逻辑
}

function calculateResult(data) {
  // 计算逻辑
}
```

### 4. 验证重构

```bash
# 运行测试
npm test

# 检查类型
npm run type-check

# 代码检查
npm run lint
```

## 最佳实践

1. **小步重构**：每次只改一个地方，立即测试
2. **保持功能不变**：重构不改变外部行为
3. **提交频繁**：每个重构步骤都提交
4. **测试覆盖**：确保有测试保护

## 常见陷阱

- ❌ 一次性大规模重构
- ❌ 重构时添加新功能
- ❌ 跳过��试验证
- ❌ 不提交中间状态

## 提示词示例

```
请帮我重构 src/utils/dataProcessor.js 中的 processData 函数：
1. 先读取并分析现有代码
2. 识别可以拆分的独立职责
3. 将长函数拆分为多个小函数
4. 保持原有功能不变
5. 添加必要的注释
```
