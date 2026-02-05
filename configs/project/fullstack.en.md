# Fullstack Project Configuration

> For fullstack projects with integrated frontend and backend

## Project-Specific Rules

### Tech Stack Detection
- **Monorepo**: Detect `lerna.json`, `pnpm-workspace.yaml`
- **Next.js**: Fullstack framework
- **Nuxt.js**: Vue fullstack framework
- **SvelteKit**: Svelte fullstack framework

### Directory Structure
```
project/
├── frontend/          # Frontend code
├── backend/           # Backend code
├── shared/            # Shared code (types, utilities, etc.)
└── docs/              # Documentation
```

### Code Style
- Use unified code conventions for frontend and backend
- Share type definitions
- Centralize API interface definitions

### Common Commands
```bash
# Install all dependencies
npm install

# Start both frontend and backend
npm run dev

# Start separately
npm run dev:frontend
npm run dev:backend

# Build
npm run build

# Test
npm run test
```

### Best Practices
- Place type definitions in `shared/types/`
- Centralize API interface definitions
- Use same validation rules for frontend and backend
- Separate environment variables (`.env.frontend`, `.env.backend`)
