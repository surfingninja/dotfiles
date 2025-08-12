# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export CC=/opt/homebrew/opt/llvm/bin/clang
export CXX=/opt/homebrew/opt/llvm/bin/clang++
export CPATH=`xcrun --show-sdk-path`/usr/include
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"  #this was commented
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export JAVA_HOME=$(/usr/libexec/java_home -v 19.0.2)
export M2_HOME="${HOME}/apache-maven-3.9.6"
export DOTNET_ROOT="/opt/homebrew/opt/dotnet@6/libexec"
export DOTFILES=$HOME/dotfiles
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=$DOTFILES/zsh

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

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias sudo='nocorrect sudo -E '
alias python='python3.12'
alias pip='pip3.12'
alias vim='/opt/homebrew/bin/nvim'
alias git='/opt/homebrew/bin/git'
alias {lm,дь}='ls -lah'
alias myip='dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com'
alias lip="ifconfig | grep 'inet ' | grep -Fv 127.0.0.1 | awk '{print \$2}'"

#oh-my-zsh plugins to be used
plugins=(
  git
  zsh-autosuggestions  
  zsh-syntax-highlighting
)

# more themes to use: af-magic, agnoster, half-life, apple, bira, darkblood, dst, frontcube, jonathan, nanotech
ZSH_THEME="half-life"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh
#source ~/.oh-my-zsh/plugins/git/git.plugin.zsh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/key_path

