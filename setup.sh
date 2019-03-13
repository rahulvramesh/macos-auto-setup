# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Hello $(whoami)! Let's get you set up."

echo "======================================"
echo "Installing homebrew"
echo "======================================"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "======================================"
echo "Install xcode-select --install"
xcode-select --install
echo "======================================"

echo "======================================"
echo "Install cask"
echo "======================================"
brew tap caskroom/cask
brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers

