# 项目级配置模板

> 复制此文件到项目的 `.claude/CLAUDE.md` 以自定义项目配置

## 项目信息

- **项目名称**：[填写项目名称]
- **项目类型**：[frontend/backend/fullstack/data-science]
- **主要技术栈**：[React/Vue/Python/Go/Java 等]

## 项目特定规则

### 代码风格
- 遵循项目中的 ESLint/Prettier 配置
- 命名规范：[描述项目的命名约定]
- 注释语言：[中文/英文]

### 文件组织
```
src/
├── components/     # 组件目录
├── utils/          # 工具函数
├── types/          # 类型定义
└── ...
```

### 常用命令
```bash
# 安装依赖
[npm install / pip install -r requirements.txt]

# 启动开发服务器
[npm run dev / python manage.py runserver]

# 运行测试
[npm test / pytest]

# 代码检查
[npm run lint / flake8]
```

## 项目约定

### 提交规范
- 提交信息语言：[中文/英文]
- 提交格式：遵循 Conventional Commits

### 分支策略
- 主分支：`main` / `master`
- 开发分支：`develop`
- 功能分支：`feature/*`
- 修复分支：`bugfix/*`

### 代码审查
- PR 必须经过审查
- 必须通过 CI/CD 检查
- 至少一人 approve

## 特殊注意事项

- [列出项目特定的注意事项]
- [例如：不要修改 legacy/ 目录下的代码]
- [例如：API 调用必须经过统一的 request 封装]

---

*此配置会覆盖全局配置中的相同项*
