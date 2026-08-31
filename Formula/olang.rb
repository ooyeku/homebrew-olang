# Generated from dist/homebrew/olang.rb.tmpl in ooyeku/olang for
# v0.79.0. Future releases are pushed here by the release workflow.
class Olang < Formula
  desc "Dynamically typed functional language with a tiered interpreter/VM/JIT runtime"
  homepage "https://github.com/ooyeku/olang"
  license "MIT"
  version "0.79.0"

  on_macos do
    on_arm do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-macos-arm64.tar.gz"
      sha256 "6ca188318252fbd46f557418c0818da2d223d68a83b659151468f9b67b5ec29e"
    end
    on_intel do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-macos-x64.tar.gz"
      sha256 "cb8685eafc3ee079a3c23f5e6a359b574289c830e15f7f0e18b3749f995dc276"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ooyeku/olang/releases/download/v#{version}/olang-#{version}-linux-x64.tar.gz"
      sha256 "ee894cf42a0088c4d606ac8afaba2056cdc7a31afdbf95fab242f0219a524f8f"
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
