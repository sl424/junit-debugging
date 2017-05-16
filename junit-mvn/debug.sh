#! /usr/bin/sh

cmd=$1
src_path="./src"
debug_port=5005
path=$(pwd)
test_src="./src/test/java"
run_src="./src/main/java"
lib_src="./libs"

# run the gradle test in debug mode
#gradle -DDEBUG=true test
if [ $cmd = "compile" ]; then 
	mvn compile
elif [ $cmd = "debug-test" ]; then 
	#mvn clean
	mvn -Dmaven.surefire.debug test
elif [ $cmd = "jdb-test" ]; then
	jdb -attach localhost:$debug_port -sourcepath $test_src
fi
