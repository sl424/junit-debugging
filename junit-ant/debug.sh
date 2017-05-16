#! /usr/bin/sh                                                                 
                                                                               
cmd=$1                                                                         
src_path="./src"                                                               
debug_port=5005                                                                
path=$(pwd)                                                                    
test_src="./test"                                                              
run_src="./src"                                                                
lib_src="./libs"              

if [ $cmd = "test" ]; then
	ant run-test
elif [ $cmd  = "debug-test" ]; then
	ant debug-test
elif [ $cmd  = "jdb-test" ]; then
	jdb -attach localhost:$debug_port -sourcepath $test_src
fi
