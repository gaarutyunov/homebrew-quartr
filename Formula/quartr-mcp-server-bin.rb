class QuartrMcpServerBin < Formula
  desc "MCP server for Quartr API providing financial data and company information (binary)"
  homepage "https://github.com/gaarutyunov/quartr-mcp"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/gaarutyunov/quartr-mcp/releases/download/v1.0.1/index-macos"
      sha256 "bdcd67e96b77dc639785447f61c4221a4eb621bb1fe3bc2d95e857d2b19ef7f3"
    elsif Hardware::CPU.arm?
      url "https://github.com/gaarutyunov/quartr-mcp/releases/download/v1.0.1/index-macos"
      sha256 "bdcd67e96b77dc639785447f61c4221a4eb621bb1fe3bc2d95e857d2b19ef7f3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gaarutyunov/quartr-mcp/releases/download/v1.0.1/index-linux"
      sha256 "c1a2654859cc40c78ec1d7bb08ac18d29a78f96ffc10a717043f7e5c2177f438"
    end
  end

  def install
    if OS.mac?
      bin.install "index-macos" => "quartr-mcp-server"
    elsif OS.linux?
      bin.install "index-linux" => "quartr-mcp-server"
    end
    
    # Make sure the binary is executable
    chmod 0755, bin/"quartr-mcp-server"
  end

  test do
    # Test that the binary exists and is executable
    assert_predicate bin/"quartr-mcp-server", :exist?
    assert_predicate bin/"quartr-mcp-server", :executable?
    
    # Test version output (if your app supports --version)
    # system "#{bin}/quartr-mcp-server", "--version"
  end
end
