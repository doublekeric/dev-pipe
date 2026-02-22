# Project Environment Configuration

> 此文件描述项目的环境配置，在初始化时创建，后续可更新。

---

# {Project Name} Environment

## Environments

### Development (开发环境)

- **Server**: {dev server address}
- **Database**: {dev database}
- **Config**: {dev config path}
- **Access**: {how to access}

### Testing (测试环境)

- **Server**: {test server address}
- **Database**: {test database}
- **Config**: {test config path}
- **Access**: {how to access}

### Production (生产环境)

- **Server**: {prod server address}
- **Database**: {prod database}
- **Config**: {prod config path}
- **Access**: {who can access}

---

## Build Configuration

### Development Build

```
{Build command or steps}
```

### Release Build

```
{Build command or steps}
```

---

## Tools

### Version Control

- **System**: {Git / SVN / Other}
- **Repository**: {URL}
- **Branch Strategy**: {Git Flow / GitHub Flow / Other}

### CI/CD

- **System**: {Jenkins / GitHub Actions / Other}
- **Config**: {path to config}
- **Triggers**: {when builds run}

### Code Review

- **Tool**: {GitHub PR / GitLab MR / Other}
- **Process**: {description}

---

## Local Development Setup

### Prerequisites

- {Requirement 1}
- {Requirement 2}

### Setup Steps

```
1. {Step 1}
2. {Step 2}
3. {Step 3}
```

### Common Issues

| Issue | Solution |
|-------|----------|
| {Problem} | {How to fix} |

---

## Configuration Files

| File | Purpose | Environment |
|------|---------|-------------|
| `{path}` | {what it configures} | {dev/test/prod} |

---

## Secrets Management

- **Method**: {How secrets are managed}
- **Location**: {Where secrets are stored}
- **Access**: {Who has access}

---

## When to Update

此文件应在以下情况更新：

1. **环境变化** - 服务器地址、配置变更
2. **新工具** - 引入新的开发工具
3. **流程变化** - CI/CD 流程调整

### How to Update

```
/pipe update-environment
```

---

## History

| Date | Change | By |
|------|--------|-----|
| {date} | Initial config | {who} |
