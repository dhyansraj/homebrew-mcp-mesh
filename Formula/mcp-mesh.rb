class McpMesh < Formula
  desc "Distributed service orchestration framework built on the Model Context Protocol"
  homepage "https://github.com/dhyansraj/mcp-mesh"
  url "https://github.com/dhyansraj/mcp-mesh/releases/download/v0.5.2-fixed-cache/mcp-mesh_v0.5.2-fixed-cache_darwin_arm64.tar.gz"
  sha256 "ade3feb48f9176f674210ae670c3c997c8c49210318ae17158df337c1002a020"
  license "MIT"
  version "0.5.2-fixed-cache"

  # Dependencies
  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dhyansraj/mcp-mesh/releases/download/v0.5.2-fixed-cache/mcp-mesh_v0.5.2-fixed-cache_darwin_amd64.tar.gz"
      sha256 "2a2339debe6a0aa8b69f587f00bf0c515bd4215cb39d43104d2d4c1e29b95662"
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