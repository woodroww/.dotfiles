export MANPAGER='nvim +Man!'

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('$branch') '
  fi
}
# Enable substitution in the prompt.
setopt prompt_subst

# F foreground color
# f reset to default color
# PROMPT='%F{2}%n@%m %f- '
# PROMPT='%F{2}%2~ %#%f '

# user@machine dir1/dir2
# PROMPT='%F{2}%n@%m %2~ %#%f '

PROMPT='%F{2}%2~ %f$(git_branch_name)%F{2}%2 %(!.#.'$'\U1F980'')%f '

export TFHUB_CACHE_DIR=$HOME/.tf_hub_cache/tfhub_modules

zle_highlight=('paste:none')

# this hides gs ghostscript
alias gs="git status"
alias la="exa -las modified"
alias ll="exa -ls modified"
alias l="exa -s modified -r"
alias pw () {
    pwgen -sync "${1:-48}" -1 | if command -v pbcopy > /dev/null 2>&1; then pbcopy; else xclip; fi
}

cd() { builtin cd "$@";ll;}
c() { builtin cd ..;l;}

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye > /dev/null

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

# INC_APPEND_HISTORY_TIME
# writes to history from all terminals as above, but that history "will not be
# available immediately from other instances of the shell that are using the
# same history file as does SHARE_HISTORY

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
#export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-require-git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# nit zsh completion this should be last, after rules
autoload -Uz compinit && compinit

#eval "$(zoxide init zsh)"

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/matt/external_code/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/matt/external_code/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/matt/external_code/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/matt/external_code/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="/home/matt/.local/bin:/home/matt/.cargo/bin:/home/matt/Applications/node-v18.16.0-linux-x64/bin:$PATH"
