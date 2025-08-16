class McpMesh < Formula
  desc "Distributed service orchestration framework built on the Model Context Protocol"
  homepage "https://github.com/dhyansraj/mcp-mesh"
  url "https://github.com/dhyansraj/mcp-mesh/releases/download/v0.5.2-with-path-fix/mcp-mesh_v0.5.2-with-path-fix_darwin_arm64.tar.gz"
  sha256 "06233443d5955f495201253d2dd3a22c75bd5ac2a1325e99f6b93b6c7f727b8f"
  license "MIT"
  version "0.5.2-with-path-fix"

  # Dependencies
  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dhyansraj/mcp-mesh/releases/download/v0.5.2-with-path-fix/mcp-mesh_v0.5.2-with-path-fix_darwin_amd64.tar.gz"
      sha256 "f7652f97fdd5348f2690c9f65d8ea228cd15d228b1b6fa88845c7f9b99cf0868"
    end
  end

  def install
    # Install meshctl CLI
    bin.install "meshctl"

    # Install registry binary
    bin.install "mcp-mesh-registry"
  end

  def caveats
    <<~EOS
      MCP Mesh has been installed with two binaries:
        • meshctl         - CLI tool for managing MCP Mesh
        • mcp-mesh-registry - Registry service for service discovery

      To start the registry service:
        mcp-mesh-registry

      To use the CLI:
        meshctl --help

      For more information:
        https://github.com/dhyansraj/mcp-mesh/blob/main/README.md
    EOS
  end

  test do
    # Test that the binaries are installed and can show version/help
    system "#{bin}/meshctl", "--help"
    system "#{bin}/mcp-mesh-registry", "--help"
  end
end
