# 后端项目配置

> 适用于 Node.js、Python、Go、Java 等后端项目

## 项目特定规则

### 技术栈识别
- **Node.js**: 检测 `package.json` 和 Express/Koa/Nest.js 依赖
- **Python**: 检测 `requirements.txt`、`pyproject.toml`、Flask/Django/FastAPI
- **Go**: 检测 `go.mod`、`go.sum`
- **Java**: 检测 `pom.xml`、`build.gradle`、Spring Boot

### 代码风格
- 遵循项目现有的代码规范
- API 路由命名使用 RESTful 风格
- 数据库操作使用 ORM/查询构建器
- 错误处理统一使用项目的错误处理机制

### 文件组织
- 路由/控制器：`src/routes/` 或 `src/controllers/`
- 服务层：`src/services/`
- 数据模型：`src/models/`
- 中间件：`src/middleware/`
- 配置文件：`config/` 或 `src/config/`

### 常用命令
```bash
# Node.js
npm install
npm run dev
npm test

# Python
pip install -r requirements.txt
python manage.py runserver
pytest

# Go
go mod download
go run main.go
go test ./...

# Java
mvn install
mvn spring-boot:run
mvn test
```

### 安全注意事项
- 敏感配置使用环境变量（`.env` 文件）
- API 密钥、数据库密码不硬编码
- 输入验证防止注入攻击
- 使用参数化查询防止 SQL 注入

### 最佳实践
- 修改 API 后运行测试验证
- 数据库迁移使用项目的迁移工具
- 日志记录使用项目的日志框架
- 避免在生产环境打印敏感信息
