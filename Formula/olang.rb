# Homebrew formula template for olang. The canonical copy lives in the
# olang repo; the release workflow's `homebrew` job substitutes the
# 0.80.0 and @SHA_*@ placeholders from the fresh SHA256SUMS and
# pushes the result to Formula/olang.rb in the ooyeku/homebrew-olang
# tap. Edit this file — never the tap copy — and the next release
# propagates it.
class Olang < Formula
  desc "Dynamically typed functional language with a tiered interpreter/VM/JIT runtime"
  homepage "https://github.com/ooyeku/olang"
  license "MIT"
  version "0.80.0"

  on_macos do
    on_arm do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-macos-arm64.tar.gz"
      sha256 "d8cc0cd01fd5c1613dcb259b7d0cb87971a3279ee13d1a63de99e241ce1c5d4a"
    end
    on_intel do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-macos-x64.tar.gz"
      sha256 "80b20f8f2e66e3cbe2819e99ff9f4935e8222f8259d4ee4d3082a756194cbf5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-linux-arm64.tar.gz"
      sha256 "e19ddbddb81773b344c6418211b46e29e2304b946af0bbaa45a3628f67a6ac28"
    end
    on_intel do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-linux-x64.tar.gz"
      sha256 "20b39abc4b7be3d6e53d43868dd02176f96622b099d721ca16caf2396bfe1d48"
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
