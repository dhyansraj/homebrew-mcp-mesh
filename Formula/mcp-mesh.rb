class McpMesh < Formula
  desc "Distributed service orchestration framework built on the Model Context Protocol"
  homepage "https://github.com/dhyansraj/mcp-mesh"
  url "https://github.com/dhyansraj/mcp-mesh/releases/download/v3.7.1/mcp-mesh_v3.7.1_darwin_arm64.tar.gz"
  sha256 "0bbc6bebcaae5a9efd37c1aa17cc979b15a7421a9c3e8aa3cebd08511412a92b"
  license "MIT"
  version "3.7.1"

  # Dependencies
  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dhyansraj/mcp-mesh/releases/download/v3.7.1/mcp-mesh_v3.7.1_darwin_amd64.tar.gz"
      sha256 "1c0d90e67300273a3b54a0dd83f374f6f053bca696c9cae611a68baaee6941b2"
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
