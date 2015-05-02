LIBS_DIR=utilities
MODULES_DIR=modules 

load_dir() {
	D=$1 
	if test -d $D ; then
		for F in $(find $D -type f) ; do 
			source $F 
		done 
	fi
}

load_dir $LIBS_DIR 
load_dir $MODULES_DIR
