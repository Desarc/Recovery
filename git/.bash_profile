# generated by Git for Windows
test -f ~/.profile && . ~/.profile
test -f ~/.bashrc && . ~/.bashrc

function cd()
{
    [[ -z "$*" ]] && builtin cd $HOME
    [[ -n "$*" ]] && builtin cd "$*"
    update_title
}

function update_title()
{
  if git rev-parse &> /dev/null;
      then windowTitle=`basename $(git rev-parse --show-toplevel)``parse_git_branch`
      else windowTitle=`pwd`
  fi
  echo -en '\033]2;'$windowTitle'\007'
#   echo -en '\033k'$windowTitle'\033\\' # if the above doesn't work
}

function parse_git_branch()
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# For setting bash prompt to 'user@hostname workingdirectory (branchIfGitRepo)
export PS1="\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]\$(parse_git_branch)\[\033[00m\]"$'\n$ '