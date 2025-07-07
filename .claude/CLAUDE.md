# Claude Code Global Rules

## Always-Current Documentation with Context7 MCP

### Rule Name
Invoke Context7 for Current Documentation and Code Validation

### Rule Description
This rule governs when and how Claude should utilize the Context7 MCP server to retrieve the latest documentation and code examples for any specified technology. The primary goal is to ensure all generated code and technical responses are accurate, up-to-date, and based on the official, version-specific information.

### Triggering Conditions

Claude should automatically invoke the Context7 MCP under the following circumstances:

1. **Explicit Command**: Whenever the user includes the phrase "use context7" in the prompt. This is the primary and most direct trigger.

2. **Implicit Need for Current Information**: When the user's prompt involves:
   - Generating code for a specific library, framework, or API (e.g., "Write a Python script using FastAPI to...")
   - Asking questions about the functionality or implementation of a particular version of a library (e.g., "How has the authentication method in Next.js v14 changed?")
   - Debugging code that may be suffering from version-related errors
   - Comparing different versions of a technology

### Action/Execution Flow

Upon triggering, Claude will execute the following steps:

1. **Prioritize Context7**: For any technical implementation or documentation-related query matching the trigger conditions, Claude will prioritize using Context7 as the primary source of truth over its internal knowledge base.

2. **Invoke Context7 MCP**: Claude will call the Context7 MCP server using the available tools.

3. **Fallback Strategy**: Context7 takes absolute priority for documentation retrieval. Only if Context7 fails to provide the needed information (due to library not being available, server errors, or insufficient documentation coverage) should Claude fall back to web search as a secondary option.

4. **Contextual Injection**: The information retrieved from Context7 (or web search if Context7 fails) will be directly injected into the current context window.

5. **Synthesize and Respond**: Claude will then use this fresh, authoritative context to:
   - Generate the requested code
   - Answer the user's question accurately
   - Provide a detailed explanation based on the latest documentation
   - Offer validated code examples

### Implementation Notes

- Context7 MCP server is configured in `~/.claude.json` under the `mcpServers.context7` section
- Always use `mcp__context7__resolve-library-id` first to get the correct library ID
- Then use `mcp__context7__get-library-docs` with the resolved library ID
- This rule applies globally to all Claude Code sessions in any directory

# Claude Code MCP Server Guide

## Overview
This project uses multiple MCP (Model Context Protocol) servers to enhance Claude's capabilities. Think of MCP servers as specialized tools that give Claude superpowers - like giving a carpenter access to different power tools instead of just a hammer.

## Package Manager: Bun
**Always use Bun instead of npm/yarn:**
- `bun install` instead of `npm install`
- `bunx` instead of `npx`
- `bun run` instead of `npm run`
- `bun test` instead of `npm test`

## MCP Servers Configuration

### Core Development Servers

#### 1. GitHub
**Purpose:** Repository management and Git operations  
**When to use:**
- Creating pull requests
- Managing issues
- Reviewing code changes
- Automating Git workflows

**Setup required:**
```bash
# Set your GitHub token
export GITHUB_TOKEN="ghp_your_personal_access_token"
```

**Available capabilities:**
- File operations (create/update files)
- Repository management
- Search functionality
- Pull request and issue handling
- Fork repositories

#### 2. Puppeteer
**Purpose:** Browser automation and web scraping  
**When to use:**
- End-to-end testing
- Generating screenshots
- Web scraping (ethically)
- Testing responsive designs

**Analogy:** Like having a robot that can use your web app exactly like a human would - clicking buttons, filling forms, and checking if everything works.

**Available tools:**
- `puppeteer_navigate` - Navigate to pages
- `puppeteer_screenshot` - Capture screenshots
- `puppeteer_click` - Click elements
- Element interaction (hover, fill forms)
- JavaScript execution in browser

### Advanced Context Servers

#### 3. Context7
**Purpose:** Real-time documentation access and version-specific code examples  
**When to use:**
- Fetching up-to-date library documentation
- Getting version-specific code examples
- Accessing cutting-edge framework information
- Ensuring code uses latest best practices

**Key features:**
- Real-Time Documentation Access
- Version-Specific Code Examples
- Seamless integration with development workflow

**Analogy:** Like having a research assistant that instantly fetches the latest documentation and examples for any technology you're using.

#### 4. Task Master
**Purpose:** AI-powered task management system  
**When to use:**
- Breaking down complex projects into tasks
- Tracking progress on multi-step implementations
- Managing dependencies between tasks
- Creating PRDs (Product Requirements Documents)

**Analogy:** Like a GPS for your project - it shows you the whole map (zoomed out view) and lets you zoom into specific streets (detailed tasks).

**Key features:**
- Support for creating PRDs at `.taskmaster/docs/prd.txt`
- Research capabilities for finding latest best practices
- Task parsing and management within AI environments

