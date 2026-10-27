# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit

export CC=/opt/homebrew/opt/llvm/bin/clang
export CXX=/opt/homebrew/opt/llvm/bin/clang++
export CPATH=`xcrun --show-sdk-path`/usr/include
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export JAVA_HOME=$(/usr/libexec/java_home -v 25.0.1)
export M2_HOME="${HOME}/apache-maven"
export DOTNET_ROOT="/opt/homebrew/opt/dotnet@6/libexec"
export DOTFILES=$HOME/projects/dotfiles
export ZSH_CUSTOM=$DOTFILES/zsh
export ZSH="$HOME/.oh-my-zsh"
export PYENV_ROOT="$HOME/.pyenv"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin:/usr/local/opt/python/libexec/bin:$HOME/.rbenv/bin:${M2_HOME}/bin:$HOME/.atuin/bin:$PYENV_ROOT/bin:$PATH"

export EDITOR=/opt/homebrew/bin/nvim
export LANG=en_US.UTF-8

export NVM_DIR="$(printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

alias cat=bat
alias cl='clear'
alias t='/opt/homebrew/bin/tmux'
alias g='/opt/homebrew/bin/git'
alias lg='/opt/homebrew/bin/lazygit'
alias d='/opt/homebrew/bin/docker'
alias v='/opt/homebrew/bin/nvim'
alias rr='ranger'
alias sudi='sudo -i'
alias sude='sudo -E env HOME=$HOME USER=$USER XDG_CONFIG_HOME=$XDG_CONFIG_HOME XDG_CACHE_HOME=$XDG_CACHE_HOME  XDG_STATE_HOME=$XDG_STATE_HOME '
alias python="python3.14"
alias pip="pip3.14"
alias {lm,дь}='eza -lha --icons=auto --sort=name --group-directories-first'
alias lt='eza --icons=auto --tree'
alias myip='dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com'
alias lip="ifconfig | grep 'inet ' | grep -Fv 127.0.0.1 | awk '{print \$2}'"
alias zshcon="v .zshrc"
alias last='find . -type f -not -path "*/\*" -exec ls -lrt {} +'
alias onn='cd ~/projects/obsidian_notes && git add . && git commit -am "new notes" && git push -u origin master && cd ~/'

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# K8S
export KUBECONFIG=~/.kube/config
alias k="kubectl"
alias ka="kubectl apply -f"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias kl="kubectl logs"
alias kgpo="kubectl get pod"
alias kgd="kubectl get deployments"
alias kc="kubectx"
alias kns="kubens"
alias kl="kubectl logs -f"
alias ke="kubectl exec -it"
alias kcns='kubectl config set-context --current --namespace'
alias podname=''

source <(kubectl completion zsh)

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

bindkey jj vi-cmd-mode

complete -C '/usr/local/bin/aws_completer' aws

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plugins=(
  git
  ansible 
  macos
  zsh-autosuggestions  
  zsh-syntax-highlighting
)
# To know which specific random themre was loaded using $random, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="half-life"
# more themes to use: af-magic, agnoster, half-life, apple, bira, darkblood, dst, frontcube, jonathan, nanotech
source $ZSH/oh-my-zsh.sh

function ranger {
	local IFS=$'\t\n'
	local tempfile="$(mktemp -t tmp.XXXXXX)"
	local ranger_cmd=(
		command
		ranger
		--cmd="map Q chain shell echo %d > "$tempfile"; quitall"
	)

	${ranger_cmd[@]} "$@"
	if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
		cd -- "$(cat "$tempfile")" || return
	fi
	command rm -f -- "$tempfile" 2>/dev/null
}

# navigation
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/key_path

eval "$(rbenv init -)"
eval "$(atuin init zsh)"

if [[ -o interactive ]] && [[ -t 1 ]] && [[ -z "$FASTFETCH_DONE" ]] &&  [[ "$TERM_PROGRAM" != "vscode" ]]; then
    export FASTFETCH_DONE=1
    fastfetch
fi
