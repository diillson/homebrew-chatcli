# typed: false
# frozen_string_literal: true

# Homebrew formula for ChatCLI
# Repository: https://github.com/diillson/chatcli
class Chatcli < Formula
  desc "Command-line interface for interacting with multiple LLM providers"
  homepage "https://chatcli.edilsonfreitas.com"
  license "Apache-2.0"
  version "1.200.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/diillson/chatcli/releases/download/v#{version}/chatcli-darwin-arm64"
      sha256 "a919b6be7d7be5b7e1d5593a05e57fb3cb8ffa554c9755d66402cdca927043e1"

      def install
        bin.install "chatcli-darwin-arm64" => "chatcli"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/diillson/chatcli/releases/download/v#{version}/chatcli-darwin-amd64"
      sha256 "9a72f5bb920c614022b5368383297ac29663e9fdf43f90358e49661ffff3f4dc"

      def install
        bin.install "chatcli-darwin-amd64" => "chatcli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/diillson/chatcli/releases/download/v#{version}/chatcli-linux-amd64"
      sha256 "439d55e7e9e9d21639b8c861c5132cfb612d937b4021ccb679ac1dc7d1295fff"

      def install
        bin.install "chatcli-linux-amd64" => "chatcli"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chatcli --version 2>&1", 0)
  end
end
