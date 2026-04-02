setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit

#export JAVA_HOME=$(/usr/libexec/java_home -v 25.0.1)
export M2_HOME="${HOME}/apache-maven"
export DOTFILES=$HOME/projects/dotfiles
export ZSH_CUSTOM=$DOTFILES/zsh
export ZSH="$HOME/.oh-my-zsh"

export PATH="
/usr/local/bin:\
/usr/local/sbin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin:\
.local/bin:\
/usr/local/opt/python/libexec/bin:\
$HOME/.rbenv/bin:\
${M2_HOME}/bin:\
$HOME/.atuin/bin/env\
$PATH"

export EDITOR=nvim
export LANG=en_US.UTF-8

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias cat=bat
alias cl='clear'
alias t='tmux'
alias g='git'
alias lg='lazygit'
alias d='docker'
alias v='/usr/bin/nvim'
alias rr='ranger'
alias sudi='sudo -i'
alias python="python3.14"
alias pip="pip3.14"
alias {lm,дь}='ls -lah'
alias myip='dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com'
alias lip="ifconfig | grep 'inet ' | grep -Fv 127.0.0.1 | awk '{print \$2}'"
alias zshcon="v .zshrc"
alias last='find . -type f -not -path "*/\*" -exec ls -lrt {} +'

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev    -commit"
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
)

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

# To know which specific random themre was loaded using $random, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="half-life"
# more themes to use: af-magic, agnoster, half-life, apple, bira, darkblood, dst, frontcube, jonathan, nanotech
source $ZSH/oh-my-zsh.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

if [[ -o interactive ]] && [[ -t 1 ]] && [[ -z "$FASTFETCH_DONE" ]]; then
    export FASTFETCH_DONE=1
    fastfetch
    #neofetch
fi


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

