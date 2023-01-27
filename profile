#!/bin/sh
# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                      $XDG_CONFIG_HOME/shell/profile                       ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ XDG base directories                                                      │
# ╰───────────────────────────────────────────────────────────────────────────╯
#   For more XDG variables, see here: 
#   -> specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

#   Define path to user-specific data files.
    export XDG_DATA_HOME="$HOME/.local/share"
#   Define path to user-specific configuration files.
    export XDG_CONFIG_HOME="$HOME/.config"
#   Define path to user-specific state data files.
    export XDG_STATE_HOME="" 
#   Define path to user-specific non-essential (cached) data files.
    export XDG_CACHE_HOME="$HOME/.cache"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Locale Setup                                                              │
# ╰───────────────────────────────────────────────────────────────────────────╯
#   These variables tell the OS how to display/output certain kinds of text.
#
#   There are several different locale categories, 
#   which are looked up by the system in the following order:
#   1. LANGUAGE
#   2. LC_ALL
#   3. LC_xxx
#   4. LANG
#   To see the current configuration, execute `locale` in your shell.

#   Default all locale settings to UTF-8 American English. 
    export LC_ALL="en_US.UTF-8"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Shell                                                                     │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Deactivate macOS's "Save/Restore Shell State" feature for Zsh.
#   This disables the creation of the `.zsh_sessions` file -> cleaner home.
    export SHELL_SESSIONS_DISABLE=1

#   Define path to shell-command history file.
    export HISTFILE="$XDG_CACHE_HOME/shell/history"
#   Define size of shell-command history file (nr. of entries).
    export HISTFILESIZE=10000000

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Editor & Visual (vi/vim/neovim/neovide)                                   │
# ╰───────────────────────────────────────────────────────────────────────────╯
#   If you invoke an editor via your shell:
#   -> It will first try `$VISUAL`.
#   -> If that fails, it tries `$EDITOR`.
#     (e.g. if your terminal does not support a full-screen editor)
#   One could e.g. set `$VISUAL` to VSCode, and `$EDITOR` to vi.
#   Since I'm using vi anyways, both variables are the same.

#   If the shell is running inside an SSH connection: Use vanilla vim.
    if [[ -n $SSH_CONNECTION ]]; then
      export EDITOR="vim"; 
#   Otherwise: Use neovim.
    else
      export EDITOR="nvim"
    fi

#   Configure $VISUAL to just use $EDITOR as well (both are vi/vim, anyway).
    export VISUAL="$EDITOR"     

#   Define path to neovim log file.
    export NVIM_LOG_FILE="$XDG_CACHE_HOME/nvim/log"   

#   TODO Look-up re: Define $VIMRUNTIME variable as well?
  # export VIMRUNTIME="$XDG_CONFIG_HOME/nvim/"

#   TODO Look-up re: Define $VIM variable as well?
  # export VIM="$XDG_CONFIG_HOME/vim"

#   Define path to neovim configuration file (init.vim).
  # export NVIMRC="$XDG_CONFIG_HOME/nvim/init.lua"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Browser                                                                   │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   TODO Look-up re: How to set Safari as default browser via env-var on macOS?
#   export BROWSER="safari"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Rust & Cargo                                                              │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Give a home to Rust...
    export RUSTUP_HOME="$XDG_CACHE_HOME/rustup"
#   ...and Cargo.
    export CARGO_HOME="$XDG_CACHE_HOME/cargo"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Python                                                                    │
# ╰───────────────────────────────────────────────────────────────────────────╯
#   NOTE: Switching the order of definition for the variables
#         $IPYTHONDIR & $JUPYTER_CONFIG_DIR weirdly seems to lead to 
#         an error on `jupyter notebook` execution.

#   Define path to the python-startup configuration file.
    export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/.pythonrc"

#   Define path to matplotlib configuration file.
    export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"

#   Define path to directory containing jupyter configuration files.
    export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"

#   Define path to ipython cache files.
    export IPYTHONDIR="$XDG_DATA_HOME/ipython"
    
#   Define path to pylint config file.
    export PYLINTRC="$XDG_CONFIG_HOME/pylint/pylintrc"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Julia                                                                     │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Define path to julia files.
    export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
    
# ╭───────────────────────────────────────────────────────────────────────────╮
# │ JavaScript, NodeJS, & NPM                                                 │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Define path to the Node Package Manager's configuration file.
    export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

#   Define path to Node REPL history file.
    export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node_repl_history"

#   Define number of Node REPL history entries.
    export NODE_REPL_HISTORY_SIZE=10000000

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Go                                                                        │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Define path to Go cache files.
    export GOPATH="$XDG_CACHE_HOME/go"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Exa                                                                       │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Increase the spacing between icon & file-name in exa.
    export EXA_ICON_SPACING="2"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Bat                                                                       │
