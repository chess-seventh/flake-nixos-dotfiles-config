
# ****************************
# EXPORTS
# ****************************
# export TERM='rxvt-unicode-256color'
# export COLORTERM='rxvt-unicode-256color'

export DISABLE_AUTO_TITLE='true'

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/bin:$PATH"
export PATH="/usr/games:$PATH"
export PATH="/usr/local/games:$PATH"
export PATH="/usr/bin/javac:$PATH"
export PATH="/usr/lib/jvm/java-8-openjdk/jre/bin:$PATH"
export PATH="/usr/bin/java:$PATH"
export PATH="/usr/bin/java:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.node_modules/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.serverless/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.gloo/bin:$PATH"
export PATH="$HOME/.krew/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.nix-profile/bin:$PATH"

export npm_config_prefix=$HOME/.node_modules

export MOZ_PLUGIN_PATH="/usr/lib32/mozilla/plugins/:/usr/lib32/bin32-firefox/firefox32"
export TMUXP_CONFIGDIR=$HOME/.tmuxp

export BROWSER="/bin/qutebrowser"

export PASSWORD_STORE_X_SELECTION=primary
export PASSWORD_STORE_DIR="/home/seventh/.password-store/"
export EDITOR=nvim

export LAB=$HOME/src/lab/
export WORK=$HOME/src/work/
export PRO=$HOME/src/pro/dossierpro/Dossier_Pro/
export FACTURES=$HOME/src/pro/dossierpro/administration/factures/
export ADMIN=$HOME/src/pro/dossierpro/administration/
export MATES_DIR=$HOME/.contacts/default/
export PROJECT_HOME=$HOME/src/lab/
export WORKON_HOME=$HOME/.pyvirtualenvs

export MPD_HOST="127.0.0.1"
export MPD_PORT="6600"


if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
fi

export PASSWORD_STORE_ENABLE_EXTENSIONS=true


VIRTUALENVWRAPPER_PYTHON=/usr/sbin/python
PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
XDG_DATA_HOME=$HOME
ZSH_TMUX_AUTOQUIT='true'
DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true

HISTFILE=$HOME/.histfile
HISTSIZE=10000000
SAVEHIST=10000000

export TFENV_INSTALL_DIR="$HOME/.config/tfenv/"
