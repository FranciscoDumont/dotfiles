# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/panchi/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes


################################################################
# Theme

case $(tty) in
  (/dev/tty[1-9])
                  IS_TTY=true
                  ;;
              (*)
                  ZSH_THEME="powerlevel10k/powerlevel10k"
                  POWERLEVEL9K_MODE="nerdfont-complete"
                  source $HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

                  POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{black} $(print_icon 'LEFT_SUBSEGMENT_SEPARATOR') %F{white}"
                  ;;
esac


POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_rainbow dir )
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs status vcs)

# Dir
# POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{black} $(print_icon 'LEFT_SUBSEGMENT_SEPARATOR') %F{white}"
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_FOREGROUND='011'  # yellow

# Final spaces to fix glyphs
POWERLEVEL9K_HOME_ICON='\uF015 '
POWERLEVEL9K_HOME_SUB_ICON='\uF07C '
POWERLEVEL9K_FOLDER_ICON='\uF115 '
POWERLEVEL9K_ETC_ICON='\uF013 '

# Git
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='006'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='006'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='006'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'

# Status
POWERLEVEL9K_STATUS_OK='false'

# Custom rainbow user@host
rainbow(){
    echo -n "%F{red}\uf004  %F{magenta}[%F{011}$USER%F{red}@%F{012}$HOST%F{magenta}]"
}
POWERLEVEL9K_CUSTOM_RAINBOW="rainbow"
POWERLEVEL9K_CUSTOM_RAINBOW_BACKGROUND="black"

# Extra space without background on the right side of right prompt
ZLE_RPROMPT_INDENT=0

# Don't show Git status in prompt for repositories whose workdir matches this pattern.
# For example, if set to '~', the Git repository at $HOME/.git will be ignored.
# Multiple patterns can be combined with '|': '~(|/foo)|/bar/baz/*'.
typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'

################################################################

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias top="vtop"
alias oldtop="/usr/bin/top"
alias yt2mp3="youtube-dl --extract-audio --audio-format mp3 --output '%(title)s.%(ext)s'"
alias black="xbacklight -steps 300 -time 2000 -set 0"
alias radio="mpv --ytdl-format=\"[height<360]\" --no-video https://www.youtube.com/watch\?v\=hHW1oY26kxQ"
alias brown="mpv --no-video https://youtu.be/hXetO_bYcMo"
alias vi3="nvim $HOME/.config/i3/config"
alias vip="nvim $HOME/.config/polybar/config"
alias vim="nvim"
alias w="nvim /home/panchi/Dropbox/vimwiki/index.wiki"
alias oldvim="vim"
alias invert="xcalib -invert -alter"
alias wttr="curl wttr.in/Buenos_Aires\?lang=es"
alias bc="bc -l"
alias gs="git status"
alias ga="git add --patch"
alias patri="mpv --script=~/.config/mpv/scripts/mpris.so --no-vid --shuffle Music/Patricio\ Rey"
alias pat="php artisan tinker"

cheat(){~/bin/cht.sh "$@" | less}

webmTOmp4 () {
      ffmpeg -i "$1".webm -qscale 0 "$1".mp4
}

#LSDeluxe alias
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/panchi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

prompt_context() {}

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1

#POWERLINE_BASH_SELECT=1
if [ IS_TTY ]; then
    export PS1='%B%F{red}[%F{yellow}%n%F{green}@%F{blue}%m %F{magenta}%~%F{red}]%b%f%# '
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag --depth 3 --hidden --ignore .git -U -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#zprof
