#!/bin/bash


if [ $# -ne 2 ]; then
    echo -e "Specify:\n - arg1 -> scale of the experiment\n - arg2 -> the number of simulated days"
    exit 1
fi

SCALE=$1
DAYS=$2

(cd data-generation-tool/cmd/tsbs_generate_data/; SCALE=$SCALE ./run_data_generator.sh days $DAYS)
(cd data-generation-tool/cmd/tsbs_generate_queries/; QUERY=single-groupby-all-all-5m SCALE=$SCALE QUERIES=4032 ./run_query_generator.sh)
(cd data-generation-tool/cmd/tsbs_generate_queries/; QUERY=double-groupby-all SCALE=$SCALE QUERIES=14 ./run_query_generator.sh)
java -Xmx8g -jar benchmark-client-tool -queryMixer -insertFile ${SCALE}hosts \
    -queryFile5m single-groupby-all-all-5m.csv \
    -queryFile24h double-groupby-all.csv
