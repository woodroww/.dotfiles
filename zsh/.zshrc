#export RSTUDIO_WHICH_R=/Users/matt/opt/miniconda3/envs/tensorflow/bin/R

PROMPT='%F{2}%n %f- '

export PATH="$PATH:/Users/matt/Library/Python/3.8/bin:$HOME/.pyenv/bin"
export TFHUB_CACHE_DIR=$HOME/.tf_hub_cache/tfhub_modules

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias la="ls -la"
alias ll="ls -ltr"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/matt/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/matt/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/matt/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/matt/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda activate tensorflow

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
#export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-require-git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Enable vi mode
#bindkey -v
