class Jaala < Formula
  include Language::Python::Virtualenv

  desc "iOS Simulator network testing for contract, replay, and failure scenarios"
  homepage "https://github.com/bharath2020/jaala"
  url "https://github.com/bharath2020/jaala.git",
      tag:      "v0.2.0",
      revision: "fd779f9fc36ceccb8738ac6da017e01b1ba5307a"
  license "MIT"
  head "https://github.com/bharath2020/jaala.git", branch: "main"

  depends_on "python-setuptools"
  depends_on "python@3.13"

  def install
    venv = virtualenv_create(libexec, "python3.13")
    venv.pip_install_and_link buildpath, build_isolation: false
  end

  def caveats
    <<~EOS
      jaala requires mitmdump at runtime and AXe for the bundled validation scripts.

      Install mitmproxy with:
        brew install --cask mitmproxy
    EOS
  end

  test do
    assert_match "jaala 0.2.0", shell_output("#{bin}/jaala --version")
  end
end
