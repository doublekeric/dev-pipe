# {System Name} System

> Template for documenting a game system.

## Responsibility

{One sentence describing what this system does}

## Core Features

- Feature 1: {Description}
- Feature 2: {Description}
- Feature 3: {Description}

## Data Structures

### Core Data

```
{DataStructureName}
- field1: {description}
- field2: {description}
```

### Example

```json
{
  "field1": "value1",
  "field2": 100
}
```

## Code Location

```
Assets/Scripts/Systems/{SystemName}/
├── {SystemName}Data.cs      # Data structures
├── {SystemName}Manager.cs   # Manager/Controller
└── {SystemName}UI.cs        # UI (if applicable)
```

## Dependencies

### Depends On

- {System A}: {Why depends on it}
- {System B}: {Why depends on it}

### Depended By

- {System C}: {Why it depends on this}
- {System D}: {Why it depends on this}

## Interfaces

### Public Interface

| Method | Parameters | Returns | Description |
|--------|------------|---------|-------------|
| {Method1} | {params} | {return} | {desc} |
| {Method2} | {params} | {return} | {desc} |

### Events

| Event | When Fired | Payload |
|-------|------------|---------|
| {Event1} | {when} | {data} |

## Configuration

### Related Config Tables

- {Table1}: {Description}
- {Table2}: {Description}

### Config Path

```
Config/{path}/
```

## Notes

- {Important note 1}
- {Important note 2}
- {Known limitation}
