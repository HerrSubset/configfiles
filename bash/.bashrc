#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
# PS1='\u@\h \W$(__git_ps1 " (%s)") \n$ '
PS1='\e[1;33m\u@\h\[\e[0m\] \e[1;36m\w\[\e[0m\]\e[1;35m$(__git_ps1 " (%s)")\[\e[0m\]\n$ '
#PS1='\[\e[1;33m\][\u@\h \W]\$\[\e[0m\] '


alias ls='ls --color=auto'
alias vi=vim
alias atom="atom ."
alias rvim='vim +":set number tabstop=2 shiftwidth=2 expandtab" +":syntax on"'
alias dirs="dirs -v"
alias vpip="./flask/bin/pip"
alias update="sudo pacman -Syu"


# set some java stuff for maven to work
export JAVA_HOME=/usr/lib/jvm/default
export PATH=$PATH:$JAVA_HOME/bin/

#add gem folder to path
export PATH=$PATH:"/home/pyjamas/.gem/ruby/2.6.0/bin"

# add .bin folder to path
export PATH=$PATH:"/home/pyjamas/.bin/"

# Git prompt and autocomplete
source /usr/share/git/completion/git-prompt.sh
. /usr/share/git/completion/git-completion.bash


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export EDITOR=vim

# Go stuff
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"

alias emacs="emacs &"


# plex storage mounting
alias mntplex='sshfs plex@plex:/mnt/media /mnt/plex/'
alias umntplex='fusermount3 -u /mnt/plex'
alias monitortex='find . -name *.tex | entr -cs "pdflatex main.tex; pdflatex main.tex; killall -s SIGHUP mupdf"'


# function for easily accessing projects
export PROJECTS_FOLDER="/home/pyjamas/Projects"
p() {
		cd "$PROJECTS_FOLDER/$1"
}
__p_autocomplete() {
		local cur prev projects
		projects=`ls $PROJECTS_FOLDER`

		COMPREPLY=()
		cur="${COMP_WORDS[COMP_CWORD]}"
		COMPREPLY=( $(compgen -W "${projects}" -- ${cur}) )

		return 0
}
complete -o nospace -F __p_autocomplete p


# set vi mode
set -o vi

