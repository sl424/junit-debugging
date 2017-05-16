#! /usr/bin/sh                                                                 
                                                                               
cmd=$1                                                                         
src_path="./"                                                               
debug_port=5005                                                                
path=$(pwd)                                                                    
test_src="./"                                                              
run_src="./"                                                                
lib_src="./libs"              

if [ $cmd = "compile" ]; then
	javac -cp junit-4.10.jar TestMessageUtil.java  MessageUtil.java TestRunner.java
elif [ $cmd  = "debug-test" ]; then
	java  -cp junit-4.10.jar:$path -agentlib:jdwp=transport=dt_socket,address=$debug_port,server=y,suspend=y TestRunner
elif [ $cmd  = "jdb-test" ]; then
	jdb -attach localhost:$debug_port -sourcepath $test_src
fi
