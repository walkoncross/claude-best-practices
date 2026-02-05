# Code Refactoring Scenario

## Scenario Description

Need to refactor a complex function to improve code readability and maintainability.

## Steps

### 1. Understand Existing Code

```bash
# Read target file
Read src/utils/dataProcessor.js

# Search related dependencies
Grep "dataProcessor" --glob "*.js"
```

### 2. Analyze Refactoring Needs

- Identify code smells (long functions, duplicate code, etc.)
- Determine refactoring goals (split functions, extract common logic, etc.)
- Assess impact scope

### 3. Execute Refactoring

```javascript
// Before refactoring
function processData(data) {
  // 100+ lines of complex logic
  // Contains validation, transformation, calculation, etc.
}

// After refactoring
function processData(data) {
  const validated = validateData(data);
  const transformed = transformData(validated);
  return calculateResult(transformed);
}

function validateData(data) {
  // Validation logic
}

function transformData(data) {
  // Transformation logic
}

function calculateResult(data) {
  // Calculation logic
}
```

### 4. Verify Refactoring

```bash
# Run tests
npm test

# Check types
npm run type-check

# Lint
npm run lint
```

## Best Practices

1. **Small steps**: Change one thing at a time, test immediately
2. **Keep functionality unchanged**: Refactoring doesn't change external behavior
3. **Commit frequently**: Commit each refactoring step
4. **Test coverage**: Ensure tests protect the code

## Common Pitfalls

- ❌ Large-scale refactoring all at once
- ❌ Adding new features while refactoring
- ❌ Skipping test verification
- ❌ Not committing intermediate states

## Prompt Example

```
Please help me refactor the processData function in src/utils/dataProcessor.js:
1. Read and analyze existing code first
2. Identify independent responsibilities that can be split
3. Split long function into multiple smaller functions
4. Keep original functionality unchanged
5. Add necessary comments
```
