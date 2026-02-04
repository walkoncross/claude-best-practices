# Hooks 配置说明

Claude Code 支持通过 hooks 在特定事件发生时执行自定义脚本。

## 配置位置

Hooks 配置在项目的 `.claude/settings.local.json` 文件中：

```json
{
  "hooks": {
    "pre-tool-use": "./hooks/pre-tool-use.sh",
    "post-tool-use": "./hooks/post-tool-use.sh",
    "user-prompt-submit": "./hooks/user-prompt-submit.sh"
  }
}
```

## 可用的 Hooks

### 1. pre-tool-use
工具调用前执行

**用途：**
- 验证操作权限
- 检查文件状态
- 记录操作日志

### 2. post-tool-use
工具调用后执行

**用途：**
- 验证操作结果
- 触发后续操作
- 更新状态

### 3. user-prompt-submit
用户提交提示词时执行

**用途：**
- 预处理用户输入
- 添加上下文信息
- 验证请求

## 示例配置

查看 `configs/hooks/` 目录下的示例脚本：
- `pre-commit.sh` - 提交前检查
- `post-tool-use.sh` - 工具使用后处理
- `README.md` - 详细说明

## 注意事项

- Hook 脚本必须有执行权限：`chmod +x hook.sh`
- Hook 失败会阻止操作继续
- 使用 `exit 0` 表示成功，`exit 1` 表示失败
