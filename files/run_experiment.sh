#!/bin/bash

java -Xmx2g -jar benchmark-client-tool -noWorkers 100 -workloadFile workload.txt -vmIpAddr $1
