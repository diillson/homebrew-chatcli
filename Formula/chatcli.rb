# typed: false
# frozen_string_literal: true

# Homebrew formula for ChatCLI
# Repository: https://github.com/diillson/chatcli
class Chatcli < Formula
  desc "Command-line interface for interacting with multiple LLM providers"
  homepage "https://chatcli.edilsonfreitas.com"
  license "Apache-2.0"
  version "1.145.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diillson/chatcli/releases/download/v#{version}/chatcli-darwin-arm64"
      sha256 "320a0e11c3ea1f50c23bb0845edd9c0136b3400583338b2701bb0034e797a15e"

      def install
        bin.install "chatcli-darwin-arm64" => "chatcli"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/diillson/chatcli/releases/download/v#{version}/chatcli-darwin-amd64"
      sha256 "1c7f773c4745d56303d2057e993aae22e1e560e02993d6eeb1669de24b593821"

      def install
        bin.install "chatcli-darwin-amd64" => "chatcli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/diillson/chatcli/releases/download/v#{version}/chatcli-linux-amd64"
      sha256 "70f499212110c1ec1ce5e2af630f64b6716217e1362378772803fa520592c0e1"

      def install
        bin.install "chatcli-linux-amd64" => "chatcli"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chatcli --version 2>&1", 0)
  end
end