#### 5. Exa MCP Server
**Purpose:** Advanced web search and information retrieval  
**When to use:**
- Finding latest industry standards and best practices
- Researching cutting-edge technologies
- Academic paper searches
- Company research

**Setup required:**
```bash
# Set your Exa API key
export EXA_API_KEY="your-api-key-here"
```

**Available tools:**
- `web_search_exa` - Real-time web searches
- `research_paper_search` - Academic paper search
- `company_research` - Company information gathering
- `crawling` - Extract content from specific URLs
- `competitor_finder` - Identify business competitors

#### 6. Knowledge Graph Memory
**Purpose:** Persistent memory with relationship mapping  
**When to use:**
- Building complex systems with interconnected components
- Maintaining relationships between different parts of your codebase
- Creating a knowledge base of project decisions and rationale

**Analogy:** Like a mind map that remembers not just information, but how everything connects - similar to how your brain links related concepts.

**Key features:**
- Entities as primary nodes in knowledge graph
- Relations define directed connections between entities
- Observations store discrete information about entities
- Persistent memory across chat sessions

#### 7. Magic UI MCP
**Purpose:** UI component generation and manipulation  
**When to use:**
- Rapidly prototyping UI components
- Generating TypeScript-safe component code
- Creating modern, industry-standard UI patterns

**Features:**
- 150+ free and open-source animated components
- Built with React, TypeScript, Tailwind CSS, and Motion
- Perfect companion for shadcn/ui

**Available tools:**
- `getComponents` - Core UI components
- `getDeviceMocks` - Device mock components
- `getSpecialEffects` - Special effect components
- `getAnimations` - Animation components

### Extended Development Servers

#### 8. Playwright MCP
**Purpose:** Advanced browser automation using accessibility tree navigation  
**When to use:**
- Modern browser automation with structured data
- E2E testing with semantic understanding
- Web scraping without pixel-based interactions
- Accessibility-focused testing

**Analogy:** Like having a robot that understands web pages the same way screen readers do - using semantic structure instead of visual recognition.

**Key advantages over Puppeteer:**
- Uses accessibility tree instead of screenshots
- No vision models needed
- More reliable than pixel-based automation
- Better for accessibility testing

**Available capabilities:**
- Browser navigation with semantic understanding
- Element interaction through accessibility tree
- Form automation with structured input
- Page analysis without visual processing

#### 9. Sequential Thinking MCP
**Purpose:** Structured problem-solving through sequential thinking processes  
**When to use:**
- Breaking down complex problems
- Systematic decision making
- Research planning and organization
- Project analysis with clear stages

**Analogy:** Like having a thinking framework that guides you through problem-solving stages, ensuring you don't skip important steps.

**Key stages:**
- Problem Definition - Clearly articulate the challenge
- Research - Gather relevant information
- Analysis - Examine data and options
- Synthesis - Combine insights into solutions
- Conclusion - Make final decisions

**Available tools:**
- `think` - Structured thinking process
- Thought tracking and progression
- Summary generation
- Progress monitoring

#### 10. Brave Search MCP
**Purpose:** Web and local search using Brave Search API  
**When to use:**
- Privacy-focused web searches
- Local business and location searches
- Alternative to Google Search
- Research with fresh, unbiased results

**Setup required:**
```bash
# Get API key from Brave Search API
export BRAVE_API_KEY="your-brave-api-key"
```

**Available tools:**
- `web_search` - General web search
- `local_search` - Location-based business search
- `news_search` - News and current events
- `image_search` - Image search capabilities

**Key advantages:**
- Privacy-focused search results
- No tracking or data collection
- Independent search index
- Local search with business details

## Best Practices

### 1. Start with the Big Picture
Always use Task Master first to map out your project structure. This aligns with your preference for understanding the whole picture before diving into details.

### 2. Use Context7 for Latest Documentation
Before implementing any solution, use Context7 to get the latest documentation:
```bash
# Context7 automatically fetches current docs
context7 get-docs "Next.js v14 authentication"
```

### 3. Research with Exa
Use Exa for current best practices and research:
```bash
exa search "TypeScript monorepo setup 2024 best practices"
```

### 4. Build Your Knowledge Graph
Document decisions and relationships:
```bash
kg-memory add "Chose Bun" --reason "Better TypeScript support, faster runtime"
kg-memory link "Bun" --to "Performance,DevExperience"
```

## Workflow Example

Here's a typical workflow combining MCP servers:

```bash
# 1. Start with project overview
task-master init "Modern SaaS Platform"

# 2. Get latest documentation
context7 get-docs "React v18 patterns"

# 3. Research best practices
exa search "SaaS architecture patterns 2024 TypeScript"

# 4. Setup GitHub repository
github create-repo "saas-platform" --private

# 5. Create high-level tasks
task-master add-task "Setup monorepo with Bun"
task-master add-task "Implement auth system"
task-master add-task "Setup authentication"

# 6. Generate UI components
magic-ui create "LoginForm" --typescript --modern

# 7. Write E2E tests
puppeteer create-test "auth-flow" --record

# 8. Document decisions
kg-memory add "Architecture: Monorepo" --relates-to "Bun,Turborepo"
kg-memory add "Database: PostgreSQL" --reason "ACID compliance, JSON support"

# 9. Create PR for review
github create-pr --title "Initial project setup" --reviewers "team"
```

