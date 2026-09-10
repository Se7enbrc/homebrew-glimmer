cask "glimmer" do
  version "2026.9.0"
  sha256 "1cebff5b2bf27e0052f979838aa8e0dae414fc7ae6c8d037f889fa9741f0fdb0"

  url "https://github.com/Se7enbrc/glimmer/releases/download/#{version}/Glimmer-#{version}.dmg"
  name "Glimmer"
  desc "Native game-streaming client for Sunshine and Moonlight hosts"
  homepage "https://github.com/Se7enbrc/glimmer"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Glimmer.app"

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
