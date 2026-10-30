cask "rankstas-paradise" do
  version "0.1.0"
  sha256 "25b14f4995776b268645d6e1eb4458f4f061144ef5a9f7ab8c6cc13024e1cbbc"

  url "https://github.com/Onnokh/rankstas-paradise/releases/download/macos-v#{version}/RankstasParadise-#{version}.dmg"
  name "Ranksta's Paradise"
  desc "Native client for the Ranksta's Paradise SEO service"
  homepage "https://github.com/Onnokh/rankstas-paradise"

  # The repo holds the server and other clients too: the macos- prefix marks the releases of this app.
  livecheck do
    url :url
    regex(/^macos-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on macos: ">= :sonoma"

  app "Ranksta's Paradise.app"

  uninstall quit: "com.rankstasparadise.mac"

  zap trash: [
    "~/Library/Application Support/com.rankstasparadise.mac",
    "~/Library/Caches/com.rankstasparadise.mac",
    "~/Library/HTTPStorages/com.rankstasparadise.mac",
    "~/Library/Preferences/com.rankstasparadise.mac.plist",
  ]
end
