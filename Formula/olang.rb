# Homebrew formula for olang, generated from dist/homebrew/olang.rb.tmpl
# in the olang repo by the release workflow's `homebrew` job (version
# and checksums from the release's SHA256SUMS), and pushed to
# Formula/olang.rb in the ooyeku/homebrew-olang tap. Edit the template,
# never the tap copy; the next release propagates it.
class Olang < Formula
  desc "Dynamically typed functional language with a tiered interpreter/VM/JIT runtime"
  homepage "https://github.com/ooyeku/olang"
  license "MIT"
  version "1.0.0-rc.9"

  on_macos do
    on_arm do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-macos-arm64.tar.gz"
      sha256 "0d6375c91f2b2f94adfb6a631e73fb0a862b2feb09692faebca70289c3852a4f"
    end
    on_intel do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-macos-x64.tar.gz"
      sha256 "64111a9b9cdcd6daa555d723e3e67e8984f8928b27608f3eb5a73d2954f3842d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-linux-arm64.tar.gz"
      sha256 "d93a3fa6c541fc102604c1bbe42aa66b1dd8ea6dc851064181c679da72971802"
    end
    on_intel do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-linux-x64.tar.gz"
      sha256 "4dfd2e010573a7aec98a82f4dfb0113bcf8523045e373bff65018c3ea89b7625"
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
