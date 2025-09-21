class McpMesh < Formula
  desc "Distributed service orchestration framework built on the Model Context Protocol"
  homepage "https://github.com/dhyansraj/mcp-mesh"
  url "https://github.com/dhyansraj/mcp-mesh/releases/download/v0.5.5/mcp-mesh_v0.5.5_darwin_arm64.tar.gz"
  sha256 "e0de7e2b7b46e0d45969f94456b3d2f3a887fb374a7ab017f4c3091096c00f8b"
  license "MIT"
  version "0.5.5"

  # Dependencies
  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dhyansraj/mcp-mesh/releases/download/v0.5.5/mcp-mesh_v0.5.5_darwin_amd64.tar.gz"
      sha256 "17b6072f9eeaf223a3809b7a2a3657eb32d6645b770b19f065c8a7ac4428301d"
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
