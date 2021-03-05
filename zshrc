export ZPLUG_HOME=/usr/local/opt/zplug

autoload -Uz compinit
compinit

# history settings
export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTFILE="/$HOME/.zsh_history"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export EDITOR=nvim
export VISUAL=nvim
export SSH_KEY_PATH="$HOME/.ssh"
export AWS_CONFIG_FILE="$HOME/.aws/config"
export GPG_TTY=$(tty)
export TERM=screen-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

setopt append_history
setopt bang_hist                # !keyword
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word         # allow completion from within a word/phrase
setopt auto_menu
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.
setopt auto_cd                  # if command is a path, cd into it
setopt auto_remove_slash        # self explicit
setopt chase_links              # resolve symlinks
setopt correct                  # try to correct spelling of commands
setopt extended_glob            # activate complex pattern globbing
setopt glob_dots                # include dotfiles in globbing
setopt print_exit_value         # print return value if non-zero
setopt no_beep                  # Disable sound
setopt prompt_subst

unsetopt beep
unsetopt beep                   # no bell on error
unsetopt bg_nice                # no lower prio for background jobs
unsetopt clobber                # must use >| to truncate existing files
unsetopt hist_beep              # no bell on error in history
unsetopt hup                    # no hup signal at shell exit
unsetopt ignore_eof             # do not exit on end-of-file
unsetopt list_beep              # no bell on ambiguous completion
unsetopt rm_star_silent

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

bindkey -v

if [[ ! -d "$ZPLUG_HOME" ]]; then
    echo "Installing zplug"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    source "$ZPLUG_HOME/init.zsh"
    zplug update
else
    source "$ZPLUG_HOME/init.zsh"
fi

fpath=("$DOTFILES/zsh/completions" $fpath)

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "tj/git-extras", use:"etc/git-extras-completion.zsh", defer:3, if:"[[ $(command -v git) ]]"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "MichaelAquilina/zsh-you-should-use"
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/vi-mode",   from:oh-my-zsh
zplug "mafredri/zsh-async", from:github
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

autoload -U promptinit; promptinit

if ! zplug check; then
    zplug install
fi

zplug load


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export GOPATH="/$HOME/dev/go"
export GOROOT="/usr/local/opt/go/libexec"

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Wireshark.app/Contents/MacOS:/bin:/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.rbenv/bin:$PATH"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[[ -f "${HOME}/.extras" ]] && source "${HOME}/.extras"
[[ -f "${HOME}/.aliases" ]] && source "${HOME}/.aliases"
[[ -f "${HOME}/.completions" ]] && source "${HOME}/.completions"
[[ -f "${HOME}/.private" ]] && source "${HOME}/.private"

eval "$(pyenv init -)"

if [[ $(command -v rbenv) ]]; then
    eval "$(rbenv init - zsh --no-rehash)"
fi

source <(kubectl completion zsh)


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lucas.santanna/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lucas.santanna/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lucas.santanna/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lucas.santanna/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
