# AGENTS.md - Development Guide

## Project Overview
This is a dotfiles repository containing personal development configurations, primarily for macOS. Key components include Karabiner Elements keyboard remapping (TypeScript-based), multiple Neovim configurations (Lazyvim, NvChad, AstroNvim), and shell configurations.

## Build Commands

### Karabiner (TypeScript)
```bash
cd karabiner
yarn install           # Install dependencies
yarn run build         # Compile rules.ts to karabiner.json
yarn run watch         # Watch for changes and rebuild automatically
```

No test framework is configured. Running individual tests is not applicable.

## Code Style Guidelines

### TypeScript (Karabiner)
**Formatting:**
- Use Prettier (configured in karabiner/.prettierrc)
- 2-space indentation
- LF line endings (enforced by .editorconfig)
- UTF-8 encoding

**Imports:**
- Standard/library imports first, then local imports
- Use ES6 import/export syntax
- Example: `import fs from "fs"; import { KarabinerRules } from "./types";`

**Types:**
- Explicit type annotations for all function parameters and return values
- Export interfaces and types explicitly
- Use `const` assertions where appropriate: `type: "basic" as const`
- TypeScript strict typing expected

**Naming:**
- camelCase for variables and functions
- PascalCase for interfaces and types
- Descriptive names: `createHyperSubLayer`, `generateSubLayerVariableName`

**Structure:**
- Separate files: types.ts, utils.ts, rules.ts
- Utility functions should be exported and reusable
- Use template literals for multi-line shell commands

**Error Handling:**
- No explicit error handling in current codebase
- JSON writing uses synchronous `fs.writeFileSync`

**Comments:**
- Minimize comments (prefer self-documenting code)
- Use JSDoc-style comments for exported functions

### General Guidelines
- No emojis in code unless explicitly requested
- No explanatory comments unless asked
- Follow existing patterns in the codebase
- Keep changes minimal and focused
