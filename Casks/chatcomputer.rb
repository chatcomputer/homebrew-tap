cask "chatcomputer" do
  version "0.9.7"
  sha256 "ea944aaacfb2ccc7af2d5db38dac975bfb7acd3a723a78e5c325d75b8c366670"

  url "https://github.com/chatcomputer/chatcomputer/releases/download/v#{version}/ChatComputer.zip"
  name "Chat Computer"
  desc "macOS virtual machine operated by an AI agent while you chat"
  homepage "https://chatcomputer.github.io/"

  livecheck do
    url :url
    strategy :github_releases
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
