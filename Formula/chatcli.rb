# typed: false
# frozen_string_literal: true

# Homebrew formula for ChatCLI
# Repository: https://github.com/diillson/chatcli
class Chatcli < Formula
  desc "Command-line interface for interacting with multiple LLM providers"
  homepage "https://chatcli.edilsonfreitas.com"
  license "Apache-2.0"
  version "1.182.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diillson/chatcli/releases/download/v#{version}/chatcli-darwin-arm64"
      sha256 "b599ab5265cfcbe52d01fef42572536772bebde8102b27baf739011264b46b95"

      def install
        bin.install "chatcli-darwin-arm64" => "chatcli"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/diillson/chatcli/releases/download/v#{version}/chatcli-darwin-amd64"
      sha256 "ede600f58c6ddbeb4d463c7c4f4297ef8f732d17af5cabea6dda082b08b84792"

      def install
        bin.install "chatcli-darwin-amd64" => "chatcli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/diillson/chatcli/releases/download/v#{version}/chatcli-linux-amd64"
      sha256 "7609d1949eeb00a752c87536f4f743c6c26f4ac3c7048e3264304778e1d0f307"

      def install
        bin.install "chatcli-linux-amd64" => "chatcli"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chatcli --version 2>&1", 0)
  end
end
