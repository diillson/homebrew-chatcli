# typed: false
# frozen_string_literal: true

# Homebrew formula for ChatCLI
# Repository: https://github.com/diillson/chatcli
class Chatcli < Formula
  desc "Command-line interface for interacting with multiple LLM providers"
  homepage "https://chatcli.edilsonfreitas.com"
  license "Apache-2.0"
  version "1.111.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diillson/chatcli/releases/download/v#{version}/chatcli-darwin-arm64"
      sha256 "f176525fc99613bd8a775b1b01fcb35fe314c76aa8eaae16e1db0bd17837638f"

      def install
        bin.install "chatcli-darwin-arm64" => "chatcli"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/diillson/chatcli/releases/download/v#{version}/chatcli-darwin-amd64"
      sha256 "b26b6c67953d1978af48db3d0882d3097bd52c92ce2b8ddeebdca6d124f7a87d"

      def install
        bin.install "chatcli-darwin-amd64" => "chatcli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/diillson/chatcli/releases/download/v#{version}/chatcli-linux-amd64"
      sha256 "00d0bcbe4e9af33336a7d98cffde5d02198f9a1061df93aa3b7f5f7a7f44c79d"

      def install
        bin.install "chatcli-linux-amd64" => "chatcli"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chatcli --version 2>&1", 0)
  end
end
