#!/bin/bash

java -Xmx2g -jar benchmark-client-tool -preloadPhaseDuration 10 -noWorkers 8 -workloadFile workload.txt -vmIpAddr $1
