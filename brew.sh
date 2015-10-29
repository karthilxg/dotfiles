#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
# brew install gnupg

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
# brew install ringojs
# brew install narwhal

# Install more recent versions of some OS X tools.
# brew install vim --override-system-vi
# brew install grep
# brew install openssh
# brew install screen
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
# brew install homebrew/php/php55 --with-gmp

# Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
# brew install ack
brew install node
brew install dark-mode
#brew install exiv2
# brew install git
# brew install git-lfs
# brew install imagemagick --with-webp
# brew install lua
# brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
# brew install rename
# brew install rhino
brew install speedtest_cli
brew install testssl
# brew install ssh-copy-id
brew install tree
brew install webkit2png
# brew install zopfli
brew install maven

# Install Cask
brew install caskroom/cask/brew-cask

# Core casks
echo Install Core Apps
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" java
# brew cask install --appdir="/Applications" little-snitch
# brew cask install --appdir="~/Applications" transmit

# Development tool casks
echo Install Dev Apps
brew cask install --appdir="/Applications" sublime-text3
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" brackets
brew cask install --appdir="/Applications" spectacle
brew cask install --appdir="/Applications" sizeup

# Misc casks
echo Install Some additional Apps
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" google-drive
brew cask install --appdir="/Applications" google-keep
brew cask install --appdir="/Applications" google-music-manager
brew cask install --appdir="/Applications" google-earth
brew cask install --appdir="/Applications" chromecast
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" skitch
# brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" evernote
brew cask install --appdir="/Applications" pocket

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# Remove outdated versions from the cellar.
brew cleanup
