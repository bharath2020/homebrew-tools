class SimproxyBeta < Formula
  include Language::Python::Virtualenv

  desc "Intercept and inspect iOS Simulator network traffic from the command-line"
  homepage "https://github.com/bharath2020/simproxy"
  url "https://github.com/bharath2020/simproxy/archive/refs/tags/v0.1.0-beta.1.tar.gz"
  sha256 "4ce7ea97ce6e552184267c80b998670765e1276b8bfb70d9b26de0de9608122f"
  license "MIT"
  head "https://github.com/bharath2020/simproxy.git", branch: "main"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      simproxy requires mitmdump at runtime.

      Install it with:
        brew install --cask mitmproxy
    EOS
  end

  test do
    assert_match "simproxy", shell_output("#{bin}/simproxy --version")
  end
end
