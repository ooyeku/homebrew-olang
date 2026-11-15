# Homebrew formula for olang, generated from dist/homebrew/olang.rb.tmpl
# in the olang repo by the release workflow's `homebrew` job (version
# and checksums from the release's SHA256SUMS), and pushed to
# Formula/olang.rb in the ooyeku/homebrew-olang tap. Edit the template,
# never the tap copy; the next release propagates it.
class Olang < Formula
  desc "Dynamically typed functional language with a tiered interpreter/VM/JIT runtime"
  homepage "https://github.com/ooyeku/olang"
  license "MIT"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-macos-arm64.tar.gz"
      sha256 "db25100bf110283e8bc1d562af7d5d6662cd9616b984a04620b3ffb4a742a119"
    end
    on_intel do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-macos-x64.tar.gz"
      sha256 "22f954f5d5400eb608e03ac82317ee17b35770373c26d903e4ce9e562170360a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-linux-arm64.tar.gz"
      sha256 "289024f3ff5fa137e9eddb7b15e04ba8b5ddd788214be57bffb5d3995def2f1c"
    end
    on_intel do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-linux-x64.tar.gz"
      sha256 "11be7bc3cb8d735e1886fbc1edfc655ac7b11320cf3e49c22f6f7da157058ff4"
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
