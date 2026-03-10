class McpMesh < Formula
  desc "Distributed service orchestration framework built on the Model Context Protocol"
  homepage "https://github.com/dhyansraj/mcp-mesh"
  url "https://github.com/dhyansraj/mcp-mesh/releases/download/v0.9.11/mcp-mesh_v0.9.11_darwin_arm64.tar.gz"
  sha256 "2b3a6bd25e0910069eb701a5a4a5d13e852be2312ae1cd777f1e6622827a78cd"
  license "MIT"
  version "0.9.11"

  # Dependencies
  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dhyansraj/mcp-mesh/releases/download/v0.9.11/mcp-mesh_v0.9.11_darwin_amd64.tar.gz"
      sha256 "2b63121ec2ddbbc70d181ab997c7de1a50ca6db90d9975c9303bb8dc4adae4f4"
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
