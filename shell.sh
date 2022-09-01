# Note: there is no shebang in this script. This script sets my preferred shell
# configuration and should be able to be sourced from any Bash-like shell or
# from Z shell.

# If we are not running interactively do not continue loading this file.
case $- in
    *i*) ;;
      *) return;;
esac

# Source any files in our ~/dotfiles folder.
if [ -x ~/dotfiles/bash ]; then
    for shellfile in ~/dotfiles/bash/*; do
        [ -r "$shellfile" ] && source "$shellfile"
    done
    unset shellfile
fi

# Set Editor
VISUAL=nano
EDITOR=nano

# Set a shell option but don't fail if it doesn't exist!
safe_set() { shopt -s "$1" >/dev/null 2>&1 || true; }

# Set some options to make working with folders a little easier. Note that we
# send all output to '/dev/null' as startup files should not write to the
# terminal and older shells might not have these options.
safe_set autocd         # Enter a folder name to 'cd' to it.
safe_set cdspell        # Fix minor spelling issues with 'cd'.
safe_set dirspell       # Fix minor spelling issues for commands.
safe_set cdable_vars    # Allow 'cd varname' to switch directory.
safe_set checkwinsize   # Resize windows and update Lines & Columns
safe_set checkjobs      #  stops the shell session from exiting if there are any jobs running in the background that haven’t finished yet
safe_set dotglob	# Bash includes filenames beginning with a ‘.’ in the results of filename expansion
safe_set direxpand      # perform any expansions of variables, tildes and the like right there for you in the command line if you tab to complete
safe_set execfail       # Interactive shell does not exit if exec fails
safe_set extglob        # If set, the extended pattern matching features are enabled
safe_set globstar       # the pattern ‘**’ used in a filename expansion context will match all files and zero or more directories and subdirectories. If the pattern is followed by a ‘/’, only directories and subdirectories match.
safe_set histreedit     # If set, and Readline is being used, a user is given the opportunity to re-edit a failed history substitution
safe_set hostcomplete   # hostcomplete
safe_set nocaseglob     # If set, Bash matches filenames in a case-insensitive fashion when performing filename expansion
safe_set nocasematch    # Bash matches patterns in a case-insensitive fashion when performing matching while executing case or [[ conditional commands, when performing pattern substitution word expansions, or when filtering possible completions as part of programmable completion


# Configure the history to make it large and support multi-line commands.
safe_set histappend                  # Don't overwrite the history file, append.
safe_set cmdhist                     # Multi-line commands are one entry only.
safe_set histverify
PROMPT_COMMAND='history -a'          # Before we prompt, save the history.
HISTSIZE=10000                       # A large number of commands per session.
HISTFILESIZE=100000                  # A huge number of commands in the file.
HISTCONTROL="ignorespace:ignoredup" # Ignore starting with space or duplicates?
export HISTIGNORE="ls:history"     # Any commands we want to not record?
# HISTTIMEFORMAT='%F %T '            # Do we want a timestamp for commands?
