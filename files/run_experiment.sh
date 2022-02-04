#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Specify the number of clients to run the benchmark with"
    exit 1
fi

java -Xmx8g -jar benchmark-client-tool -noWorkers $1 -workloadFile workload.txt -vmIpAddr $1
