class McpMesh < Formula
  desc "Distributed service orchestration framework built on the Model Context Protocol"
  homepage "https://github.com/dhyansraj/mcp-mesh"
  url "https://github.com/dhyansraj/mcp-mesh/releases/download/v0.5.1/mcp-mesh_v0.5.1_darwin_arm64.tar.gz"
  sha256 "YOUR_SHA256_HERE"
  license "MIT"
  version "0.5.1"

  # Dependencies
  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dhyansraj/mcp-mesh/releases/download/v0.5.1/mcp-mesh_v0.5.1_darwin_amd64.tar.gz"
      sha256 "YOUR_INTEL_SHA256_HERE"
    end
  end

  def install
    # Install meshctl CLI
    bin.install "meshctl"
    
    # Install registry binary
    bin.install "registry" => "mcp-mesh-registry"
    
    # Create man pages directory and install documentation (if available)
    # man1.install "meshctl.1" if File.exist?("meshctl.1")
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