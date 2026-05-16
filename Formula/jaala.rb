class Jaala < Formula
  include Language::Python::Virtualenv

  desc "iOS Simulator network testing for contract, replay, and failure scenarios"
  homepage "https://github.com/bharath2020/jaala"
  url "file://#{__dir__}/../dist/jaala-0.2.3.tar.gz"
  sha256 "e9b2644dd608e3ddda676ce6d1c693abd9aeb74f6fbca81f332b810c2bfaed6e"
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
      jaala requires mitmdump at runtime and AXe for bundled validation scripts.

      The install-jaala.sh script installs those tools automatically. If you installed
      this formula directly, also run:
        brew install --cask mitmproxy
        brew install cameroncooke/axe/axe
    EOS
  end

  test do
    assert_match "jaala 0.2.3", shell_output("#{bin}/jaala --version")
  end
end
