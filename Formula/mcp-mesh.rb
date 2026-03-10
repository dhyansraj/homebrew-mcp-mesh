class McpMesh < Formula
  desc "Distributed service orchestration framework built on the Model Context Protocol"
  homepage "https://github.com/dhyansraj/mcp-mesh"
  url "https://github.com/dhyansraj/mcp-mesh/releases/download/v0.9.10/mcp-mesh_v0.9.10_darwin_arm64.tar.gz"
  sha256 "75888bab5c87e8f1491e08836c62f43368a6abdaac4040e2b1bd9e99fd4903aa"
  license "MIT"
  version "0.9.10"

  # Dependencies
  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dhyansraj/mcp-mesh/releases/download/v0.9.10/mcp-mesh_v0.9.10_darwin_amd64.tar.gz"
      sha256 "94dc24aa8506d57d3dbb0cd98d40275fd762981d092bad4032b2de9c4aa2602e"
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
