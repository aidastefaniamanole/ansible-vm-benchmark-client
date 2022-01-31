#!/bin/bash

java -Xmx2g -jar benchmark-client-tool -queryMixer -insertFile $1 -queryFile5m $2 -queryFile24h $3
