# Homebrew formula for olang, generated from dist/homebrew/olang.rb.tmpl
# in the olang repo by the release workflow's `homebrew` job (version
# and checksums from the release's SHA256SUMS), and pushed to
# Formula/olang.rb in the ooyeku/homebrew-olang tap. Edit the template,
# never the tap copy; the next release propagates it.
class Olang < Formula
  desc "Dynamically typed functional language with a tiered interpreter/VM/JIT runtime"
  homepage "https://github.com/ooyeku/olang"
  license "MIT"
  version "1.0.1"

  on_macos do
    on_arm do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-macos-arm64.tar.gz"
      sha256 "3bf07efacecc79892bbfd136f7ac2df4f8e992a76a4c65ef2c79987061ee525f"
    end
    on_intel do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-macos-x64.tar.gz"
      sha256 "6b7178b5a86b5ab1de483443797cf96db17bb55997985f519d33e7e444b50666"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-linux-arm64.tar.gz"
      sha256 "c55b23f6d57540f2f93d00b5d8be81d942b1c629ed3ba2534d6db9959da26687"
    end
    on_intel do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-linux-x64.tar.gz"
      sha256 "8b5af4b25d3b39c14d3be13ad9dbf579127ee230b6c48ebc28a31656a4699c73"
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
