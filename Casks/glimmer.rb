cask "glimmer" do
  version "2026.8.14"
  sha256 "abfe2ab2cee4cf766186c77252b3531a3de1334b12caab56189f70badeae9c55"

  url "https://github.com/Se7enbrc/glimmer/releases/download/#{version}/Glimmer-#{version}.dmg",
      verified: "github.com/Se7enbrc/glimmer/"
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
