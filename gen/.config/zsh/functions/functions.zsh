function git-on-main {
  branch=`current_branch`
  git checkout main && git pull --rebase origin main
  git checkout $branch
  git rebase main
}

function git-cleanup {
  branch=`current_branch`
  git checkout main && git up
  git-nuke! $branch
}

function git-new-branch {
  git checkout -b $1 && git push -u origin $1
}

function git-checkout-remote-branch {
  git checkout --track origin/$1
}

function git-nuke! {
  git branch -D $1 && git push origin :$1
}

function git-post-merge-cleanup {
  branch = `current_branch`
  git checkout main
  git pull origin main && git-nuke! $branch
}

function git-force-push {
  git push -f origin `current_branch`
}

function git-reset-head-hard {
  if [[ -z $1 ]]; then
    steps=1
  else
    steps=$1
  fi
  git reset --hard HEAD~$steps
}

function topcmds {
  lines=${1:-10}
  history | awk 'BEGIN {FS="[ \t]+|\\|"} {print $3}' |\
    sort | uniq -c | sort -nr | head -$lines
}

function release_compdef {
  for name in $@; do
    sed -i "^'$name' /d" $ZSH_COMPDUMP
  done
}
compdef _aliases release_compdef

declare -A e
function git-pretty-status-wrapper {
  if echo $(rvm_prompt_info) | grep -q 'jruby'; then
    command git status
  else
    local git_status files index file list
    list='@@filelist@@::'
    git_status=$(git-pretty-status)
    files=$(echo $git_status | grep $list | sed "s/$list//g")
    index=0
    for file in ${(s/|/)files}; do
      let index++
      e[$index]=$file
    done
    echo $git_status | grep -v $list
  fi
}

function npm-global-install {
  sudo npm install $1 -g
}

function xml-format {
  xmllint --format $1 > temporary_formatted_xml_file && mv temporary_formatted_xml_file $1
}
