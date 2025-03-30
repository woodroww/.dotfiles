#export RSTUDIO_WHICH_R=/Users/matt/opt/miniconda3/envs/tensorflow/bin/R

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye > /dev/null

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

# before kali from https://github.com/statropy/zsh-macos/blob/master/.zshrc
# PROMPT='%F{2}%2~ %f$(git_branch_name)%F{2}%2 %(!.#.'$'\U1F980'')%f '

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# ㉿ 🦄🌈🦀

prompt_symbol=🌈

if [ "$color_prompt" = yes ]; then
    # PROMPT_USER_MACHINE='%F{green}┌──(%B%F{blue}%n%m%b%F{green})-'
    # PROMPT_PATH='[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{green}]'
    # PROMPT_GIT='%F{011}${vcs_info_msg_0_}'
    # PROMPT_LINE2=$'\n%F{green}└─%B%F{blue}$%b%F{reset} '
    # PROMPT='$PROMPT_USER_MACHINE''$PROMPT_PATH''$PROMPT_GIT''$PROMPT_LINE2'
    PROMPT=$'%F{green}┌──(%B%F{blue}%n'$prompt_symbol$'%m%b%F{green})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{green}]%F{011}${vcs_info_msg_0_}\n%F{green}└─%B%F{blue}$%b%F{reset} '
    RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)'

    # enable syntax-highlighting
    if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && [ "$color_prompt" = yes ]; then
	# ksharrays breaks the plugin. This is fixed now but let's disable it in the
	# meantime.
	# https://github.com/zsh-users/zsh-syntax-highlighting/pull/689
	unsetopt ksharrays
	. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
	ZSH_HIGHLIGHT_STYLES[default]=none
	ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[global-alias]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[path]=underline
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[command-substitution]=none
	ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[process-substitution]=none
	ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[assign]=none
	ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
	ZSH_HIGHLIGHT_STYLES[named-fd]=none
	ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
	ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
	ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
    fi
else
    PROMPT='%n@%m:%~%# '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    TERM_TITLE='\e]0;%n@%m: %~\a'
    ;;
*)
    ;;
esac


autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

new_line_before_prompt=yes
precmd() {
    # Print the previously configured title
    print -Pn "$TERM_TITLE"

    # Print a new line before the prompt, but only if it is not the first line
    if [ "$new_line_before_prompt" = yes ]; then
	if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
	    _NEW_LINE_BEFORE_PROMPT=1
	else
	    print ""
	fi
    fi

    vcs_info
}

# enable color support of ls, less and man, and also add handy aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# some more ls aliases
alias ls="ls -GF"
alias ll="ls -lGF"
alias la="ls -aGF"
alias l="ls -GF"
alias lla="ls -alGF"

#add other alias or other config
if [ -f ~/.alias ]; then
    . ~/.alias
fi

# enable auto-suggestions based on the history
if [ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi
# end kali prompt

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

# cd() { builtin cd "$@";l;}
c() { builtin cd ..;l;}

alias real() {
	realpath "$1" | pbcopy
}

HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=1000
setopt SHARE_HISTORY

# INC_APPEND_HISTORY_TIME
# writes to history from all terminals as above, but that history "will not be
# available immediately from other instances of the shell that are using the
# same history file as does SHARE_HISTORY

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
#export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
#source /usr/local/opt/fzf/shell/key-bindings.zsh
#source /usr/local/opt/fzf/shell/completion.zsh
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

[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init -)"
