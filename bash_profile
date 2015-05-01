export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export JAVA_HOME=$(/usr/libexec/java_home)

bash_prompt() {
  local status=$(git status 2> /dev/null | grep 'working directory clean')
  local dirty=''
  if [ -z "$status" ]; then
    local dirty='*'
  fi
  local branch=$(git branch 2> /dev/null | grep -e "\* " | sed "s/^..\(.*\)/\1/")
  if [ -z "$branch" ]; then
    export PS1="[$(date +%H:%M) \u@\h:\W] "
  else
    export PS1="[$(date +%H:%M) \u@\\h:\W $branch$dirty] "
  fi
}

export PROMPT_COMMAND="bash_prompt; $PROMPT_COMMAND"



function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
 }
 function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
 }
setjdk 1.7



mkdir -p $HOME/go 
export GOPATH=$HOME/go
PATH=${PATH}:${GOPATH}/bin
