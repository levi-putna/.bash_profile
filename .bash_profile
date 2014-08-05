#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.   Enviromental Configeration
#  2.   My Aliases
#  3.   File Management
#  4.   Shell Configeration
#
#  ---------------------------------------------------------------------------

####################################
### ENVIRONMENTAL CINFIGERATION  ###
####################################

# general path
PATH=$PATH:$HOME/Script

#export JAVA_HOME="/Library/Java/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home"
#PATH=/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home:$PATH
export PATH=/Applications/MAMP/bin/php/php5.5.10/bin:/usr/local/bin/phpunit:~/.composer/vendor/bin/:$PATH
            
export NARWHAL_ENGINE=jsc

export PATH="/usr/local/narwhal/bin:$PATH"

export CAPP_BUILD="/Users/levip/Build"


# Update PATH with private bin
export PATH="${HOME}/bin:${PATH}"


####################################
###          MY ALIASES          ###
####################################

alias cd..="cd .."

#alias l="ls -al"
l="ls -al"

#Allow webger
alias wget="curl -O"

#open file with sublime text
alias subtext='open -a "Sublime Text 2"'

# refresh shell
alias reload='source ~/.bash_profile'

# Echo all executable Paths
alias path='echo -e ${PATH//:/\\n}'         

alias selenium="java -jar /usr/local/bin/selenium-server-standalone-2.33.0.jar"

#Public facing IP Address
alias myip='curl ip.appspot.com'       

#display useful host related informaton
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }

####################################
###       FILE MANAGEMENT        ###
####################################

#Extract most know archives with one command
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

# Create a zip file from a derectory
zipf () { zip -r "$1".zip "$1" ; }       

#Search for files
alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string


####################################
###     SHELL CINFIGERATION      ###
####################################

#enables color in the terminal bash shell export
export CLICOLOR=1

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

#sets up the color scheme for list export
export LSCOLORS=exfxcxdxbxegedabagacad

#Git branch for use in prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/ '
}

export PS1="\n\[\033[1;34m\]\u\[\033[0m\]@\h:\[\033[1;35m\]\w\[\033[0m\] \[\033[32m\]\$(parse_git_branch)\[\033[00m\]\n$ "
export PS2=">> "

# Display variable for gitk
export DISPLAY=:0.0

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Set the default editor to nano. TODO: Test for nano/pico.
export EDITOR=nano

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Correct minor spelling errors in 'cd' commands.
shopt -s cdspell

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

