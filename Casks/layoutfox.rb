cask "layoutfox" do
  arch arm: "", intel: "-intel"

  version "1.1.0"
  sha256 arm:   "c2fcb73b97e971d3f41cd04257eaa2c3ab19d143b12e2923336c618b5a5da952",
         intel: "b23c51646887a3413d2c8333b85d10dd89237feeb64596af9c16ed818a622ea1"

  url "https://github.com/danzerzine/LayoutFox-releases/releases/download/v#{version}/LayoutFox-mac#{arch}.zip"
  name "LayoutFox"
  desc "RU/EN keyboard layout auto-switcher, works with keys from Parsec"
  homepage "https://danzerzine.github.io/LayoutFox-releases/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "LayoutFox.app"

  uninstall quit: "io.github.danzerzine.layoutfix"

  zap trash: [
    "~/Library/Application Support/LayoutFox",
    "~/Library/Preferences/io.github.danzerzine.layoutfix.plist",
  ]

  caveats <<~EOS
    LayoutFox is signed with its own certificate, not Apple's. On first launch macOS blocks it:
    open System Settings → Privacy & Security and click "Open Anyway".
    Then allow it in Accessibility; the app shows where.
  EOS
end
