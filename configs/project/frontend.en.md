# Frontend Project Configuration

> For React, Vue, Angular and other frontend projects

## Project-Specific Rules

### Tech Stack Detection
- **React**: Detect `react` dependency in `package.json`
- **Vue**: Detect `vue` dependency and `vite.config.js`
- **Angular**: Detect `angular.json`
- **Next.js**: Detect `next.config.js`

### Code Style
- Follow ESLint and Prettier configuration in project
- Component naming uses PascalCase
- File naming follows project convention (kebab-case or PascalCase)

### File Organization
- Component files: `src/components/`
- Page files: `src/pages/` or `src/views/`
- Utility functions: `src/utils/`
- Type definitions: `src/types/` or co-located with components

### Common Commands
```bash
# Install dependencies
npm install

# Development server
npm run dev

# Build
npm run build

# Test
npm test

# Lint
npm run lint
```

### Best Practices
- Run `npm run lint` before modifying code to check existing issues
- Run `npm install` after adding new dependencies
- Verify component changes in browser
- Avoid directly modifying `node_modules/`
