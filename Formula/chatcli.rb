# typed: false
# frozen_string_literal: true

# Homebrew formula for ChatCLI
# Repository: https://github.com/diillson/chatcli
class Chatcli < Formula
  desc "Command-line interface for interacting with multiple LLM providers"
  homepage "https://chatcli.edilsonfreitas.com"
  license "Apache-2.0"
  version "1.128.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diillson/chatcli/releases/download/v#{version}/chatcli-darwin-arm64"
      sha256 "7b5958ddba45448c676274287f11265f142892e6757986a5db8e0914b0a0c433"

      def install
        bin.install "chatcli-darwin-arm64" => "chatcli"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/diillson/chatcli/releases/download/v#{version}/chatcli-darwin-amd64"
      sha256 "0250005ec9b052d56fccedca363d80b4696625ce9f72cbbcbf86c5e2d5449ef3"

      def install
        bin.install "chatcli-darwin-amd64" => "chatcli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/diillson/chatcli/releases/download/v#{version}/chatcli-linux-amd64"
      sha256 "b27cd16d6949daf3a82100a99f1ef490aab4aa442997e8b8c30e5770bb20c458"

      def install
        bin.install "chatcli-linux-amd64" => "chatcli"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chatcli --version 2>&1", 0)
  end
end
