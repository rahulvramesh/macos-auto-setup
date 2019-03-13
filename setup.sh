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

echo "======================================"
echo "Install git"
echo "======================================"
brew install git

echo "======================================"
echo "set git email and name"
echo "What is your git name?"
#read gitname
echo "What is your git email?"
#read gitemail
echo "======================================"
git config --global user.name rahulvramesh
git config --global user.email rahulvramesh@gmail.com

echo "======================================"
echo "set git color output"
echo "======================================"
git config --global color.ui auto

echo "======================================"
echo "custom git log"
echo "======================================"
git config --global format.pretty format:"%C(auto)%h %d%Creset %s%n%Cgreen%ad%Creset %aN <%aE>%n"

echo "======================================"
echo "set vscode as default git editor"
echo "======================================"
git config --global core.editor "code --wait"

echo "======================================"
echo "Install postman"
echo "======================================"
brew cask install postman

echo "======================================"
echo "Install docker"
echo "======================================"
brew cask install docker

echo "======================================"
echo "Install vscode"
echo "======================================"
brew cask install visual-studio-code

echo "======================================"
echo "Install vlc"
echo "======================================"
brew cask install vlc

echo "======================================"
echo "Install slack"
echo "======================================"
brew cask install slack