## Complete Development Workflow

### Starting a New Feature

1. **Plan with Task Master** (Big Picture)
```bash
task-master create-feature "User Dashboard"
task-master add-subtask "Design database schema"
task-master add-subtask "Create API endpoints"  
task-master add-subtask "Build UI components"
task-master add-subtask "Write tests"
```

2. **Get Latest Documentation** (Stay Current)
```bash
context7 get-docs "React dashboard patterns"
exa search "dashboard UX patterns 2024"
```

3. **Create Feature Branch**
```bash
github create-branch "feature/user-dashboard"
```

4. **Frontend Development**
```bash
# Generate components
magic-ui create "DashboardWidget" --props "WidgetProps"
magic-ui create "WidgetGrid" --responsive --draggable

```

5. **Testing**
```bash
# Unit tests
bun test

# E2E tests
puppeteer test "dashboard-interactions" \
  --steps "login,navigate-dashboard,add-widget,drag-widget"
```

6. **Documentation & Memory**
```bash
# Document the implementation
kg-memory add "Dashboard Architecture" \
  --details "Widget-based, drag-and-drop, responsive grid"
  
kg-memory link "DashboardWidget" \
  --uses "React DnD,Tailwind,TypeScript"
```

7. **Code Review**
```bash
# Create PR
github create-pr \
  --title "Feature: User Dashboard" \
  --description "Implements widget-based dashboard with drag-and-drop" \
  --reviewers "senior-dev"
```

## Server Synergy Patterns

### Pattern 1: Documentation-Driven Development
```bash
# Get docs → Research → Test
context7 get-docs → exa search → puppeteer test
```

### Pattern 2: Research-Driven Architecture
```bash
# Research → Design → Document → Implement
exa search → task-master plan → kg-memory document
```

## Troubleshooting

### MCP Server Not Responding
```bash
# Check if server is running
ps aux | grep mcp

# Restart specific server
bunx @upstash/context7-mcp restart
```

### GitHub Authentication
```bash
# Verify token permissions
github test-auth

# Token should have: repo, workflow, read:org permissions
```

### Bun vs NPM Issues
If you accidentally use npm:
```bash
# Clean npm artifacts
rm -rf node_modules package-lock.json

# Reinstall with Bun
bun install
```

## Environment Setup

### Required Environment Variables
```bash
# Create .env file
cat > .env << EOF
# GitHub Access
GITHUB_TOKEN=ghp_your_personal_access_token

# Exa Search
EXA_API_KEY=exa_your_api_key

# Brave Search
BRAVE_API_KEY=brave_your_api_key

# Optional: Puppeteer
PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=false
PUPPETEER_EXECUTABLE_PATH=/path/to/chrome  # If using custom Chrome
EOF
```

### Initial Setup Commands
```bash
# 1. Install Bun (if not already installed)
curl -fsSL https://bun.sh/install | bash

# 2. Install all MCP servers
bunx @modelcontextprotocol/server-github --help
bunx @modelcontextprotocol/server-puppeteer --help
bunx @upstash/context7-mcp --help
bunx task-master-ai --help
bunx exa-mcp-server --help
bunx @modelcontextprotocol/server-memory --help
bunx @magicuidesign/mcp --help
bunx @playwright/mcp --help
bunx @modelcontextprotocol/server-sequential-thinking --help
bunx @modelcontextprotocol/server-brave-search --help

# 3. Verify setup
claude-code verify-mcp-setup
```

## Remember
- Always prefer `bunx` over `npx`
- Use Context7 for latest documentation before implementing
- Use MCP servers to enhance productivity, not replace thinking
- Keep the big picture in mind while leveraging these tools for details

## Quick Reference

### Core Development
- **github** - Git and GitHub operations  
- **puppeteer** - Browser automation and E2E testing
- **playwright** - Advanced browser automation with accessibility tree

### Advanced Context
- **context7** - Real-time documentation and examples
- **task-master** - Project planning and task management
- **exa** - Advanced web search and research
- **brave-search** - Privacy-focused web and local search
- **knowledge-graph** - Document relationships and decisions
- **magic-ui** - Generate TypeScript UI components
- **sequential-thinking** - Structured problem-solving

### Command Shortcuts
```bash
# Most common operations
gh = github  
pp = puppeteer
pw = playwright
c7 = context7
tm = task-master
exa = exa
brave = brave-search
kg = knowledge-graph
ui = magic-ui
st = sequential-thinking
```