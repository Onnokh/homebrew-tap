cask "tabski" do
  version "0.1.5"
  sha256 "50f2c7d84748de21aed3bb0bc65695067fd9e638b169f86948dc291bad347df2"

  url "https://tabski.onkie.dev/releases/Tabski-#{version}.dmg"
  name "Tabski"
  desc "Fast window switcher"
  homepage "https://tabski.onkie.dev/"

  livecheck do
    url "https://tabski.onkie.dev/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Tabski.app"

  uninstall quit: "dev.tabski.Tabski"

  zap trash: [
    "~/Library/HTTPStorages/dev.tabski.Tabski",
    "~/Library/Preferences/dev.tabski.Tabski.plist",
  ]
end
