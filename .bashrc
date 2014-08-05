cl()
{
    if [ -d "$1"  ]; then
        cd "$1"
        ls -a
    fi
}

# Disable options:
shopt -u mailwarn
unset MAILCHECK     # I don't want my shell to warn me of incoming mail

# Enable options:
shopt -s cdspell
shopt -s sourcepath
shopt -s cmdhist
