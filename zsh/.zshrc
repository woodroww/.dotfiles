#export RSTUDIO_WHICH_R=/Users/matt/opt/miniconda3/envs/tensorflow/bin/R

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

# Config for prompt. PS1 synonym.
# prompt='%2/ $(git_branch_name) > '

# F foreground color
# f reset to default color
# PROMPT='%F{2}%n@%m %f- '

# PROMPT='%F{2}%2~ %#%f '

# a unicode char can be included in prompt
# '$'\U1f308''    for 1f308 the rainbow
# '$'\U274C''     for the X
# '$'\U2753''     for ?
# '$'\U1F47E''     for alien monster
# '$'\U1F980''     for crab

# %# means # if root or % if not root

# works
# PROMPT='%F{2}%2~ %(!.#.'$'\U1F980'')%f '

PROMPT='%F{2}%2~ %f$(git_branch_name)%F{2}%2 %(!.#.'$'\U1F980'')%f '

bindkey ";3D" backward-word
bindkey ";3C" forward-word

export TFHUB_CACHE_DIR=$HOME/.tf_hub_cache/tfhub_modules

zle_highlight=('paste:none')

alias fortuna="fortune /Users/matt/Documents/obliquestrategies"

alias gs="git status"
alias dkc="docker-compose"
alias zz="z -"
alias la="exa -las modified"
alias ll="exa -ls modified"
#alias ls="exa"
alias l="exa -s modified -r"
alias cp="cp -i"
alias mv="mv -i"
alias nvr="/Users/matt/.pyenv/versions/3.8.12/envs/lovely/bin/nvr"
alias bc="bc -l"

alias pw () {
    pwgen -sync "${1:-48}" -1 | if command -v pbcopy > /dev/null 2>&1; then pbcopy; else xclip; fi
}

cd() { builtin cd "$@";l;}
c() { builtin cd ..;l;}

alias real() {
	realpath "$1" | pbcopy
}

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHITST=1000
setopt SHARE_HISTORY

# INC_APPEND_HISTORY_TIME
# writes to history from all terminals as above, but that history "will not be
# available immediately from other instances of the shell that are using the
# same history file as does SHARE_HISTORY

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
#export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-require-git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Enable vi mode
#bindkey -v


# completion
# to delete the cache file
# rm -f ~/.zcompdump% compinit


# nit zsh completion this should be last, after rules
autoload -Uz compinit && compinit

eval "$(zoxide init zsh)"



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/matt/external_code/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/matt/external_code/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/matt/external_code/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/matt/external_code/google-cloud-sdk/completion.zsh.inc'; fi
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3 # run chruby to see actual version
