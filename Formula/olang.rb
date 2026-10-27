# Homebrew formula template for olang. The canonical copy lives in the
# olang repo; the release workflow's `homebrew` job substitutes the
# 1.0.0-rc.5 and @SHA_*@ placeholders from the fresh SHA256SUMS and
# pushes the result to Formula/olang.rb in the ooyeku/homebrew-olang
# tap. Edit this file — never the tap copy — and the next release
# propagates it.
class Olang < Formula
  desc "Dynamically typed functional language with a tiered interpreter/VM/JIT runtime"
  homepage "https://github.com/ooyeku/olang"
  license "MIT"
  version "1.0.0-rc.5"

  on_macos do
    on_arm do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-macos-arm64.tar.gz"
      sha256 "d79aa20c4d3ab30b4ef9f0855cdc6d78fc485c8c79136b5cb217a6e2768b6f51"
    end
    on_intel do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-macos-x64.tar.gz"
      sha256 "1b0fc6eaf5a968e7df55ce08e7ceb68a63396355ff22ec2f149ae9b967949226"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-linux-arm64.tar.gz"
      sha256 "7bad3e77a9bec6c3459d4cf9a5b80a595588f551f1109be1f3c9c2936a4f8002"
    end
    on_intel do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-linux-x64.tar.gz"
      sha256 "8502a83e886b36a1ebf75d5ab3b7050ba6fb3096b286671b565aabe27e605205"
    end
  end

  def install
    bin.install "olang", "otc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/olang --version")
    assert_match version.to_s, shell_output("#{bin}/otc --version")
  end
end
