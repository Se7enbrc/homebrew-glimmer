cask "glimmer" do
  version "2026.9.8"
  sha256 "ed2c41a613293cc429f4f3bec19dca8135cbb885fc7c450229e7dc691ecd0229"

  url "https://github.com/Se7enbrc/glimmer/releases/download/#{version}/Glimmer-#{version}.dmg"
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

  uninstall launchctl: [
              "io.ugfugl.glimmer.helper",
              "io.ugfugl.Glimmer.LoginHelper",
            ],
            quit:      "io.ugfugl.Glimmer"

  # Identity/ holds the client certificate + key that hosts are paired against,
  # so zapping it deliberately un-pairs this Mac from every host.
  zap trash: [
    "~/Library/Application Support/Glimmer",
    "~/Library/Caches/io.ugfugl.Glimmer",
    "~/Library/Containers/io.ugfugl.Glimmer",
    "~/Library/HTTPStorages/io.ugfugl.Glimmer",
    "~/Library/Logs/Glimmer",
    "~/Library/Preferences/io.ugfugl.Glimmer.plist",
  ]
end
