cask "layoutfox" do
  version "1.0.8"
  sha256 "b326906f3022e7fa8f7fd6e9c0f4916143fe0475be0d92f77d6437f7922280d7"

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
  depends_on arch: :arm64

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
