# Claude Code Global Rules

## Package Manager
Always use Bun instead of npm/yarn:
- `bun install`, `bun run`, `bunx`
- `bun test` instead of `npm test`

## Git Commits
Write commit messages as a human developer - no references to AI or Claude.

## Documentation Lookup

### Priority Order
1. **Context7 MCP** - Primary source for up-to-date documentation
2. **Ref MCP** - Secondary documentation search (use exact URLs with `#hash` fragments)
3. **Exa/WebSearch** - Fallback only if above fail

### Context7 Usage
Automatically invoke Context7 when:
- Generating code for specific libraries/frameworks
- Asking about version-specific functionality
- Debugging potential version-related issues

Use `mcp__context7__resolve-library-id` first, then `mcp__context7__get-library-docs`.

## Active MCP Servers

### Exa
Advanced web search and research. Requires `EXA_API_KEY` environment variable.

### Ref
Documentation search via HTTP. Requires `REF_API_KEY` environment variable.

### Chrome DevTools
Browser automation for testing and debugging via DevTools Protocol.

## Enabled Plugins
- **context7** - Real-time documentation access
- **engineering-workflow-skills** - PR creation, test fixing, feature planning
- **visual-documentation-skills** - Dashboards, flowcharts, timelines
- **productivity-skills** - Project bootstrapping, codebase documentation
- **document-skills** - PDF, DOCX, XLSX, PPTX handling
- **frontend-design** - UI component generation
- **LSP integrations** - TypeScript, Go, C#, Clangd

## Quick Reference

```bash
# Package management
bun install          # Install dependencies
bunx <package>       # Run package binaries
bun run <script>     # Run scripts

# Documentation lookup
# Context7 is used automatically for library docs
# Ref MCP for general documentation search
```
