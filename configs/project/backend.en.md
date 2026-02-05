# Backend Project Configuration

> For Node.js, Python, Go, Java and other backend projects

## Project-Specific Rules

### Tech Stack Detection
- **Node.js**: Detect `package.json` and Express/Koa/Nest.js dependencies
- **Python**: Detect `requirements.txt`, `pyproject.toml`, Flask/Django/FastAPI
- **Go**: Detect `go.mod`, `go.sum`
- **Java**: Detect `pom.xml`, `build.gradle`, Spring Boot

### Code Style
- Follow existing code conventions in project
- API route naming uses RESTful style
- Database operations use ORM/query builder
- Error handling uses project's unified error handling mechanism

### File Organization
- Routes/Controllers: `src/routes/` or `src/controllers/`
- Service layer: `src/services/`
- Data models: `src/models/`
- Middleware: `src/middleware/`
- Configuration: `config/` or `src/config/`

### Common Commands
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

### Security Considerations
- Use environment variables for sensitive configuration (`.env` file)
- Don't hardcode API keys or database passwords
- Input validation to prevent injection attacks
- Use parameterized queries to prevent SQL injection

### Best Practices
- Run tests after modifying APIs
- Use project's migration tools for database migrations
- Use project's logging framework for logging
- Avoid printing sensitive information in production environment
