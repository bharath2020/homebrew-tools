class AdfAuth < Formula
  desc "Sign in to Atlassian, keep API tokens in the keychain, and pair ADFReader by QR"
  homepage "https://github.com/bharath2020/connie-adf"
  url "https://github.com/bharath2020/connie-adf/archive/refs/tags/adf-auth-v0.2.0.tar.gz"
  sha256 "d52a855db3104d649a43109385c044a00b984431f72f6634b8ea1c881e010f68"
  head "https://github.com/bharath2020/connie-adf.git", branch: "main"

  # Package.swift: swift-tools-version 6.0, platforms macOS 14.
  depends_on xcode: ["16.0", :build]
  depends_on macos: :sonoma

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "adf-auth"
    bin.install ".build/release/adf-auth"
  end

  test do
    assert_match "Usage: adf-auth <command> [options]", shell_output("#{bin}/adf-auth --help")
    assert_match "adf-auth", shell_output("#{bin}/adf-auth --version")
  end
end
