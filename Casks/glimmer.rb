cask "glimmer" do
  version "2026.8.17"
  sha256 "ed719d3b5b5f5c1f7f3a2253765b739c5f18fe620fe5c81df21cc424de44b590"

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
