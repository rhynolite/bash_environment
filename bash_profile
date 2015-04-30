export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export JAVA_HOME=$(/usr/libexec/java_home)





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
