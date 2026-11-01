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
  version "1.0.0-rc.7"

  on_macos do
    on_arm do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-macos-arm64.tar.gz"
      sha256 "a3b9920c857b7e6dd6370b0675cffca1d062a474504b2a76bd7a74fabc1e57f8"
    end
    on_intel do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-macos-x64.tar.gz"
      sha256 "15fe48d5a8e35846c13b3e1023e26293b09d72a1e8dcdc33c3cbc0fdaf0c0340"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-linux-arm64.tar.gz"
      sha256 "58255d965cf8b05ec67bae1d03133210cbecb777199cddd40d3f52f771d2102e"
    end
    on_intel do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-linux-x64.tar.gz"
      sha256 "56d48b0692f16a0fd0a18009d87bd3b03cee2e38b62aa608e3c25109e1d78e65"
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
