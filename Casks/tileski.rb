cask "tileski" do
  version "0.1.0"
  sha256 "970056cf935e4ff6d5ca9c8574506745ef4f6cfc7a08d2f1d7afdcc4a3aba13b"

  url "https://tileski.onkie.dev/releases/Tileski-#{version}.dmg"
  name "Tileski"
  desc "Window tiler with keyboard shortcuts"
  homepage "https://tileski.onkie.dev/"

  livecheck do
    url "https://tileski.onkie.dev/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Tileski.app"

  uninstall quit: "dev.tileski.Tileski"

  zap trash: [
    "~/Library/HTTPStorages/dev.tileski.Tileski",
    "~/Library/Preferences/dev.tileski.Tileski.plist",
  ]
end
