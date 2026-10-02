cask "layoutfox" do
  version "1.0.6"
  sha256 "369a83be1ea5ee7d0274d209080c0d87d5cab5a673a5fff75c2016beb45e332a"

  url "https://github.com/danzerzine/LayoutFox-releases/releases/download/v#{version}/LayoutFox-mac.zip"
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
