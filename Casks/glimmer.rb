cask "glimmer" do
  version "2026.11.0"
  sha256 "fd92c3b7697b5b5fdb0b700cffe521d8984c8f20643fdf4cd0d8cfc46e7df543"

  url "https://github.com/Se7enbrc/glimmer/releases/download/2026.11.0-rc.4/Glimmer-#{version}.dmg"
  name "Glimmer"
  desc "Native client for the Sunshine game-streaming server"
  homepage "https://github.com/Se7enbrc/glimmer"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Glimmer.app"
  binary "#{appdir}/Glimmer.app/Contents/MacOS/Glimmer", target: "glimmer"

  # The helpers are SMAppService items that macOS owns. Removing their launchd jobs here
  # ran on every upgrade and left the login item broken, so only zap removes them.
  uninstall quit: "io.ugfugl.Glimmer"

  # Identity/ holds the client certificate + key that hosts are paired against,
  # so zapping it deliberately un-pairs this Mac from every host.
  zap launchctl: [
        "io.ugfugl.glimmer.helper",
        "io.ugfugl.Glimmer.LoginHelper",
      ],
      trash:     [
        "~/Library/Application Support/Glimmer",
        "~/Library/Caches/io.ugfugl.Glimmer",
        "~/Library/Containers/io.ugfugl.Glimmer",
        "~/Library/HTTPStorages/io.ugfugl.Glimmer",
        "~/Library/Logs/Glimmer",
        "~/Library/Preferences/io.ugfugl.Glimmer.plist",
      ]
end
