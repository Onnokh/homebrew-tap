cask "tunnelski" do
  version "0.2.9"
  sha256 "79863a6d97646f5f0ed9997dbf61049f5cede143132cf07c508f453c13f6e399"

  url "https://tunnelski.onkie.dev/releases/Tunnelski-#{version}.dmg"
  name "Tunnelski"
  desc "Menu bar OpenVPN client with TOTP two-factor codes"
  homepage "https://tunnelski.onkie.dev/"

  livecheck do
    url "https://tunnelski.onkie.dev/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Tunnelski.app"

  uninstall quit: "com.onnokh.Tunnelski"

  zap trash: [
    "~/Library/Containers/com.onnokh.Tunnelski",
    "~/Library/Containers/com.onnokh.Tunnelski.Tunnel",
  ]
end
