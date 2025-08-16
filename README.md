# MCP Mesh Homebrew Tap

This is the official Homebrew tap for [MCP Mesh](https://github.com/dhyansraj/mcp-mesh) - a distributed service orchestration framework built on the Model Context Protocol.

## Installation

```bash
# Add the tap
brew tap dhyansraj/mcp-mesh

# Install MCP Mesh
brew install mcp-mesh
```

## What gets installed

- **`meshctl`** - CLI tool for managing MCP Mesh deployments
- **`mcp-mesh-registry`** - Registry service for service discovery and health monitoring

## Usage

```bash
# Start the registry service
mcp-mesh-registry

# Use the CLI tool
meshctl --help
meshctl status
```

## Updating

```bash
# Update the tap
brew update

# Upgrade MCP Mesh
brew upgrade mcp-mesh
```

## Uninstalling

```bash
# Remove MCP Mesh
brew uninstall mcp-mesh

# Remove the tap (optional)
brew untap dhyansraj/mcp-mesh
```

## About MCP Mesh

MCP Mesh enables seamless dependency injection, service discovery, and inter-service communication for AI agents and microservices. Built on the Model Context Protocol (MCP), it provides a unified framework for distributed system orchestration.

- **Documentation**: [GitHub Repository](https://github.com/dhyansraj/mcp-mesh)
- **Issues**: [Report issues](https://github.com/dhyansraj/mcp-mesh/issues)
- **Discussions**: [Community discussions](https://github.com/dhyansraj/mcp-mesh/discussions)

## Formula Maintenance

This formula is automatically updated by the MCP Mesh release pipeline. Manual updates are not required.