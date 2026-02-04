# 贡献指南

感谢你对本项目的关注！我们欢迎各种形式的贡献。

## 如何贡献

### 报告问题

如果你发现了 bug 或有功能建议：

1. 检查 [Issues](https://github.com/your-username/claude-best-practices/issues) 是否已存在
2. 如果没有，创建新 Issue
3. 清晰描述问题或建议
4. 提供复现步骤（如果是 bug）

### 提交代码

1. **Fork 本仓库**
2. **创建分支**
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **进行修改**
4. **提交变更**
   ```bash
   git commit -m "feat: add your feature"
   ```
5. **推送到 Fork**
   ```bash
   git push origin feature/your-feature-name
   ```
6. **创建 Pull Request**

## 贡献内容类型

### 1. 配置模板
- 新的项目类型配置
- 特定场景的配置示例
- 多语言配置翻译

### 2. 最佳实践文档
- 使用技巧和经验总结
- 常见问题解决方案
- 性能优化建议

### 3. 使用场景示例
- 实际项目中的应用案例
- 提示词模板
- 工作流程示例

### 4. 工具脚本
- 配置验证工具
- 自动化脚本
- 辅助工具

## 文档规范

### 文件命名
- 使用小写字母和连字符：`file-name.md`
- 英文文件名，内容可以是中文

### Markdown 格式
- 使用标准 Markdown 语法
- 代码块指定语言
- 添加目录（超过 3 个章节）

### 示例格式
```markdown
# 标题

## 章节 1

内容...

### 子章节

内容...
```

## 双语贡献规范

本项目采用**独立文件**方式管理多语言文档。

### 文件组织方式
- 中文版：`filename.md`
- 英文版：`filename.en.md`
- 其他语言：`filename.ja.md`（日语）、`filename.ko.md`（韩语）

### 更新中文文档时
1. 更新 `filename.md`
2. 同步更新 `filename.en.md`（或在 PR 中标记 TODO）
3. 在 PR 描述中说明是否已同步英文版

### 翻译贡献
- 可以单独提交英文翻译 PR
- 文件名使用 `.en.md` 后缀
- 保持与原文档的内容结构一致
- 技术术语保持英文，说明使用目标语言

## 提交规范

遵循 Conventional Commits：

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type 类型
- `feat`: 新功能
- `fix`: 修复
- `docs`: 文档
- `style`: 格式
- `refactor`: 重构
- `test`: 测试
- `chore`: 构建/工具

### 示例
```bash
docs(best-practices): 添加调试技巧文档
feat(config): 添加 Rust 项目配置模板
fix(tools): 修复 setup.sh 路径问题
```

## 代码审查

所有 PR 需要：
- 通过自动化检查
- 至少一位维护者审查
- 解决所有评论

## 行为准则

- 尊重他人
- 建设性反馈
- 包容不同观点
- 专注于项目目标

## 许可证

贡献的内容将采用 MIT 许可证。

## 联系方式

- Issue: https://github.com/your-username/claude-best-practices/issues
- Email: your-email@example.com

感谢你的贡献！
