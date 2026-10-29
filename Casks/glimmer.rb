cask "glimmer" do
  version "2026.10.8"
  sha256 "cb4b039f41b2339acbf2ef47412c969761687fc8acc22335c17f65cb7c6c73e7"

  url "https://github.com/Se7enbrc/glimmer/releases/download/2026.10.8-rc.23/Glimmer-#{version}.dmg"
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
