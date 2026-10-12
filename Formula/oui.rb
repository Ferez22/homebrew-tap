class Oui < Formula
  desc "Terminal workspace with per-profile isolated logins and tmux-style sessions"
  homepage "https://github.com/Ferez22/oui"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Ferez22/oui/releases/download/v0.1.0/oui-aarch64-apple-darwin.tar.gz"
      sha256 "d689a1729824725c27e10bdbc9f331cbbe81dd313dd515a605a3bda6fda77dbc"
    end
    on_intel do
      url "https://github.com/Ferez22/oui/releases/download/v0.1.0/oui-x86_64-apple-darwin.tar.gz"
      sha256 "5732be1692c2315a0db0a247e35ed08e77aaccc9cae0a6fc7b86f7c15c4dc6a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Ferez22/oui/releases/download/v0.1.0/oui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df30a1ec2fe071efc5e1b551de879309b34ac45d58c43f0b490ba98a933727e7"
    end
    on_intel do
      url "https://github.com/Ferez22/oui/releases/download/v0.1.0/oui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a51ee5d1a96a01627187b8bfb019dbec97dd4deb006a3965de11d3b3b6772eb"
    end
  end

  def install
    bin.install "oui"
  end

  def caveats
    <<~EOS
      After upgrading, restart the background server so it runs the new version:
        oui kill-server   # closes running oUI sessions
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oui --version")
  end
end
