class Jaala < Formula
  include Language::Python::Virtualenv

  desc "iOS Simulator network testing for contract, replay, and failure scenarios"
  homepage "https://github.com/bharath2020/jaala"
  url "https://github.com/bharath2020/jaala.git",
      tag:      "v0.1.0",
      revision: "264207fa6042d7f270ea00e9fdc363436689fd71"
  license "MIT"
  head "https://github.com/bharath2020/jaala.git", branch: "main"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      jaala requires mitmdump at runtime and AXe for the bundled validation scripts.

      Install mitmproxy with:
        brew install --cask mitmproxy
    EOS
  end

  test do
    assert_match "jaala 0.1.0", shell_output("#{bin}/jaala --version")
  end
end
