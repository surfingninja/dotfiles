# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export CC=/opt/homebrew/opt/llvm/bin/clang
export CXX=/opt/homebrew/opt/llvm/bin/clang++
export CPATH=`xcrun --show-sdk-path`/usr/include
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export JAVA_HOME=$(/usr/libexec/java_home -v 25.0.1)
export M2_HOME="${HOME}/apache-maven-3.9.6"
export DOTNET_ROOT="/opt/homebrew/opt/dotnet@6/libexec"
export DOTFILES=$HOME/projects/dotfiles
export ZSH_CUSTOM=$DOTFILES/zsh
export ZSH="$HOME/.oh-my-zsh"

export PATH="/opt/homebrew/bin:\
/usr/local/bin:/usr/local/sbin:\
.local/bin:\
/Applications/Docker.app/Contents/Resources/bin/:\
/usr/local/opt/python/libexec/bin:\
${HOME}/Library/Python/3.9/bin:\
$HOME/.rbenv/bin:\
${M2_HOME}/bin:\
/Applications/Visual Studio Code.app/Contents/Resources/app/bin:\
/opt/homebrew/opt/dotnet@6/bin:$PATH"

eval "$(rbenv init -)"

# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias t='/opt/homebrew/bin/tmux'
alias g='/opt/homebrew/bin/git'
alias lg='/opt/homebrew/bin/lazygit'
alias d='/opt/homebrew/bin/docker'
alias v='/opt/homebrew/bin/nvim'
alias sudo='sudo '
alias python="python3.14"
alias pip="pip3.14"
alias git='/opt/homebrew/bin/git'
alias {lm,дь}='ls -lah'
alias chip='dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com'
alias lip="ifconfig | grep 'inet ' | grep -Fv 127.0.0.1 | awk '{print \$2}'"
alias zshcon="v .zshrc"
alias last='find . -type f -not -path "*/\*" -exec ls -lrt {} +'

plugins=(git 
  macos
  zsh-autosuggestions  
  zsh-syntax-highlighting
  )
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="half-life"
#source ~/021011-tools/021011.zsh-theme

# more themes to use: af-magic, agnoster, half-life, apple, bira, darkblood, dst, frontcube, jonathan, nanotech
# nanotech

source $ZSH/oh-my-zsh.sh
#source ~/.oh-my-zsh/plugins/git/git.plugin.zsh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/key_path

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
eval "$(starship init zsh)"