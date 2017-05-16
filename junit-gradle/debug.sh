#! /usr/bin/sh

cmd=$1
src_path="./src"
debug_port=5005
test_src="./src/test/java"
run_src="./src/main/java"
lib_src="./libs"
# run the gradle test in debug mode
#gradle -DDEBUG=true test
if [ $cmd = "debug-test" ]; then 
	gradle -DDEBUG=true test
elif [ $cmd = "jdb-run" ]; then
	jdb -attach localhost:$debug_port -sourcepath \
	$run_src:$test_src
elif [ $cmd = "jdb-test" ]; then
	jdb -attach localhost:$debug_port -sourcepath \
	$test_src:$run_src
fi
