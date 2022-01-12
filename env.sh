#!/bin/bash 


cd /openairinterface5g
source oaienv
git checkout develop
git pull
cd /openairinterface5g/cmake_targets/
./build_oai -i -I --nrUE --build-lib "nrscope" 
process_id=$!
wait $process_id 
exit 

