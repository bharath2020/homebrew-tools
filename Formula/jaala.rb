class Jaala < Formula
  include Language::Python::Virtualenv

  desc "iOS Simulator network testing for contract, replay, and failure scenarios"
  homepage "https://github.com/bharath2020/jaala"
  url "file://#{__dir__}/../dist/jaala-0.2.1.tar.gz"
  sha256 "6151688a88a8dd01fb9ed3a351ba13a559abd13d296ab68820febf8e639ac280"
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
    assert_match "jaala 0.2.1", shell_output("#{bin}/jaala --version")
  end
end
