# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022



unset INTERACTIVE
case "$-" in
*i*)    INTERACTIVE=1;;
esac

#TODO: Don't think I want this anymore....
#if [ -n $INTERACTIVE ]
#then

  #Start ssh agent if we don't already have one
  # pgrep -u $USER ssh-agent >/dev/null
  # if [ $? -ne 0 ]
  # then
    # source ~/bin/.start-agent.sh
    # ssh-add
  # fi
#fi

# Try to switch to zsh
if [ -f "/bin/zsh" ]; then
  /bin/zsh
  exit
else

  # if running bash
  if [ -n "$BASH_VERSION" ]; then
      # include .bashrc if it exists
      if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
      fi
  fi

fi
