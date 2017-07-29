# Enable persistent REPL history for `node`.
NODE_REPL_HISTORY_FILE=~/.node_history;
# Allow 32³ entries; the default is 1000.
NODE_REPL_HISTORY_SIZE='32768';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';

# set default TERM environment variable
export TERM='xterm-256color'

# NVM_DIR
export NVM_DIR="$HOME/.nvm"

# compnay proxy
export PROXY_ADDR="http://proxy.wdf.sap.corp:8080"

# android home
export ANDROID_HOME="/home/admin/android"

# reduce lag to 0.2s when entering vi mode by esc
export KEYTIMEOUT=2

# path
export PATH=./node_modules/.bin:~/.bin:~/.local/bin/:/usr/bin/:/usr/sbin:$PATH

# fpath
export FPATH=~/.zfunctions:$FPATH
