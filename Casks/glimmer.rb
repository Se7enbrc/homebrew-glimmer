cask "glimmer" do
  version "2026.11.1"
  sha256 "057ec97dedddf0d782e2f3e229491e9a64d33aef3d849b4459601128a59ade2b"

  url "https://github.com/Se7enbrc/glimmer/releases/download/2026.11.1-rc.5/Glimmer-#{version}.dmg"
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
