# Karthi's dotfiles

![Screenshot of my shell prompt](https://cloud.githubusercontent.com/assets/3691228/10810695/ba68580a-7dc0-11e5-8dbc-3dfbfcddee61.png)

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

## Motivation

Setting up a new developer machine can be an **ad-hoc, manual, and time-consuming** process.  `gotfiles` aims to **simplify** the process with **easy-to-understand instructions** and **dotfiles/scripts** to **automate the setup** of the following:

* **OS X updates and Xcode Command Line Tools**
* **OS X defaults** geared towards developers
* **Developer tools**: Vim, bash, tab completion, curl, git, GNU core utils, etc
* **Developer apps**: iTerm2, Sublime Text (Sublime Packages), Atom, Chrome, etc
* **Javascript web development**: Node.js, JSHint, Grunt, Bower, Compass and SASS

### But...I Don't Need All These Tools!

**`dotfiles` is geared to be more of an organized *reference* of various developer tools.**

**You're *not* meant to install everything.**

If you're interested in automation, `dotfiles` provides a customizable [setup script](#single-setup-script).  There's really no one-size-fits-all solution for developers so you're encouraged to make tweaks to suit your needs.

[Credits](#credits): This repo builds on the awesome work from [Mathias Bynens](https://github.com/mathiasbynens) and [Donne Martin](https://github.com/donnemartin).

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/karthilxg/dotfiles/blob/master/.aliases#L24-29)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Sections Summary
* Section 1 contains the `dotfiles/scripts` and instructions to set up your system.
* Sections 2 through 4 detail more information about installation, configuration, and usage for topics in Section 1.

#### Section 1: Installation

**Scripts tested on OS X 10.10 Yosemite.**

* [Single Setup Script](#single-setup-script)
* [bootstrap.sh script](#bootstrapsh-script)
    * Syncs dotfiles to your local home directory `~`
* [osxprep.sh script](#osxprepsh-script)
    * Updates OS X and installs Xcode command line tools
* [brew.sh script](#brewsh-script)
    * Installs common Homebrew formulae and apps
* [osx.sh script](#osxsh-script-sensible-os-x-defaults)
    * Sets up OS X defaults geared towards developers
* [web.sh script](#websh-script)
    * Sets up JavaScript web development

#### Section 2: General Apps and Tools

* [Sublime Text](#sublime-text)
* [Atom](#atom)
* [Terminal Customization](#terminal-customization)
* [iTerm2](#iterm2)
* [Vim](#vim)
* [Git](#git)
* [Homebrew](#homebrew)

#### Section 3: JavaScript Web Development

* [Node.js](#nodejs)
* [JSHint](#jshint)
* [SASS](#sass)

#### Section 4: Misc

* [Contributions](#contributions)
* [Credits](#credits)
* [Contact Info](#contact-info)
* [License](#license)

## Section 1: Installation

### Single Setup Script

#### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

###### Clone the Repo

```bash
git clone https://github.com/karthilxg/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

###### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/karthilxg/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,.osx,LICENSE.txt}
```

To update later on, just run that command again.

##### Run the .dots Script with Command Line Arguments

**Since you probably don't want to install every section**, the `.dots` script supports command line arguments to run only specified sections.  Simply pass in the [scripts](#scripts) that you want to install.  Below are some examples.

###### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Karthi Thangaraj"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="karthilxg@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```
**For more customization, you can [clone](#clone-the-repo) or [fork](https://github.com/karthilxg/dotfiles/fork) the repo and tweak the `.dots` script and its associated components to suit your needs.**

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/karthilxg/dotfiles/fork) instead, though.

###### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/karthilxg/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,LICENSE.txt}
```

To update later on, just run that command again.

##### Run the .dots Script with Command Line Arguments

**Since you probably don't want to install every section**, the `.dots` script supports command line arguments to run only specified sections.  Simply pass in the [scripts](#scripts) that you want to install.  Below are some examples.

Run `all`:

    $ ./.dots all

Run `bootstrap.sh`, `osxprep.sh`, `brew.sh`, and `osx.sh`:

    $ ./.dots bootstrap osxprep brew osx

Run `bootstrap.sh`, `osxprep.sh`, `brew.sh`, and `osx.sh` and `webdev.sh`:

    $ ./.dots bootstrap osxprep brew osx webdev

#### Scripts

* [.dots](https://github.com/karthilxg/dotfiles/blob/master/.dots)
    * Runs specified scripts
* [bootstrap.sh](https://github.com/karthilxg/dotfiles/blob/master/bootstrap.sh)
    * Syncs dotfiles to your local home directory `~`
* [osxprep.sh](https://github.com/karthilxg/dotfiles/blob/master/osxprep.sh)
    * Updates OS X and installs Xcode command line tools
* [brew.sh](https://github.com/karthilxg/dotfiles/blob/master/brew.sh)
    * Installs common Homebrew formulae and apps
* [osx.sh](https://github.com/karthilxg/dotfiles/blob/master/osx.sh)
    * Sets up OS X defaults geared towards developers
* [web.sh](https://github.com/karthilxg/dotfiles/blob/master/web.sh)
    * Sets up JavaScript web development

**Notes:**

* `.dots` will initially prompt you to enter your password.
* `.dots` might ask you to re-enter your password at certain stages of the installation.
* If OS X updates require a restart, simply run `.dots` again to resume where you left off.
* When installing the Xcode command line tools, a dialog box will confirm installation.
    * Once Xcode is installed, follow the instructions on the terminal to continue.
* `.dots` runs `brew.sh`, which takes awhile to complete as some formulae need to be installed from source.
* **When `.dots` completes, be sure to restart your computer for all updates to take effect.**

##### bootstrap.sh script

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/3691228/10807267/09d876f2-7d9b-11e5-8867-0fe0bc58b8cd.png">
  <br/>
</p>

The `bootstrap.sh` script will sync the dev-setup repo to your local home directory.  This will include customizations for Vim, bash, curl, git, tab completion, aliases, a number of utility functions, etc.  Section 2 of this repo describes some of the customizations.

##### osxprep.sh script

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/3691228/10807160/e4d06384-7d99-11e5-875e-8c2866a90f09.png">
  <br/>
</p>

Run the `osxprep.sh` script:

    $ ./osxprep.sh

`osxprep.sh` will first install all updates.  If a restart is required, simply run the script again.  Once all updates are installed, `osxprep.sh` will then [Install Xcode Command Line Tools](#install-xcode-command-line-tools).

If you want to go the manual route, you can also install all updates by running "App Store", selecting the "Updates" icon, then updating both the OS and installed apps.

##### osx.sh script (Sensible OS X defaults)

When setting up a new Mac, you may want to set some sensible macOS defaults:

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/3691228/10807193/20a021d8-7d9a-11e5-98b5-6b06dc529ea1.png">
  <br/>
</p>

When setting up a new Mac, you may want to set OS X defaults geared towards developers.  The `.osx` script also configures common third-party apps such Sublime Text and Chrome.

**Note**: **I strongly encourage you read through the commented [.osx source file](https://github.com/donnemartin/dev-setup/blob/master/.osx) and tweak any settings based on your personal preferences.  The script defaults are intended for you to customize.**  For example, if you are not running an SSD you might want to change some of the settings listed in the SSD section.

Run the `.osx` script:

```bash
./.macos
```
**For your terminal customization to take full effect, quit and re-start the terminal.**

##### brew.sh script

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/3691228/10807199/387d29cc-7d9a-11e5-8811-0061ad30cf65.png">
  <br/>
</p>

When setting up a new Mac, you may want to install some common [Homebrew](https://brew.sh/) formulae (after installing Homebrew, of course):

Some of the apps installed by the `brew.sh` script include: Chrome, Firefox, Sublime Text, Atom, Dropbox, Evernote, Skype, Slack, Alfred, etc.  **For a full listing of installed formulae and apps, refer to the commented [brew.sh source file](https://github.com/karthilxg/dotfiles/blob/master/brew.sh) directly and tweak it to suit your needs.**

Some of the apps installed by the `brew.sh` script include: Chrome, Firefox, Sublime Text, Atom, Dropbox, Evernote, Skype, Slack, Alfred, etc.  **For a full listing of installed formulae and apps, refer to the commented [brew.sh source file](https://github.com/karthilxg/dotfiles/blob/master/brew.sh) directly and tweak it to suit your needs.**

```bash
./brew.sh
```
**For your terminal customization to take full effect, quit and re-start the terminal**

###### Install Xcode Command Line Tools

An important dependency before many tools such as Homebrew can work is the **Command Line Tools for Xcode**. These include compilers like gcc that will allow you to build from source.

If you are running **OS X 10.9 Mavericks or later**, then you can install the Xcode Command Line Tools directly from the command line with:

    $ xcode-select --install

**Note**: the `osxprep.sh` script executes this command.

Running the command above will display a dialog where you can either:
* Install Xcode and the command line tools
* Install the command line tools only
* Cancel the install

###### OS X 10.8 and Older

If you're running 10.8 or older, you'll need to go to [http://developer.apple.com/downloads](http://developer.apple.com/downloads), and sign in with your Apple ID (the same one you use for iTunes and app purchases). Unfortunately, you're greeted by a rather annoying questionnaire. All questions are required, so feel free to answer at random.

Once you reach the downloads page, search for "command line tools", and download the latest **Command Line Tools (OS X Mountain Lion) for Xcode**. Open the **.dmg** file once it's done downloading, and double-click on the **.mpkg** installer to launch the installation. When it's done, you can unmount the disk in Finder.

##### web.sh script

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/3691228/10807207/4d6015b6-7d9a-11e5-9d38-217f3cc178bc.png">
  <br/>
</p>

To set up a JavaScript web development environment, Run the `web.sh` script:

    $ ./web.sh

[Section 3: Web Development](#section-3-web-development) describes the installed packages and usage.

## Section 2: General Apps and Tools

### Sublime Text

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/3691228/10807750/530fbcae-7da0-11e5-98f5-b6f48b68428f.png">
  <br/>
</p>

With the terminal, the text editor is a developer's most important tool. Everyone has their preferences, but unless you're a hardcore [Vim](http://en.wikipedia.org/wiki/Vim_(text_editor)) user, a lot of people are going to tell you that [Sublime Text](http://www.sublimetext.com/) is currently the best one out there.

#### Installation

The [brew.sh script](#brewsh-script) installs Sublime Text.

If you prefer to install it separately, go ahead and [download](http://www.sublimetext.com/) it. Open the **.dmg** file, drag-and-drop in the **Applications** folder.

**Note**: At this point I'm going to create a shortcut on the OS X Dock for both for Sublime Text. To do so, right-click on the running application and select **Options > Keep in Dock**.

Sublime Text is not free, but I think it has an unlimited "evaluation period". Anyhow, we're going to be using it so much that even the seemingly expensive $70 price tag is worth every penny. If you can afford it, I suggest you [support](http://www.sublimetext.com/buy) this awesome tool.

#### Configuration

The [osx.sh script](#osxsh-script-sensible-os-x-defaults) contains Sublime Text configurations.

#### Seti_UI Theme for ST3

The [Seti Theme](https://github.com/ctf0/Seti_ST3) is a great UI theme for Sublime Text, especially if you use a dark theme and think the side bar sticks out like a sore thumb.

##### Installation with Sublime Package Control

If you are using Will Bond's excellent [Sublime Package Control](http://wbond.net/sublime_packages/package_control), you can easily install Seti Theme via the `Package Control: Install Package` menu item. The Seti Theme package is listed as `Seti_UI` in the packages list.

##### Installation with Git

Alternatively, if you are a git user, you can install the theme and keep up to date by cloning the repo directly into your `Packages` directory in the Sublime Text application settings area.

You can locate your Sublime Text `Packages` directory by using the menu item `Preferences -> Browse Packages...`.

While inside the `Packages` directory, clone the theme repository using the command below:

    $ git clone https://github.com/ctf0/Seti_ST3

##### Activating the Theme on Sublime Text 3

Activate the Theme and Color-Scheme by modifying your user preferences file, which you can find using the menu item `Preferences -> Settings - User` in Sublime Text or use `Schemr` & `Themr` by Ben Weier.

**Example Sublime Text 3 User Settings**

    {
      "theme": "Seti.sublime-theme",
      "color_scheme": "Packages/Seti_UI/Scheme/Seti.tmTheme",
    }

#### Sublime Preferences and Packages

Sublime user preferences and packages are automatically installed through package control while opening the sublime text first time after installation, check [Preferences.sublime-settings](https://github.com/karthilxg/dotfiles/blob/master/init/Preferences.sublime-settings) and [Package Control.sublime-settings](https://github.com/karthilxg/dotfiles/blob/master/init/Package Control.sublime-settings)

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/3691228/10811496/b5534006-7dc9-11e5-952d-9bf806a29755.png">
  <br/>
</p>

Some of the package I've installed,

* All Autocomplete
* AngularJS
* Autoprefixer
* BetterFindBuffer
* Bootstrap 3 Snippets
* BracketHighlighter
* Can I Use
* Clickable URLs
* Color Highlighter
* DocBlockr
* Dotfiles Syntax Highlighting
* Emmet
* Git
* GitGutter
* HTMLBeautify
* Javascript Beautify
* Markdown Preview
* Package Control
* Seti_UI
* SideBarEnhancements
* SublimeLinter-jshint
* Syntax Highlighting for Sass

### Atom

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/atom.png">
  <br/>
</p>

[Atom](https://github.com/atom/atom) is a great open-source editor from GitHub that is rapidly gaining contributors and popularity.

#### Installation

The [brew.sh script](#brewsh-script) installs Atom.

If you prefer to install it separately, [download](https://atom.io/) it, open the **.dmg** file, drag-and-drop in the **Applications** folder.

#### Configuration

Atom has a great package manager that allows you to easily install both core and community packages.

### Terminal Customization

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/terminal.png">
  <br/>
</p>

Since we spend so much time in the terminal, we should try to make it a more pleasant and colorful place.

#### Configuration

The [bootstrap.sh script](#bootstrapsh-script) and [osx.sh script](#osxsh-script-sensible-os-x-defaults) contain terminal customizations.

### iTerm2

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/iterm2.png">
  <br/>
</p>

I prefer iTerm2 over the stock Terminal, as it has some some additional [great features](https://www.iterm2.com/features.html). Download and install iTerm2 (the newest version, even if it says "beta release").

In Finder, drag and drop the iTerm Application file into the Applications folder.

You can now launch iTerm, through the Launchpad for instance.

Let's just quickly change some preferences. In iTerm > Preferences..., under the tab General, uncheck Confirm closing multiple sessions and Confirm "Quit iTerm2 (Cmd+Q)" command under the section Closing.

In the tab Profiles, create a new one with the "+" icon, and rename it to your first name for example. Then, select Other Actions... > Set as Default. Under the section Window, change the size to something better, like Columns: 125 and Rows: 35.  I also like to set General > Working Directory > Reuse previous session's directory.  Finally, I change the wy the option key works so that I can quickly jump between words as described [here](https://coderwall.com/p/h6yfda/use-and-to-jump-forwards-backwards-words-in-iterm-2-on-os-x).

When done, hit the red "X" in the upper left (saving is automatic in OS X preference panes). Close the window and open a new one to see the size change.

#### Configuration

Since we spend so much time in the terminal, we should try to make it a more pleasant and colorful place. What follows might seem like a lot of work, but trust me, it'll make the development experience so much better.

Let's go ahead and start by changing the font. In **iTerm > Preferences...**, under the tab **Profiles**, section **Text**, change both fonts to **Consolas 13pt**.

Now let's add some color. I'm a big fan of the [Solarized](http://ethanschoonover.com/solarized) color scheme. It is supposed to be scientifically optimal for the eyes. I just find it pretty.

Scroll down the page and download the latest version. Unzip the archive. In it you will find the `iterm2-colors-solarized` folder with a `README.md` file, but I will just walk you through it here:

- In **iTerm2 Preferences**, under **Profiles** and **Colors**, go to **Load Presets... > Import...**, find and open the two **.itermcolors** files we downloaded.
- Go back to **Load Presets...** and select **Solarized Dark** to activate it. Voila!

**Note**: You don't have to do this, but there is one color in the **Solarized Dark** preset I don't agree with, which is *Bright Black*. You'll notice it's too close to *Black*. So I change it to be the same as *Bright Yellow*, i.e. **R 83 G 104 B 112**.

Not a lot of colors yet. We need to tweak a little bit our Unix user's profile for that. This is done (on OS X and Linux), in the `~/.bash_profile` text file (`~` stands for the user's home directory).

We'll come back to the details of that later, but for now, just download the files [.bash_profile](https://raw.githubusercontent.com/karthilxg/dotfiles/master/.bash_profile), [.bash_prompt](https://raw.githubusercontent.com/karthilxg/dotfiles/master/.bash_prompt), [.aliases](https://raw.githubusercontent.com/karthilxg/dotfiles/master/.aliases) attached to this document into your home directory (`.bash_profile` is the one that gets loaded, I've set it up to call the others):

```bash
    $ cd ~
    $ curl -O https://raw.githubusercontent.com/karthilxg/dotfiles/master/.bash_profile
    $ curl -O https://raw.githubusercontent.com/karthilxg/dotfiles/master/.bash_prompt
    $ curl -O https://raw.githubusercontent.com/karthilxg/dotfiles/master/.aliases
```

With that, open a new terminal tab (Cmd+T) and see the change! Try the list commands: `ls`, `ls -lh` (aliased to `ll`), `ls -lha` (aliased to `la`).

At this point you can also change your computer's name, which shows up in this terminal prompt. If you want to do so, go to **System Preferences** > **Sharing**. For example, I changed mine from "Donne's MacBook Pro" to just "MacBook Pro", so it shows up as `MacBook-Pro` in the terminal.

Now we have a terminal we can work with!

### Vim

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/vim.png">
  <br/>
</p>

Although Sublime Text will be our main editor, it is a good idea to learn some very basic usage of [Vim](http://www.vim.org/). It is a very popular text editor inside the terminal, and is usually pre-installed on any Unix system.

For example, when you run a Git commit, it will open Vim to allow you to type the commit message.

I suggest you read a tutorial on Vim. Grasping the concept of the two "modes" of the editor, **Insert** (by pressing `i`) and **Normal** (by pressing `Esc` to exit Insert mode), will be the part that feels most unnatural. After that it's just remembering a few important keys.

### Git

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/3691228/10807927/9e5c5044-7da2-11e5-82a5-7cbd39ca787f.png">
  <br/>
</p>

What's a developer without [Git](http://git-scm.com/)?

#### Installation

Git should have been installed when you ran through the [Install Xcode Command Line Tools](#install-xcode-command-line-tools) section.

#### Configuration

To check your version of Git, run the following command:

    $ git --version

And `$ which git` should output `/usr/local/bin/git`.

Let's set up some basic configuration. Download the [.gitconfig](https://raw.githubusercontent.com/karthilxg/dotfiles/master/.gitconfig) file to your home directory:

    $ cd ~
    $ curl -O https://raw.githubusercontent.com/karthilxg/dotfiles/master/.gitconfig

It will add some color to the `status`, `branch`, and `diff` Git commands, as well as a couple aliases. Feel free to take a look at the contents of the file, and add to it to your liking.

Next, we'll define your Git user (should be the same name and email you use for [GitHub](https://github.com/) and [Heroku](http://www.heroku.com/)):

    $ git config --global user.name "Your Name Here"
    $ git config --global user.email "your_email@youremail.com"

They will get added to your `.gitconfig` file.

To push code to your GitHub repositories, we're going to use the recommended HTTPS method (versus SSH). So you don't have to type your username and password everytime, let's enable Git password caching as described [here](https://help.github.com/articles/set-up-git):

    $ git config --global credential.helper osxkeychain

**Note**: On a Mac, it is important to remember to add `.DS_Store` (a hidden OS X system file that's put in folders) to your `.gitignore` files. You can take a look at this repository's [.gitignore](https://github.com/donnemartin/dev-setup/blob/master/.gitignore) file for inspiration.  Also check out GitHub's [collection of .gitignore templates](https://github.com/github/gitignore).

### Homebrew

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/homebrew.png">
  <br/>
</p>

Package managers make it so much easier to install and update applications (for Operating Systems) or libraries (for programming languages). The most popular one for OS X is [Homebrew](http://brew.sh/).

#### Installation

The [brew.sh script](#brewsh-script) installs Homebrew and a number of useful Homebrew formulae and apps.

If you prefer to install it separately, run the following command and follow the steps on the screen:

    $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#### Usage

To install a package (or **Formula** in Homebrew vocabulary) simply type:

    $ brew install <formula>

To update Homebrew's directory of formulae, run:

    $ brew update

**Note**: I've seen that command fail sometimes because of a bug. If that ever happens, run the following (when you have Git installed):

    $ cd /usr/local
    $ git fetch origin
    $ git reset --hard origin/master

To see if any of your packages need to be updated:

    $ brew outdated

To update a package:

    $ brew upgrade <formula>

Homebrew keeps older versions of packages installed, in case you want to roll back. That rarely is necessary, so you can do some cleanup to get rid of those old versions:

    $ brew cleanup

To see what you have installed (with their version numbers):

    $ brew list --versions

### Ruby and RVM

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/ruby.png">
  <br/>
</p>

[Ruby](http://www.ruby-lang.org/) is already installed on Unix systems. But we don't want to mess around with that installation. More importantly, we want to be able to use the latest version of Ruby.

#### Installation

When installing Ruby, best practice is to use [RVM](https://rvm.io/) (Ruby Version Manager) which allows you to manage multiple versions of Ruby on the same machine. Installing RVM, as well as the latest version of Ruby, is very easy. Just run:

    $ curl -L https://get.rvm.io | bash -s stable --ruby

When it is done, both RVM and a fresh version of Ruby 2.0 are installed. The following line was also automatically added to your `.bash_profile`:

```bash
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
```

I prefer to move that line to the `.extra` file, keeping my `.bash_profile` clean. I suggest you do the same.

After that, start a new terminal and run:

    $ type rvm | head -1

You should get the output `rvm is a function`.

#### Usage

The following command will show you which versions of Ruby you have installed:

    $ rvm list

The one that was just installed, Ruby 2.0, should be set as default. When managing multiple versions, you switch between them with:

    $ rvm use system # Switch back to system install (1.8)
    $ rvm use 2.0.0 --default # Switch to 2.0.0 and sets it as default

Run the following to make sure the version you want is being used (in our case, the just-installed Ruby 1.9.3):

    $ which ruby
    $ ruby --version

You can install another version with:

    $ rvm install 1.9.3

To update RVM itself, use:

    $ rvm get stable

[RubyGems](http://rubygems.org/), the Ruby package manager, was also installed:

    $ which gem

Update to its latest version with:

    $ gem update --system

To install a "gem" (Ruby package), run:

    $ gem install <gemname>

To install without generating the documentation for each gem (faster):

    $ gem install <gemname> --no-document

To see what gems you have installed:

    $ gem list

To check if any installed gems are outdated:

    $ gem outdated

To update all gems or a particular gem:

    $ gem update [<gemname>]

RubyGems keeps old versions of gems, so feel free to do come cleaning after updating:

    $ gem cleanup

I mainly use Ruby for the CSS pre-processor [Compass](http://compass-style.org/), which is built on top of [Sass](http://sass-lang.com/):

    $ gem install compass --no-document

## Section 3: Web Development

### Node.js

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/nodejs.png">
  <br/>
</p>

#### Installation

The [web.sh script](#websh-script) installs [Node.js](http://nodejs.org/).  You can also install it manually with Homebrew:

    $ brew update
    $ brew install node

The formula also installs the [npm](https://npmjs.org/) package manager. However, as suggested by the Homebrew output, we need to add `/usr/local/share/npm/bin` to our path so that npm-installed modules with executables will have them picked up.

To do so, add this line to your `~/.path` file, before the `export PATH` line:

```bash
PATH=/usr/local/share/npm/bin:$PATH
```

Open a new terminal for the `$PATH` changes to take effect.

We also need to tell npm where to find the Xcode Command Line Tools, by running:

    $ sudo xcode-select -switch /usr/bin

(If Xcode Command Line Tools were installed by Xcode, try instead:)

    $ sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

Node modules are installed locally in the `node_modules` folder of each project by default, but there are at least two that are worth installing globally. Those are [CoffeeScript](http://coffeescript.org/) and [Grunt](http://gruntjs.com/):

    $ npm install -g coffee-script
    $ npm install -g grunt-cli

#### Npm usage

To install a package:

    $ npm install <package> # Install locally
    $ npm install -g <package> # Install globally

To install a package and save it in your project's `package.json` file:

    $ npm install <package> --save

To see what's installed:

    $ npm list # Local
    $ npm list -g # Global

To find outdated packages (locally or globally):

    $ npm outdated [-g]

To upgrade all or a particular package:

    $ npm update [<package>]

To uninstall a package:

    $ npm uninstall <package>

### JSHint

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/jshint.png">
  <br/>
</p>

JSHint is a JavaScript developer's best friend.

If the extra credit assignment to install Sublime Package Manager was completed, JSHint can be run as part of Sublime Text.

#### Installation

The [web.sh script](#websh-script) installs JSHint.  You can also install it manually via via npm:

    $ npm install -g jshint

Follow additional instructions on the [JSHint Package Manager page](https://sublime.wbond.net/packages/JSHint) or [build it manually](https://github.com/jshint/jshint).

### SASS

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/3691228/10807912/60561ba4-7da2-11e5-8853-c06908a04314.png">
  <br/>
</p>

CSS preprocessors are becoming quite popular, the most popular processors are [LESS](http://lesscss.org/) and [SASS](http://sass-lang.com). Preprocessing is a lot like compiling code for CSS. It allows you to reuse CSS in many different ways. Let's start out with using SASS as a basic preprocessor, it's used by a lot of popular CSS frameworks like [Bootstrap](http://getbootstrap.com/).

#### Installation

The [web.sh script](#websh-script) installs SASS.  If you prefer the command line over an application then getting Sass set up is a fairly quick process. Sass has a Ruby dependency but if you're using a Mac, congratulations, Ruby comes pre-installed. To install SASS manually you have to use gem. In the terminal use:

    $ sudo gem install sass

Check ruby installation (#ruby-and-rvm), if ruby is not found.

Note: the `-g` flag is optional but it prevents having to mess around with file paths. You can install without the flag, just know what you're doing.

You can check that it installed properly by using:

    $ sass -v

This should output some information about the compiler:

    Sass 3.4.19 (Selective Steve)

Okay, SASS is installed and running. Great!

#### Usage

There's a lot of different ways to use SASS. Generally I use it to compile my stylesheet locally. You can do that by using this command in the terminal:

    $ sass input.scss output.css

Read more about SASS on their page here: http://sass-lang.com/

## Section 4: Misc

#### Configuration

The [bootstrap.sh script](#bootstrapsh-script) contains Vim customizations.

### Contributions

Bug reports, suggestions, and pull requests are [welcome](https://github.com/karthilxg/dotfiles/issues)!

### Credits

See the [Credits Page](https://github.com/karthilxg/dotfiles/blob/master/CREDITS.md).

## Contact Info

Feel free to contact me to discuss any issues, questions, or comments.

* Email: [karthilxg@gmail.com](mailto:karthilxg@gmail.com)
* Twitter: [@karthilxg](https://twitter.com/karthilxg)
* GitHub: [karthilxg](https://github.com/karthilxg)
* LinkedIn: [karthilxg](https://www.linkedin.com/in/karthilxg)

### License

This repository contains a variety of content; some developed by Karthi Thangaraj, and some from third-parties.  The third-party content is distributed under the license provided by those parties.

The content developed by Karthi Thangaraj is distributed under the following license:

Copyright 2018 Karthi Thangaraj

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0
