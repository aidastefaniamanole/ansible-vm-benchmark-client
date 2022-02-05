#!/bin/bash

if [ $# -ne 2 ]; then
    echo -e "Specify:\n - arg1 -> the number of clients to run the benchmark with\n - arg2 -> the IP address of the VictoriaMetrics VM"
    exit 1
fi

java -Xmx48g -jar benchmark-client-tool -noWorkers $1 -workloadFile workload.txt -vmIpAddr $2
