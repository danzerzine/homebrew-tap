cask "layoutfox" do
  arch arm: "", intel: "-intel"

  version "1.0.12"
  sha256 arm:   "b29c881d1aba070eeb2d15ef032e27cd426f5a1ce76a269ccabfe5e4055bc30e",
         intel: "2f06fea7ca381543b0839923512afa6f6e2bdb5c56614615eaf5f65846b17758"

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
