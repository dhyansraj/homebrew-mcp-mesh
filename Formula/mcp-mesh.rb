class McpMesh < Formula
  desc "Distributed service orchestration framework built on the Model Context Protocol"
  homepage "https://github.com/dhyansraj/mcp-mesh"
  url "https://github.com/dhyansraj/mcp-mesh/releases/download/v1.2.0/mcp-mesh_v1.2.0_darwin_arm64.tar.gz"
  sha256 "bf7c6db085cc79e418fbcfa85daa03350a1f9934b8d769835bc8c1e97dad6a9d"
  license "MIT"
  version "1.2.0"

  # Dependencies
  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dhyansraj/mcp-mesh/releases/download/v1.2.0/mcp-mesh_v1.2.0_darwin_amd64.tar.gz"
      sha256 "e9d894fe6c0b337149a3f64625f2563ee898b007c400c14bcdecbf537abf8741"
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
