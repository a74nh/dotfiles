#!/bin/bash
###########################################################################################

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias f='find . -name'
alias ff='find . -type f -name'
alias ffe='find . -type f -executable -name'
fe() { find . -name $@ -printf '%p\n' -exec subl {} \;;}
alias sb='source ~/.bashrc'
alias grpe='grep'
alias vi='vim'
alias s='search'
alias s1='search -1'
alias hs='search -h'
alias si='search -i'
alias sj='search -j'
alias e='subl'
export EDITOR=vim
alias cdg='cd $(git rev-parse --show-toplevel)'

alias v="code -g"
alias vn="code -n -g"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias jigv='cd ~/work/IdealGraphVisualizer; JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home bash igv.sh & cd - >/dev/null'
alias jigv2='cd ~/work/IdealGraphVisualizer2; JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home bash igv.sh & cd - >/dev/null'
alias gigv='JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk1.8.0_252-jvmci-20.1-b02/Contents/Home ~/graal/idealgraphvisualizer/bin/idealgraphvisualizer'

for DIR in ~/work
do
  echo :$SANDBOX_PATH: | grep :$DIR: > /dev/null;
  test  $? -eq 1 -a -d $DIR && SANDBOX_PATH=$SANDBOX_PATH:$DIR;
done
SANDBOX_PATH=${SANDBOX_PATH#:}
export SANDBOX_PATH
for DIR in ~/java
do
  echo :$SANDBOX_JAVA_PATH: | grep :$DIR: > /dev/null;
  test  $? -eq 1 -a -d $DIR && SANDBOX_JAVA_PATH=$SANDBOX_JAVA_PATH:$DIR;
done
SANDBOX_JAVA_PATH=${SANDBOX_JAVA_PATH#:}
export SANDBOX_JAVA_PATH
if [[ -f $HOME/.localmachine ]]
then
 export LOCALMACHINE=1
fi


path_add()
{
  #Add my personal list of things to the path.
  for DIR in $@
  do
    echo $PATH | grep $DIR > /dev/null;
    test  $? -eq 1 -a -d $DIR && PATH=$DIR:$PATH;
  done;
}

if [[ -n "$HOMEBREW_PREFIX" ]]; then
  path_add $HOMEBREW_PREFIX/opt/findutils/libexec/gnubin $HOMEBREW_PREFIX/opt/grep/libexec/gnubin $HOMEBREW_PREFIX/opt/gnu-getopt/bin $HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin
fi

path_add $HOME/bin
path_add $HOME/graal/mx $HOME/dotnet/rcvm_scripts/ $HOME/bin/graal $HOME/bin/openjdk
path_add $HOME/.dotnet/tools


export JT_HOME=/home/ent-user/jtreg/jtreg-hg/build/images/jtreg

# setdisplay()
# {
#   export DISPLAY=`resolveip -s ${1:-$HOSTNAME}`:0.0;
#   echo "Set to $DISPLAY";
# }

thefuck --alias &>/dev/null
if [[ $? -eq 0 ]]
then
alias k='fuck'
fi



export ARMLMD_LICENSE_FILE=7010@euhpc-lic03.euhpc.arm.com


alias jgdb='gdb -ex jdk_start --args'
alias jgdbx='gdb -ex jdk_run_to_exit --args'

alias ggdb='mx --vmprefix="gdb -ex jdk_start --args" vm'


# which tmux &>/dev/null
# if [ $? -eq 0 ]
# then
#   echo
#   echo "[tmux]"
#   tmux list-sessions 2>/dev/null
# fi

alias gg='cd $(git rev-parse --show-toplevel)'

# module &>/dev/null
# if [[ $? -eq 127 && -f /arm/tools/setup/init/bash ]]
# then
# source /arm/tools/setup/init/bash
# module load arm/cluster
# module add core
# module add arm/license/production
# module load swdev
# module load gnu/binutils/2.22
# module load gnu/gcc/4.6.2
# module load git/git/1.8.3
# module load util
# module load gnu/bash/4.2
# module load gnu/emacs/24.1
# module load gnu/htop
# module load python/python/2.7.5
# module load python/setuptools_py2.7/0.6c11
# module load swdev gnu/autoconf/2.68
# module load swdev gnu/automake/1.11.6
# module add gnu/flex/2.5.35
# module add gnu/tar/1.23
# module add don_libes/expect/5.45
# module add gnu/dejagnu/1.5.1
# module add syslib xz/xz/5.0.1-1
# module add swdev gnu/automake/1.14
# module load meld/meld/1.8.4
# fi
