cask "tunnelski" do
  version "0.2.8"
  sha256 "1ec7926ded5f925a47a50dddc9cb56a5b522d49c3c066874dd16f2aaad556a5c"

  url "https://tunnelski.onkie.dev/releases/Tunnelski-#{version}.dmg"
  name "Tunnelski"
  desc "Menu bar OpenVPN client with TOTP two-factor codes"
  homepage "https://tunnelski.onkie.dev/"

  livecheck do
    url "https://tunnelski.onkie.dev/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Tunnelski.app"

  uninstall quit: "com.onnokh.Tunnelski"

  zap trash: [
    "~/Library/Containers/com.onnokh.Tunnelski",
    "~/Library/Containers/com.onnokh.Tunnelski.Tunnel",
  ]
end
