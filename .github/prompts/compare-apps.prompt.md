---
mode: agent
---

# Compare Applications

Compare **$ARGUMENTS** (two app names separated by space) to learn patterns and find differences.

## Usage

```
Compare: beszel paperless-ngx
```

## Comparison Points

### 1. Structure Complexity
- Simple (no form_fields) vs Complex (many form_fields)
- Single service vs Multi-service (database, redis, etc.)

### 2. config.json Comparison

| Property | App 1 | App 2 |
|----------|-------|-------|
| categories | | |
| form_fields count | | |
| uid/gid | | |
| exposable | | |
| no_gui | | |

### 3. docker-compose.json Comparison

| Property | App 1 | App 2 |
|----------|-------|-------|
| Services count | | |
| Has healthCheck | | |
| Volume count | | |
| Environment vars | | |

### 4. Pattern Learning

Show examples of:
- How form_fields are structured
- How multi-service apps handle dependencies
- How environment variables are mapped

## Report Format

```
Comparison: beszel vs paperless-ngx
===================================

Complexity:
  beszel: Simple (0 form_fields, 1 service)
  paperless-ngx: Complex (15 form_fields, 4 services)

Key Differences:
  ┌─────────────────┬──────────┬───────────────┐
  │ Property        │ beszel   │ paperless-ngx │
  ├─────────────────┼──────────┼───────────────┤
  │ form_fields     │ 0        │ 15            │
  │ services        │ 1        │ 4             │
  │ uid/gid         │ No       │ Yes (1000)    │
  │ volumes         │ 1        │ 5             │
  │ healthCheck     │ No       │ Yes           │
  └─────────────────┴──────────┴───────────────┘

Patterns to Learn:
  From paperless-ngx:
  - Database service pattern with dependsOn
  - Redis integration for caching
  - Complex form_fields with validation
  - Health check configuration
```

## Use Cases

- **Learning patterns**: Compare simple app with complex one
- **Troubleshooting**: Compare working app with broken one
- **Consistency check**: Ensure similar apps follow same patterns
