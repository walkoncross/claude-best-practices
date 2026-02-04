# 全栈项目配置

> 适用于前后端一体的全栈项目

## 项目特定规则

### 技术栈识别
- **Monorepo**: 检测 `lerna.json`、`pnpm-workspace.yaml`
- **Next.js**: 前后端一体框架
- **Nuxt.js**: Vue 全栈框架
- **SvelteKit**: Svelte 全栈框架

### 目录结构
```
project/
├── frontend/          # 前端代码
├── backend/           # 后端代码
├── shared/            # 共享代码（类型、工具等）
└── docs/              # 文档
```

### 代码风格
- 前后端使用统一的代码规范
- 共享类型定义
- API 接口定义集中管理

### 常用命令
```bash
# 安装所有依赖
npm install

# 同时启动前后端
npm run dev

# 分别启动
npm run dev:frontend
npm run dev:backend

# 构建
npm run build

# 测试
npm run test
```

### 最佳实践
- 类型定义放在 `shared/types/`
- API 接口定义统一管理
- 前后端使用相同的验证规则
- 环境变量分离（`.env.frontend`、`.env.backend`）
