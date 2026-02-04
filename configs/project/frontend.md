# 前端项目配置

> 适用于 React、Vue、Angular 等前端项目

## 项目特定规则

### 技术栈识别
- **React**: 检测 `package.json` 中的 `react` 依赖
- **Vue**: 检测 `vue` 依赖和 `vite.config.js`
- **Angular**: 检测 `angular.json`
- **Next.js**: 检测 `next.config.js`

### 代码风格
- 遵循项目中的 ESLint 和 Prettier 配置
- 组件命名使用 PascalCase
- 文件命名遵循项目约定（kebab-case 或 PascalCase）

### 文件组织
- 组件文件：`src/components/`
- 页面文件：`src/pages/` 或 `src/views/`
- 工具函数：`src/utils/`
- 类型定义：`src/types/` 或与组件同目录

### 常用命令
```bash
# 安装依赖
npm install

# 开发服务器
npm run dev

# 构建
npm run build

# 测试
npm test

# 代码检查
npm run lint
```

### 最佳实践
- 修改代码前先运行 `npm run lint` 检查现有问题
- 添加新依赖后运行 `npm install`
- 组件修改后在浏览器中验证
- 避免直接修改 `node_modules/`
