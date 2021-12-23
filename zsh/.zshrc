#export RSTUDIO_WHICH_R=/Users/matt/opt/miniconda3/envs/tensorflow/bin/R

PROMPT='%F{2}%n %f- '

export TFHUB_CACHE_DIR=$HOME/.tf_hub_cache/tfhub_modules

alias la="ls -la"
alias ll="ls -ltr"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
#export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-require-git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Enable vi mode
#bindkey -v

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
