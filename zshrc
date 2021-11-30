# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/s1893247/.oh-my-zsh"
export EDITOR='vim'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose git-prompt)

source $ZSH/oh-my-zsh.sh

# User configuration

# Cowsay at terminal startup
color=$(( ( RANDOM % 7 )  + 1 ))
wisdom=$(tput setaf $color;fortune iroh; tput setaf 7;) #| cowsay  -f tux
echo $wisdom

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls='ls -G'
alias ll='ls -alG'
alias l='ls -G'
alias nb_remote="ssh -L 8888:localhost:8888 s1893247@$EDDIE -N -f"
alias tlmgr="sudo tlmgr"
alias pip="pip3"
alias activate="source ./venv/bin/activate"
# Set OpenVINO environment variables
alias openvino="source /opt/intel/openvino/bin/setupvars.sh"
alias rsync="/usr/local/bin/rsync"
# Orgmode
alias orgmode="cd ~/beorg/Documents/org; vim ./"

# for conda
# alias conda="~/miniconda/bin/conda"

# for quick ssh
export SKYE=GIT@skye.bio.ed.ac.uk
export EDDIE=eddie.ecdf.ed.ac.uk

# for the matlab jupyter kernel
export MATLAB_EXECUTABLE="/Applications/MATLAB_R2019a.app/bin/matlab"
export PATH="/Library/TeX/texbin:$PATH"

# vi editing mode and settings
set -o vi

# Jupyter lab access on jura
function jllocal {
  port=5678
  remote_username=diane
  remote_hostname=jura.bio.ed.ac.uk
  url="http://localhost:$port"
  echo "Opening $url"
  open "$url"
  cmd="ssh -CNL localhost:"$port":localhost:"$port" $remote_username@$remote_hostname"
  echo "Running '$cmd'"
  eval "$cmd"
}

function tblocal {
  port=6006
  remote_username=diane
  remote_hostname=jura.bio.ed.ac.uk
  url="http://localhost:$port"
  echo "Opening $url"
  open "$url"
  cmd="ssh -CNL localhost:"$port":localhost:"$port" $remote_username@$remote_hostname"
  echo "Running '$cmd'"
  eval "$cmd"
}

# Keeps Conda from breaking Brew
# https://stackoverflow.com/questions/42859781/best-practices-with-anaconda-and-brew
brew() {
    local -a conda_envs
    while [ "$CONDA_SHLVL" -gt 0  ]; do
        conda_envs=("$CONDA_DEFAULT_ENV" $conda_envs)
        conda deactivate
    done
    command brew $@
    local brew_status=$?
    for env in $conda_envs; do
        conda activate "$env"
    done
    unset env
    return "$brew_status"
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/s1893247/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/s1893247/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/s1893247/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/s1893247/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

