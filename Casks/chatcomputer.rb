cask "chatcomputer" do
  version "0.9.14"
  sha256 "5dd68206e9027420b8c88caa81f3f2c63e56c057960cc49e2b26f818351ee3e5"

  url "https://github.com/chatcomputer/chatcomputer/releases/download/v#{version}/ChatComputer.zip"
  name "Chat Computer"
  desc "macOS virtual machine operated by an AI agent while you chat"
  homepage "https://atomsprout.com/chatcomputer/"

  # Releases are marked pre-release until 1.0, which the GitHub releases strategy skips; tags are not.
  livecheck do
    url "https://github.com/chatcomputer/chatcomputer.git"
    strategy :git
  end

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "ChatComputer.app"
  # The app's executable doubles as the command line tool when called by this name.
  binary "#{appdir}/ChatComputer.app/Contents/MacOS/ChatComputer", target: "chatcomputer"

  # The virtual Mac lives in Application Support and takes tens of gigabytes.
  zap trash: [
    "~/Library/Application Support/ChatComputer",
    "~/Library/Preferences/app.chatcomputer.ChatComputer.plist",
    "~/Library/Saved Application State/app.chatcomputer.ChatComputer.savedState",
  ]
end