# ╰───────────────────────────────────────────────────────────────────────────╯

    export BAT_THEME="Solarized (dark)"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ FuzzyFind                                                                 │
# ╰───────────────────────────────────────────────────────────────────────────╯
#   TODO Look-up/Decide re: Prefer `fd` over `rg`.

#   Determine search program for `fzf`.
    if type ag &> /dev/null; then
        export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
    fi                                  # NOTE: ^ nice!

#   Prefer `rg` over `ag`.
    if type rg &> /dev/null; then
        export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!{node_modules/*,.git/*,target/*,*.pyc,__pycache__/*}"'
        # export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules/*,.git/*,target/*,*.pyc,__pycache__/*}"'
    fi

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Databases (MySQL & PostgreSQL)                                            │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Setup databases on macOS.                                TODO Finish setup.
#   ───────────────────────────────────────────────────────────────────────────
    if [[ "$OSTYPE" == "darwin"* ]]; then
#   Setup PostgreSQL.
    export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
  # export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
  # export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
  # export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"
  # export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig"

  # export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
  # export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
  # export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
  # export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"

#   Setup MySQL.
    export PATH="$PATH:/Applications/MySQLWorkbench.app/Contents/MacOS"
  # export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
  # export LDFLAGS="-L/opt/homebrew/opt/mysql-client/lib"
  # export CPPFLAGS="-I/opt/homebrew/opt/mysql-client/include"
  # export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client/lib/pkgconfig"

#   Setup databases on Linux.
#   ───────────────────────────────────────────────────────────────────────────
    elif [[ "$OSTYPE" == "linux"* ]]; then

  # TODO Setup databases on Linux.
    echo 

    fi

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Docker                                                                    │
# ╰───────────────────────────────────────────────────────────────────────────╯
#   NOTE: the files created in the directory defined by $DOCKER_"CONFIG" 
#         look a lot more like cache/data files than config to me...

#   Define path to directory containing docker configuration files.
    export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ GPG                                                                       │
# ╰───────────────────────────────────────────────────────────────────────────╯
#   TODO: Complete GPG setup.

#   Define path to GPG data files.
    export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Less                                                                      │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Deactivate logging to history file.
    export LESSHISTFILE=- # "$HOME/.cache/lesshst"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ CocoaPods                                                                 │
# ╰───────────────────────────────────────────────────────────────────────────╯
#   TODO: find out: is $XDG_CACHE_HOME the right place? $XDG_DATA_HOME instead?

#   Setup cocoapods repos & cache to not be saved in ~/.cocoapods
    export CP_HOME_DIR="$XDG_CACHE_HOME/cocoapods"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Printers                                                                  │
# ╰───────────────────────────────────────────────────────────────────────────╯
#   Make sure that the file `~/.cups/lpoptions` is not be generated anymore.
#   See `https://www.cups.org/doc/man-cups.html` for more info.
#   -> TODO: Check whether the above works.

    export CUPS_CACHEDIR="$XDG_CACHE_HOME/cups"
    export CUPS_DATADIR="$XDG_DATA_HOME/cups"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ TaskWarrior (inactive)                                                    │
# ╰───────────────────────────────────────────────────────────────────────────╯

  # export TASKRC="$XDG_CONFIG_HOME/taskwarrior/taskrc"
  # export TIMEWARRIORDB="$HOME/gtd/timewarrior"
  # export WIKI="~/"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Various                                                                   │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Define path to user's custom symlinks.
    export CDPATH=".:$XDG_CONFIG_HOME/symlinks"

#   TODO ... (description)
    export PATH="$PATH:$HOME/.local/bin"  
#                         ^ added when installing virtualenv       TODO needed?

#   TODO ... (description)
    export PATH="$PATH:$CARGO_HOME/bin"            # <- all...
  # . "/Users/vinc/.cache/cargo/env"               # <- ...
  # source $HOME/.cargo/env                        # <- ...
  # source $HOME/.cargo/bin                        # <- ...
  # source "/Users/vinc/.cache/cargo/env"          # <- ...needed?

#   TODO ... (description)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        eval $(/opt/homebrew/bin/brew shellenv)    # needed for brew
        export PATH=$PATH:/opt/local/bin           # needed for macports
    elif [[ "$OSTYPE" == "linux"* ]]; then
        export XINITRC="$XDG_CONFIG_HOME/x/.xinitrc"
    fi

#   Setup LaTeX (not working)
  # if [ "$OS" = "macOS" ]; then
  #     PATH=/usr/local/texlive/2019/bin/x86_64-darwin:"${PATH}"
  # fi

