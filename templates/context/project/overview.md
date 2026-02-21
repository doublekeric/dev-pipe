# Project Overview

> Initialize this file when setting up DevPipe for a new project.

## Basic Information

- **Project Name**: {Your project name}
- **Project Type**: {e.g., Card RPG, Casual Game, MMO}
- **Target Platform**: {iOS / Android / PC / Web}
- **Game Engine**: {Unity 2021.3 LTS / Unreal 5 / Custom}
- **Development Stage**: {Prototype / Development / Testing / Live}

## Core Gameplay Loop

Describe the main gameplay loop:

```
{Action 1} → {Action 2} → {Action 3} → {Back to Action 1}

Example:
Draw Cards → Build Deck → Battle → Earn Rewards → Draw Cards
```

## Technology Stack

### Client

- **Language**: {C# / C++ / Other}
- **Frameworks**: {UniRx, DoTween, Addressables, etc.}
- **Architecture**: {MVC, MVVM, ECS, etc.}
- **Network**: {WebSocket, HTTP, gRPC, etc.}

### Server

- **Language**: {Go, Java, Node.js, etc.}
- **Database**: {MySQL, Redis, MongoDB, etc.}
- **Architecture**: {Microservices, Monolith, etc.}

### Tools

- **Config Format**: {Excel → JSON, Excel → Protobuf, etc.}
- **Build System**: {Jenkins, GitHub Actions, etc.}
- **Version Control**: {Git flow, GitHub flow, etc.}

## Directory Structure

```
Assets/
├── Scripts/
│   ├── Core/           # Core framework
│   ├── Systems/        # Game systems
│   ├── UI/             # UI logic
│   └── Utils/          # Utilities
├── Resources/          # Resource files
├── Prefabs/            # Prefabs
└── Art/                # Art assets
```

## Coding Standards

### Naming

- Classes: PascalCase (`InventoryManager`)
- Methods: PascalCase (`GetItemCount`)
- Private fields: _camelCase (`_itemList`)
- Constants: UPPER_CASE (`MAX_COUNT`)

### Comments

- Use XML documentation for public APIs
- Explain "why" not "what"

### File Organization

- One class per file
- File name matches class name

## Key Contacts

- **Tech Lead**: {Name}
- **Issues**: {Issue tracker URL}
